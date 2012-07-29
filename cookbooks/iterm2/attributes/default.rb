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

default['iterm2']['version']  = "-1_0_0_20120123"
default['iterm2']['checksum'] = "1c9ce81fc60c329dee0755d9b5dc7888ea96d1642d244ede2ce6bca3cabd6920"

# Support for iTerm2's tmux integration
default['iterm2']['tmux_enabled']  = false
default['iterm2']['tmux_compile']  = false
default['iterm2']['tmux_version']  = "20120108"
default['iterm2']['tmux_checksum'] = "b97b9426959f18c60225c56ec1400fe48b500c422cef15e154b7ea61c2191cc0"
default['iterm2']['tmux_compiled_checksum'] = "d238e2b03bcfa9c6c6b6d294344eea9ec0dd938f2c915165391a2c3f6909d352"
