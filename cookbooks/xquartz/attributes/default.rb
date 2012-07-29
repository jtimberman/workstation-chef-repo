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

default['xquartz']['version'] = "2.7.2"
default['xquartz']['url'] = "http://static.macosforge.org/xquartz/downloads/SL/XQuartz-#{node['xquartz']['version']}.dmg"
default['xquartz']['checksum'] = "83ef52c93cd98213a6b847c3429359433d8cc16937007ba7ba41ad5588b6fd82"
