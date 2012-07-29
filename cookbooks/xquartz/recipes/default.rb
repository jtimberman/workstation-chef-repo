#
# Cookbook Name:: xquartz
# Recipe:: default
#
# Copyright 2012, Joshua Timberman
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

unless node['platform'] == 'mac_os_x' && node['platform_version'].to_f >= 10.8
  Chef::Log.warn "#{cookbook_name} is really only suitable for OS X 10.8+,"
  Chef::Log.warn "as X11 is available in earlier releases."
  return
end

dmg_package "XQuartz" do
  source node['xquartz']['url']
  checksum node['xquartz']['checksum']
  volumes_dir "XQuartz-#{node['xquartz']['version']}"
  type "pkg"
end
