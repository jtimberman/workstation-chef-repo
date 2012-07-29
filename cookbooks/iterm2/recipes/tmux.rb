#
# Cookbook Name:: iterm2
# Recipe:: tmux
#
# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright:: Copyright (c) 2012, Joshua Timberman
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform_version'].to_f < 10.7
  Chef::Log.warn("This recipe supports OS X Lion for iTerm 2's special flavor of tmux")
  Chef::Log.warn("Earlier versions of OS X are not supported at this time.")
  return
end

install_tmux_command = []
url_precompiled = ''
tmux_checksum = ''

if node['iterm2']['tmux_compile']
  install_tmux_command << 'sh autogen.sh'
  install_tmux_command << './configure'
  install_tmux_command << 'make'
  tmux_checksum = node['iterm2']['tmux_checksum']
else
  url_precompiled = '-precompiled'
  tmux_checksum = node['iterm2']['tmux_compiled_checksum']
end

install_tmux_command << 'make install'
tmux_url = "http://iterm2.googlecode.com/files/tmux-for-iTerm2-#{node['iterm2']['tmux_version']}#{url_precompiled}.tar.gz"
tmux_tar = "tmux-for-iTerm2-#{node['iterm2']['tmux_version']}#{url_precompiled}.tar.gz"


package "tmux" do
  action :remove
end

package "libevent" do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/#{tmux_tar}" do
  source tmux_url
  checksum tmux_checksum
end

unless ::File.exists?("#{Chef::Config[:file_cache_path]}/.tmux-for-iTerm2-installed")

  execute "autoconf directory to brew" do
    command "echo $(brew --prefix)/share/aclocal | sudo tee -a /usr/share/aclocal/dirlist"
    not_if "grep -qx $(brew --prefix)/share/aclocal /usr/share/aclocal/dirlist"
  end

  execute "untar tmux-for-iTerm2" do
    command "tar -zxf #{tmux_tar}"
    cwd Chef::Config[:file_cache_path]
  end

  execute "install tmux-for-iTerm2" do
    command install_tmux_command.join(" && ")
    cwd "#{Chef::Config[:file_cache_path]}/tmux-for-iTerm2-#{node['iterm2']['tmux_version']}"
  end

  file "#{Chef::Config[:file_cache_path]}/.tmux-for-iTerm2-installed"
end
