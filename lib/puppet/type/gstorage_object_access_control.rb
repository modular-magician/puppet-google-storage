# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/storage/property/bucket_name'
require 'google/storage/property/enum'
require 'google/storage/property/integer'
require 'google/storage/property/objectaccesscontrol_project_team'
require 'google/storage/property/string'
require 'puppet'

Puppet::Type.newtype(:gstorage_object_access_control) do
  @doc = <<-DOC
    The ObjectAccessControls resources represent the Access Control Lists (ACLs) for objects within
    Google Cloud Storage. ACLs let you specify who has access to your data and to what extent.
    There are two roles that can be assigned to an entity: READERs can get an object, though the
    acl property will not be revealed. OWNERs are READERs, and they can get the acl property,
    update an object, and call all objectAccessControls methods on the object. The owner of an
    object is always an OWNER. For more information, see Access Control, with the caveat that this
    API uses READER and OWNER instead of READ and FULL_CONTROL.
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  ensurable

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the ObjectAccessControl.'
  end

  newproperty(:bucket, parent: Google::Storage::Property::BucketNameRef) do
    desc 'The name of the bucket.'
  end

  newproperty(:domain, parent: Google::Storage::Property::String) do
    desc 'The domain associated with the entity. (output only)'
  end

  newproperty(:email, parent: Google::Storage::Property::String) do
    desc 'The email address associated with the entity. (output only)'
  end

  newproperty(:entity, parent: Google::Storage::Property::String) do
    desc <<-DOC
      The entity holding the permission, in one of the following forms:  * user-{{userId}}  *
      user-{{email}} (such as "user-liz@example.com")  * group-{{groupId}}  * group-{{email}} (such
      as "group-example@googlegroups.com")  * domain-{{domain}} (such as "domain-example.com")  *
      project-team-{{projectId}}  * allUsers  * allAuthenticatedUsers
    DOC
  end

  newproperty(:entity_id, parent: Google::Storage::Property::String) do
    desc 'The ID for the entity (output only)'
  end

  newproperty(:generation, parent: Google::Storage::Property::Integer) do
    desc 'The content generation of the object, if applied to an object. (output only)'
  end

  newproperty(:id, parent: Google::Storage::Property::String) do
    desc 'The ID of the access-control entry. (output only)'
  end

  newproperty(:object, parent: Google::Storage::Property::String) do
    desc 'The name of the object, if applied to an object.'
  end

  newproperty(:project_team, parent: Google::Storage::Property::ObjectAccessControlProjectteam) do
    desc 'The project team associated with the entity (output only)'
  end

  newproperty(:role, parent: Google::Storage::Property::Enum) do
    desc 'The access permission for the entity.'
    newvalue(:OWNER)
    newvalue(:READER)
  end
end
