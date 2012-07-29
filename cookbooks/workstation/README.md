I use this cookbook to manage my OS X workstations. It uses a couple of
data bags to set up my user's local environment.

Requirements
============

Should work on any version of Chef after 0.10.0.

"Works on My Machine"(tm):

- Mac OS X 10.6, 10.7, 10.8
- Ubuntu 10.04, 12.04.

I've used earlier versions of this cookbook on Windows as well, but
only as a partial effort to test, as I don't run Windows as a
workstation/desktop system anymore.

Your mileage may vary. See __Support__ below if you have questions.

## Data Bags

You need two data bags:

* apps, with a "workstation" item.
* users, with a USERNAME item, where username is your login. To find
  out what this is, run:

``` shell
ruby -retc -e 'puts Etc.getlogin'
```

The `HOME` environment variable is used for a number of things. To see
what this is on your system, run:

``` shell
ruby -e 'puts ENV["HOME"]'
```

See __Usage__ for information about what might go into the data bag items.

Libraries
=========

The `homebrew.rb` library file contains a Chef::Recipe helper method,
`use_brew?` that checks to see if the default package provider for the
node's platform is Homebrew (when using the `homebrew` cookbook).

Recipes
=======

## default

This recipe does the bulk of the work. It reads the workstation data
bag item for various parts and then builds resources for their
contents.

If the package provider is homebrew, the `brew_packages` are
installed.

If the `dirs` array has elements, each directory is created in `ENV['HOME']`.

If the user data bag has a `repos` key, each of the repositories
specified is cloned with git to the target location.

If the system is OS X, the recipe will also drop off all plist files
in the data bag's array `plists` to `~/Library/Preferences` using the
`mac_os_x_plist` LWRP (in the `mac_os_x` cookbook). The files must be
copied to `files/default` of this cookbook.

If the system is OS X, any disk image-based apps in `dmgs` will be installed with the
`dmg_package` LWRP (in the `dmg` cookbook).

## caps_control

Mac OS X notoriously does not make it very easy to switch caps lock to
control (as God, or Emacs users intended) without using the System
Preferences widget. It takes less time to just do this one thing
across all my workstations for all my keyboards than to try and
automate it, as I've tried.

Windows however makes it a registry entry away, so that might work for
you. You'll need the "windows" cookbook for the `windows_registry` LWRP.

Usage
=====

Required structure of the `users/USERNAME.json` data bag for the
default recipe:

``` javascript
{
  "id": "USERNAME",
  "repos": {
    "path_under_$HOME": {
      "repo": "git_url_to_repository",
      "revision": "HEAD"
    }
  }
}
```

This data bag item can also be used in conjunction with Opscode's
`users` cookbook, or for other purposes.

Required structure of the `apps/workstation.json` data bag item for
the default recipe:

``` javascript
{
  "id": "workstation",
  "dmgs": {
    "AppName": {
      "url": "url://to-download/AppName.dmg",
      "checksum": "SHA256 Checksum of AppName.dmg"
    }
  },
  "plists": [
    "com.foo.bar.plist" // writes ~/Library/Preferences/com.foo.bar.plist
  ],
  "packages": {
    "package_name_for_linux": ""
  },
  "brew_packages": {
    "package_name_for_homebrew": ""
  },
  "dirs": [
    "dirname",
    "dirname2"
  ]
}
```

Limitations
===========

This cookbook is opinionated. Your opinions may not match mine. I
tried to make the default recipe as dynamic and configurable
through data bags as reasonable.

I don't know if this works with Chef Solo. I don't use Chef Solo
except to set up Chef Servers.

Repositories can only be git at this time, because I don't use
subversion.

Tune this and make it your own. Workstations are personal things.

Support
=======

This cookbook is not supported or maintained by Opscode, Inc.

I am happy to answer questions in *my free time* via
[email](mailto:opensource@housepub.org). If you have general Chef
questions, I encourage you to participate in the community
[irc channel](irc://irc.freenode.net/chef) or
[mailing lists](http://lists.opscode.com)

I will not merge pull requests for this cookbook.

License and Author
==================

- Author: [Joshua Timberman](mailto:opensource@housepub.org)
- Copyright (c) 2012, [Joshua Timberman](mailto:opensource@housepub.org)
- License: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
