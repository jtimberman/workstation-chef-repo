#
# Cookbook Name:: 1password
# Recipe:: default
#
# Copyright 2011, Joshua Timberman
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

remote_file "#{Chef::Config[:file_cache_path]}/1Password-#{node['one_password']['version']}.zip" do
  checksum node['one_password']['checksum']
  source "http://aws.cachefly.net/aws/dmg/1PW3/English/1Password-#{node['one_password']['version']}.zip"
end

execute "unzip 1password" do
  command "unzip #{Chef::Config[:file_cache_path]}/1Password-#{node['one_password']['version']}.zip"
  cwd "/Applications"
  not_if { ::File.directory?("/Applications/1Password.app") }
end
