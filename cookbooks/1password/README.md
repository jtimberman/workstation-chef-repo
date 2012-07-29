Description
===========

Downloads the 1Password trial version and untars it in /Applications

Requirements
============

Mac OS X. You must supply your own License Key for 1Password

Attributes
==========

* `node['one_password']['version']` - sets the version of 1password, default 3.5.7.
* `node['one_password']['checksum']` - sets the sha256sum of the zip file.

Usage
=====

Include the '1password' recipe in the node run list to install the 1Password application.

License and Author
==================

Sets up a server to be a public nameserver. To modify resource records in the environment, modify the tinydns-data.erb template.

LICENSE AND AUTHOR
==================

Author:: Joshua Timberman (<joshua@housepub.org>)

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
