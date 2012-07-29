# 
# Author:: Joshua Timberman <opensource@housepub.org>
# Copyright:: Copyright (c) 2011, Joshua Timberman
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

default['ghmac']['version'] = '1.1'
default['ghmac']['url'] = "https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%20#{ghmac['version']}.zip"
default['ghmac']['checksum'] = "8c3d2c0be3c6a63d2e7baa1f36e8da83c6c960292b2a1de940afce804d508252"
default['ghmac']['install_to'] = "/Applications"
