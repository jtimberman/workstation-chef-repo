#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2010-2011, Joshua Timberman
# Copyright 2009, Opscode, Inc.
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
sysadmin_group = Array.new
users = Array.new

search(:users) do |u|
  sysadmin_group << u['id'] if u['groups'].include?("sysadmin")
  users << u['id']

  if node[:apache] and node[:apache][:allowed_openids]
    Array(u['openid']).compact.each do |oid|
      node[:apache][:allowed_openids] << oid unless node[:apache][:allowed_openids].include?(oid)
    end
  end

  case node[:platform]
  when "mac_os_x"
    home_dir = "/Users/#{u['id']}"
    group_id = 'staff'
  else
    home_dir = "/home/#{u['id']}"
    group_id = u['id']
  end

  unless node[:platform] == 'mac_os_x'
    group u['id'] do
      gid u['uid']
    end

    user u['id'] do
      uid u['uid']
      group group_id
      shell u['shell']
      comment u['comment']
      supports :manage_home => true
      home home_dir
      if u['password']
        password u['password']
      end
    end
  end

  if u.has_key?("ssh_keys")
    directory "#{home_dir}/.ssh" do
      owner u['id']
      group group_id
      mode "0700"
    end

    template "#{home_dir}/.ssh/authorized_keys" do
      source "authorized_keys.erb"
      owner u['id']
      group group_id
      mode "0600"
      variables :ssh_keys => u['ssh_keys']
    end
  end

  if u.has_key?("directories")
    u["directories"].each do |dir|

      directory dir do
        recursive true
      end

    end
  end

  if u.has_key?("files")
    u["files"].each do |filename, file_data|

      directory "#{home_dir}/#{File.dirname(filename)}" do
        recursive true
        mode 0755
      end if file_data['subdir']

      cookbook_file "#{home_dir}/#{filename}" do
        source "#{u['id']}/#{file_data['source']}"
        owner u['id']
        group group_id
        mode file_data['mode']
        ignore_failure true
        backup 0
      end

    end
  end
end

unless node[:platform] == 'mac_os_x'
  group "sysadmin" do
    gid 2300
    members sysadmin_group.sort
  end
  group "users" do
    members users
  end
end
