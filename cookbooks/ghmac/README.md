Description
===========

Installs GitHub Mac.

Changes
=======

## v1.1.0:

* Update to GitHub for Mac version 1.1.

Requirements
============

OS X and a GitHub account (to use the app).

Attributes
==========

See `attributes/default.rb` for default values.

* `node['ghmac']['url']` - URL to retrieve the zip file.
* `node['ghmac']['checksum']` - sha256sum of the zip file.
* `node['ghmac']['version']` - version of GitHub Mac.
* `node['ghmac']['install_to']` - location to extract the .zip.

Usage
=====

Add 'ghmac' recipe to a node and run Chef.

License and Author
==================

Author:: Joshua Timberman <opensource@housepub.org>
Copyright:: Copyright (c) 2011, Joshua Timberman
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
