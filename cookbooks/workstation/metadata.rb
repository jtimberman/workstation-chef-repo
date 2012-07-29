maintainer       "Joshua Timberman"
maintainer_email "opensource@housepub.org"
license          "Apache 2.0"
description      "Configures Mac OS X and Linux workstations"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.2.0"

%w{ dmg homebrew }.each do |cb|
  depends cb
end
