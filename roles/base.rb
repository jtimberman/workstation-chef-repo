name "base"
description "Base role for all nodes"

# This role has no run list as it is included for its attributes in
# the OS specific roles (mac_os_x or ubuntu) that I use.

# Override attributes are used because this is a nested role and
# precedence may be confusing in some setups.
override_attributes(
  # If you're using the sudo cookbook, it can use these attributes for
  # USERNAME
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel"],
      "users" => ["USERNAME"],
      "passwordless" => true
    }
  },
  # I use Fletcher Nicol's ruby_build and rbenv cookbooks with these
  # attributes. Adjust values to taste, and modify the RubyGems to
  # install if you wish.
  # Because I use Opscode's "git" cookbook which installs git as an OS
  # X package, I set the install_pkgs array to empty so it doesn't try
  # to install Git (via homebrew).
  "ruby_build" => {
    "git_ref" => "v20120524",
    "upgrade" => true,
    "install_pkgs" => []
  },
  "rbenv" => {
    "install_pkgs" => [],
    # The version of Ruby should match across all of rubies, global,
    # and the keys of the gems hash.
    "user_installs" => [
      {
        "user" => "USERNAME",
        "rubies" => ["1.9.3-p194"],
        "global" => "1.9.3-p194",
        "gems" => {
          "1.9.3-p194" => [
            # RubyGems
            {"name" => "bundler", "version" => "1.1.1"},
            {"name" => "gem-man"},
            {"name" => "gemcutter"},
            {"name" => "jeweler"},
            {"name" => "rake"},
            # Chef/Knife
            # A note about Chef - I use this one for day to day knife
            # and other purposes, but when I run Chef, it is with the
            # "omnibus" full stack package, and /usr/bin/chef-client.
            {"name" => "chef", "version" => "10.12.0"},
            {"name" => "knife-config"},
            {"name" => "knife-essentials"},
            {"name" => "knife-ec2"},
            {"name" => "ohai", "version" => "6.14.0"},
            {"name" => "rspec-core", "version" => "2.5.0"},
            # Documentation
            {"name" => "awesome_print"},
            {"name" => "bluecloth"},
            {"name" => "kramdown"},
            {"name" => "org-ruby"},
            {"name" => "prawn"},
            {"name" => "ronn"},
            {"name" => "sdoc"},
            # Git/GitHub
            {"name" => "gist"},
            {"name" => "git"},
            {"name" => "git-up"},
            {"name" => "github"},
            {"name" => "github_api"},
            {"name" => "grit"},
            {"name" => "hub"},
            # Tools
            {"name" => "cheat"},
            {"name" => "ghost"},
            {"name" => "net-sftp"},
            {"name" => "net-ssh-multi"},
            {"name" => "pry"},
            {"name" => "ubuntu_ami"},
            {"name" => "vagrant", "version" => "1.0.3"},
            {"name" => "veewee"}
          ]
        }
      }
    ]
  }
)
