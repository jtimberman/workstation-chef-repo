#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright 2010-2012, Joshua Timberman
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

begin
  wk = data_bag_item("apps","workstation")
  u  = data_bag_item("users", Etc.getlogin)
rescue Net::HTTPServerException => e
  Chef::Application.fatal!("#{cookbook_name} could not load data bag; #{e}")
end

if use_brew?
  wk['brew_packages'].each do |p,o|
    package p do
      action :install
      options o if o && o.length > 0
    end
  end
else
  wk['packages'].each do |p,o|
    package p do
      action :install
    end
  end
end

wk['dirs'].each do |dir|

  directory "#{ENV['HOME']}/#{dir}" do
    recursive true
  end

end

if u.has_key?("repos")
  u["repos"].each do |target, repo|

    git "#{ENV['HOME']}/#{target}" do
      repository repo['repo']
      reference repo['revision']
      action :sync
      user u['id']
    end

  end
end

case node['platform']
when "mac_os_x"

  directory "#{ENV['HOME']}/Applications"

  execute "killall Dock" do
    action :nothing
  end

  wk['plists'].each do |plist|

    mac_os_x_plist_file plist

  end

  wk['dmgs'].each do |pkg, data|
    dmg_package pkg do
      app data['app'] if data.has_key?('app')
      volumes_dir data['volumes_dir'] if data.has_key?('volumes_dir')
      dmg_name data['dmg_name'] if data.has_key?('dmg_name')
      destination data['destination'] if data.has_key?('destination')
      type data['type'] if data.has_key?('type')
      source data['url']
      checksum data['checksum']
    end
  end
end
