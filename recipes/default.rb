#
# Cookbook Name:: apt-mirror
# Recipe:: default
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

package 'apt-mirror' do
  action :install
end

directory node['apt-mirror']['base_path'] do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end

repository_locations = []

node['apt-mirror']['data_bags'].each do |bag|
  repos = data_bag_item('apt-mirror', bag)
  repos['source'].each do |repo|
    repository_locations.push(repo)
  end
end

template '/etc/apt/mirror.list' do
  source 'mirror.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables(
    base_path: node['apt-mirror']['base_path'],
    defaultarch: node['apt-mirror']['defaultarch'],
    run_postmirror: node['apt-mirror']['run_postmirror'],
    nthreads: node['apt-mirror']['nthreads'],
    _tilde: node['apt-mirror']['_tilde'],
    repository_locations: repository_locations
  )
end

if node['apt-mirror']['cron']['active']
  cron 'update_repository_mirrors' do
    minute node['apt-mirror']['cron']['minute']
    hour node['apt-mirror']['cron']['hour']
    day node['apt-mirror']['cron']['day']
    weekday node['apt-mirror']['cron']['weekday']
    command '/usr/bin/apt-mirror > /var/spool/apt-mirror/var/cron.log'
    action :create
  end
else
  cron 'update_repository_mirrors' do
    action :delete
  end
end
