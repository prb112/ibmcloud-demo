################################################################
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2022
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################

// primary_ipv4_address deprecation
output "primary_ipv4_address" {
  # value = ibm_is_instance.example.primary_network_interface.0.primary_ipv4_address // will be deprecated in future
  value = ibm_is_instance.custom_instance.primary_network_interface.0.primary_ip.0.address // use this instead
}