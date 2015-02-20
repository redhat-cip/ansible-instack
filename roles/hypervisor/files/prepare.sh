#!/bin/bash
#
# Copyright (C) 2014 eNovance SAS <licensing@enovance.com>
#
# Author: Yanis Guenane <yanis.guenane@enovance.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
set -eux
image_path="/var/lib/libvirt/images"
qemu-img create -f qcow2 -b $image_path/undercloud_original.qcow2 $image_path/undercloud.qcow2 200G
genisoimage -output $image_path/seed-undercloud.iso -volid cidata -joliet -rock /tmp/user-data roles/hypervisor/files/seed/undercloud/meta-data