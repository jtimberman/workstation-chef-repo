name "mac_os_x"
description "Role applied to all Mac OS X systems."
run_list(
  "role[base]",
  "recipe[build-essential]",
  "recipe[homebrew]"
)
