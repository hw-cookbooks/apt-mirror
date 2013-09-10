#
# Cookbook Name:: apt-mirror
# Recipe:: nginx
#
# Copyright 2013, Heavy Water Operations
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt-mirror'
package 'nginx'

repository_information = data_bag('apt-mirror').map do |mirror|
  repository = data_bag_item('apt-mirror', mirror)
  [repository['id'], repository['fqdn']]
end

template '/etc/nginx/sites-available/apt-mirrors' do
  source  'nginx-mirrors.erb'
  mode    '0644'
  owner   'root'
  group   'root'
  variables(
    :port => node['apt-mirror']['nginx']['port'],
    :server_name => node['fqdn'],
    :mirror_path => File.join(node['apt-mirror']['base_path'], "/mirror/"),
    :repository_information => repository_information
  )
end

link '/etc/nginx/sites-enabled/apt-mirrors' do
  to '/etc/nginx/sites-available/apt-mirrors'
  link_type :symbolic
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action :enable
end
