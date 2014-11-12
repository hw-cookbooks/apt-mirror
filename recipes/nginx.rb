#
# Cookbook Name:: apt-mirror
# Recipe:: nginx
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
include_recipe 'nginx'

template '/etc/nginx/sites-available/apt-mirrors' do
  source  'nginx-mirrors.erb'
  mode    '0644'
  owner   'root'
  group   'root'
  variables(
    :port => node['apt-mirror']['nginx']['port'],
    :server_name => node['fqdn'], 
    :mirror_path => File.join(node['apt-mirror']['base_path'], "/mirror/"),
    :nginx_aliases => node['apt-mirror']['nginx']['aliases']
  )
end

#enable the apt-mirror site
nginx_site "apt-mirrors"