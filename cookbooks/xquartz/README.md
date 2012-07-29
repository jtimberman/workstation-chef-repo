Description
===========

Installs XQuartz on Mac OS X 10.8 to provide an X11 server.

This is not required on earlier versions of OS X as they include X11.

After installation, you need to log out and back in for XQuartz to be
usable as the X11 server.

Requirements
============

## Platform:

* Mac OS X, 10.8 or higher

## Cookbooks:

* dmg

Attributes
==========

* `node['xquartz']['version']` - Version to install.
* `node['xquartz']['url']` - Download URL.
* `node['xquartz']['checksum']` - SHA256 checksum of downloaded dmg.

License and Author
==================

Author:: Joshua Timberman <opensource@housepub.org>
Copyright:: Copyright (c) 2012, Joshua Timberman
License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
