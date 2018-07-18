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

require 'google/hash_utils'
require 'google/object_store'
require 'google/storage/network/delete'
require 'google/storage/network/get'
require 'google/storage/network/post'
require 'google/storage/network/put'
require 'google/storage/property/boolean'
require 'google/storage/property/bucket_acl'
require 'google/storage/property/bucket_action'
require 'google/storage/property/bucket_condition'
require 'google/storage/property/bucket_cors'
require 'google/storage/property/bucket_default_object_acl'
require 'google/storage/property/bucket_lifecycle'
require 'google/storage/property/bucket_logging'
require 'google/storage/property/bucket_name'
require 'google/storage/property/bucket_owner'
require 'google/storage/property/bucket_predefined_default_object_acl'
require 'google/storage/property/bucket_project_team'
require 'google/storage/property/bucket_role'
require 'google/storage/property/bucket_rule'
require 'google/storage/property/bucket_storage_class'
require 'google/storage/property/bucket_team'
require 'google/storage/property/bucket_type'
require 'google/storage/property/bucket_versioning'
require 'google/storage/property/bucket_website'
require 'google/storage/property/integer'
require 'google/storage/property/string'
require 'google/storage/property/string_array'
require 'google/storage/property/time'
require 'puppet'

Puppet::Type.type(:gstorage_bucket).provide(:google) do
  mk_resource_methods

  def self.instances
    debug('instances')
    raise [
      '"puppet resource" is not supported at the moment:',
      'TODO(nelsonjr): https://goto.google.com/graphite-bugs-view?id=167'
    ].join(' ')
  end

  def self.prefetch(resources)
    debug('prefetch')
    resources.each do |name, resource|
      project = resource[:project]
      debug("prefetch #{name}") if project.nil?
      debug("prefetch #{name} @ #{project}") unless project.nil?
      fetch = fetch_resource(resource, self_link(resource), 'storage#bucket')
      resource.provider = present(name, fetch, resource) unless fetch.nil?
      Google::ObjectStore.instance.add(:gstorage_bucket, resource)
    end
  end

  def self.present(name, fetch, resource)
    result = new(
      { title: name, ensure: :present }.merge(fetch_to_hash(fetch, resource))
    )
    result
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.fetch_to_hash(fetch, resource)
    {
      acl: Google::Storage::Property::BucketAclArray.api_munge(fetch['acl']),
      cors: Google::Storage::Property::BucketCorsArray.api_munge(fetch['cors']),
      id: Google::Storage::Property::String.api_munge(fetch['id']),
      lifecycle: Google::Storage::Property::BucketLifecycle.api_munge(fetch['lifecycle']),
      location: Google::Storage::Property::String.api_munge(fetch['location']),
      logging: Google::Storage::Property::BucketLogging.api_munge(fetch['logging']),
      metageneration: Google::Storage::Property::Integer.api_munge(fetch['metageneration']),
      name: Google::Storage::Property::String.api_munge(fetch['name']),
      owner: Google::Storage::Property::BucketOwner.api_munge(fetch['owner']),
      project_number: Google::Storage::Property::Integer.api_munge(fetch['projectNumber']),
      storage_class: Google::Storage::Property::StorageClassEnum.api_munge(fetch['storageClass']),
      time_created: Google::Storage::Property::Time.api_munge(fetch['timeCreated']),
      updated: Google::Storage::Property::Time.api_munge(fetch['updated']),
      versioning: Google::Storage::Property::BucketVersioning.api_munge(fetch['versioning']),
      website: Google::Storage::Property::BucketWebsite.api_munge(fetch['website']),
      default_object_acl: resource[:default_object_acl]
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def exists?
    debug("exists? #{@property_hash[:ensure] == :present}")
    @property_hash[:ensure] == :present
  end

  def create
    debug('create')
    @created = true
    create_req = Google::Storage::Network::Post.new(collection(@resource),
                                                    fetch_auth(@resource),
                                                    'application/json',
                                                    resource_to_request)
    return_if_object create_req.send, 'storage#bucket'
    @property_hash[:ensure] = :present
  end

  def destroy
    debug('destroy')
    @deleted = true
    delete_req = Google::Storage::Network::Delete.new(self_link(@resource),
                                                      fetch_auth(@resource))
    return_if_object delete_req.send, 'storage#bucket'
    @property_hash[:ensure] = :absent
  end

  def flush
    debug('flush')
    # return on !@dirty is for aiding testing (puppet already guarantees that)
    return if @created || @deleted || !@dirty
    update_req = Google::Storage::Network::Put.new(self_link(@resource),
                                                   fetch_auth(@resource),
                                                   'application/json',
                                                   resource_to_request)
    return_if_object update_req.send, 'storage#bucket'
  end

  def dirty(field, from, to)
    @dirty = {} if @dirty.nil?
    @dirty[field] = {
      from: from,
      to: to
    }
  end

  def exports
    {
      name: resource[:name]
    }
  end

  private

  # rubocop:disable Metrics/MethodLength
  def self.resource_to_hash(resource)
    {
      name: resource[:name],
      kind: 'storage#bucket',
      acl: resource[:acl],
      cors: resource[:cors],
      default_object_acl: resource[:default_object_acl],
      id: resource[:id],
      lifecycle: resource[:lifecycle],
      location: resource[:location],
      logging: resource[:logging],
      metageneration: resource[:metageneration],
      owner: resource[:owner],
      project_number: resource[:project_number],
      storage_class: resource[:storage_class],
      time_created: resource[:time_created],
      updated: resource[:updated],
      versioning: resource[:versioning],
      website: resource[:website],
      project: resource[:project],
      predefined_default_object_acl: resource[:predefined_default_object_acl]
    }.reject { |_, v| v.nil? }
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def resource_to_request
    request = {
      kind: 'storage#bucket',
      acl: @resource[:acl],
      cors: @resource[:cors],
      defaultObjectAcl: @resource[:default_object_acl],
      lifecycle: @resource[:lifecycle],
      location: @resource[:location],
      logging: @resource[:logging],
      metageneration: @resource[:metageneration],
      name: @resource[:name],
      owner: @resource[:owner],
      storageClass: @resource[:storage_class],
      versioning: @resource[:versioning],
      website: @resource[:website],
      project: @resource[:project],
      predefinedDefaultObjectAcl: @resource[:predefined_default_object_acl]
    }.reject { |_, v| v.nil? }
    debug "request: #{request}" unless ENV['PUPPET_HTTP_DEBUG'].nil?
    request.to_json
  end
  # rubocop:enable Metrics/MethodLength

  def fetch_auth(resource)
    self.class.fetch_auth(resource)
  end

  def self.fetch_auth(resource)
    Puppet::Type.type(:gauth_credential).fetch(resource)
  end

  def debug(message)
    puts("DEBUG: #{message}") if ENV['PUPPET_HTTP_VERBOSE']
    super(message)
  end

  def self.collection(data)
    URI.join(
      'https://www.googleapis.com/storage/v1/',
      expand_variables(
        'b?project={{project}}',
        data
      )
    )
  end

  def collection(data)
    self.class.collection(data)
  end

  def self.self_link(data)
    URI.join(
      'https://www.googleapis.com/storage/v1/',
      expand_variables(
        'b/{{name}}?projection=full',
        data
      )
    )
  end

  def self_link(data)
    self.class.self_link(data)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def self.return_if_object(response, kind)
    raise "Bad response: #{response.body}" \
      if response.is_a?(Net::HTTPBadRequest)
    raise "Bad response: #{response}" \
      unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w[error errors], 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    raise "Incorrect result: #{result['kind']} (expected '#{kind}')" \
      unless result['kind'] == kind
    result
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def return_if_object(response, kind)
    self.class.return_if_object(response, kind)
  end

  def self.extract_variables(template)
    template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
            .map(&:to_sym)
  end

  def self.expand_variables(template, var_data, extra_data = {})
    data = if var_data.class <= Hash
             var_data.merge(extra_data)
           else
             resource_to_hash(var_data).merge(extra_data)
           end
    extract_variables(template).each do |v|
      unless data.key?(v)
        raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
      end
      template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
    end
    template
  end

  def self.fetch_resource(resource, self_link, kind)
    get_request = ::Google::Storage::Network::Get.new(
      self_link, fetch_auth(resource)
    )
    return_if_object get_request.send, kind
  end

  def self.raise_if_errors(response, err_path, msg_field)
    errors = ::Google::HashUtils.navigate(response, err_path)
    raise_error(errors, msg_field) unless errors.nil?
  end

  def self.raise_error(errors, msg_field)
    raise IOError, ['Operation failed:',
                    errors.map { |e| e[msg_field] }.join(', ')].join(' ')
  end
end
