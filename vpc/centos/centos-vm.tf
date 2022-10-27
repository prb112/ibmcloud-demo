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

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.ibmcloud_region
  zone             = var.ibmcloud_zone
}

data "ibm_resource_group" "cur_group" {
  name = var.resource_group
}

# Link https://cloud.ibm.com/docs/vpc?topic=vpc-profiles&interface=ui
resource "ibm_is_instance" "custom_instance" {
  name    = var.name
  image   = var.image_id
  profile = var.profile
  metadata_service_enabled  = false
  resource_group = data.ibm_resource_group.cur_group.id

  primary_network_interface {
    subnet = var.subnet
    allow_ip_spoofing = true
  }

  network_interfaces {
    name   = "eth1"
    subnet = var.subnet
    allow_ip_spoofing = false
  }

  vpc  = var.vpc
  zone = var.ibmcloud_zone
  keys = [
    var.ssh_key_id1,
    var.ssh_key_id2,
    var.ssh_key_id3,
  ]

  //User can configure timeouts
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
