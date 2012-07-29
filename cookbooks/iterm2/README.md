Description
===========

Installs [iTerm2](http://code.google.com/p/iterm2/) in /Applications.

Requirements
============

## Platform

* Mac OS X

## Cookbooks

Added as a dependency in 1.2.0:

* [homebrew](http://community.opscode.com/cookbooks/homebrew)

Attributes
==========

See `attributes/default.rb` for default values.

* `node['iterm2']['version']` - sets the version to download
* `node['iterm2']['checksum']` - sets the sha256sum of the zip file
* `node['iterm2']['tmux_enabled']` - if true, the `iterm2::tmux` recipe will be included
* `node['iterm2']['tmux_compile']` - if true, the special tmux version from the iterm2 site will be compiled
* `node['iterm2']['tmux_version']` - the version string of the tmux tarball to download from the iterm2 site.
* `node['iterm2']['tmux_checksum']` - checksum of the source tarball of tmux
* `node['iterm2']['tmux_compiled_checksum']` - checksum of the precompiled binary tarball of tmux

Usage
=====

By default, this cookbook will install the iTerm2 application to /Applications, and if you have customized settings, copy `~/Library/Preferences/com.googlecode.iterm2.plist` to `files/default` to have your preferences managed by Chef on all your machines :).

The latest versions of iTerm 2 have integrated support for the terminal multiplexer, [tmux](http://code.google.com/p/iterm2/wiki/TmuxIntegration). As of version 1.2.0, this cookobook supports installing the custom tmux required to use this integration. By default, this is not enabled via the attribute `node['iterm2']['tmux_enabled']` (false). To enable the integrated tmux support in iTerm2, set that attribute to true through a role. By default, the recipe will download the precompiled binaries. If the attribute `node['iterm2']['tmux_compile']` is set true, then the binaries will be compiled. There appears to be some issues with the automake/autoreconf done by the scripts, so it may not work. The precompiled binaries require Mac OS X Lion.

Changes
=======

## v1.2.0:

* Install iTerm 2 v1.0.0 20120123 (tmux support)
* Add tmux recipe to enable installing tmux with iTerm 2 support
* homebrew cookbook is now a dependency.

## v1.1.0:

* Install iTerm 2 v1.0.0.
* Cookbook Incompatibility: resource names and paths changed based on upstream.

## v1.0.3:

* Update version to 1.0.3

## v1.0.2:

* Drop off a config file if it exists.

License and Author
==================

Author:: Joshua Timberman (<cookbooks@housepub.org>)

Copyright 2011, Joshua Timberman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
