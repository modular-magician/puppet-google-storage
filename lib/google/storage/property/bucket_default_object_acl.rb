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

require 'google/storage/property/array'
require 'google/storage/property/base'

module Google
  module Storage
    module Data
      # A class to manage data for DefaultObjectAcl for bucket.
      class BuckeDefauObjecAcl
        include Comparable

        attr_reader :bucket
        attr_reader :domain
        attr_reader :email
        attr_reader :entity
        attr_reader :entity_id
        attr_reader :generation
        attr_reader :id
        attr_reader :object
        attr_reader :project_team
        attr_reader :role

        def to_json(_arg = nil)
          {
            'bucket' => bucket,
            'domain' => domain,
            'email' => email,
            'entity' => entity,
            'entityId' => entity_id,
            'generation' => generation,
            'id' => id,
            'object' => object,
            'projectTeam' => project_team,
            'role' => role
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            bucket: bucket,
            domain: domain,
            email: email,
            entity: entity,
            entity_id: entity_id,
            generation: generation,
            id: id,
            object: object,
            project_team: project_team,
            role: role
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? BuckeDefauObjecAcl
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? BuckeDefauObjecAcl
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        private

        def compare_fields(other)
          [
            { self: bucket, other: other.bucket },
            { self: domain, other: other.domain },
            { self: email, other: other.email },
            { self: entity, other: other.entity },
            { self: entity_id, other: other.entity_id },
            { self: generation, other: other.generation },
            { self: id, other: other.id },
            { self: object, other: other.object },
            { self: project_team, other: other.project_team },
            { self: role, other: other.role }
          ]
        end
      end

      # Manages a BuckeDefauObjecAcl nested object
      # Data is coming from the GCP API
      class BuckeDefauObjecAclApi < BuckeDefauObjecAcl
        def initialize(args)
          @bucket = Google::Storage::Property::BucketNameRef.api_munge(args['bucket'])
          @domain = Google::Storage::Property::String.api_munge(args['domain'])
          @email = Google::Storage::Property::String.api_munge(args['email'])
          @entity = Google::Storage::Property::String.api_munge(args['entity'])
          @entity_id = Google::Storage::Property::String.api_munge(args['entityId'])
          @generation = Google::Storage::Property::Integer.api_munge(args['generation'])
          @id = Google::Storage::Property::String.api_munge(args['id'])
          @object = Google::Storage::Property::String.api_munge(args['object'])
          @project_team =
            Google::Storage::Property::BucketProjectTeam.api_munge(args['projectTeam'])
          @role = Google::Storage::Property::Enum.api_munge(args['role'])
        end
      end

      # Manages a BuckeDefauObjecAcl nested object
      # Data is coming from the Puppet manifest
      class BuckeDefauObjecAclCatalog < BuckeDefauObjecAcl
        def initialize(args)
          @bucket = Google::Storage::Property::BucketNameRef.unsafe_munge(args['bucket'])
          @domain = Google::Storage::Property::String.unsafe_munge(args['domain'])
          @email = Google::Storage::Property::String.unsafe_munge(args['email'])
          @entity = Google::Storage::Property::String.unsafe_munge(args['entity'])
          @entity_id = Google::Storage::Property::String.unsafe_munge(args['entity_id'])
          @generation = Google::Storage::Property::Integer.unsafe_munge(args['generation'])
          @id = Google::Storage::Property::String.unsafe_munge(args['id'])
          @object = Google::Storage::Property::String.unsafe_munge(args['object'])
          @project_team =
            Google::Storage::Property::BucketProjectTeam.unsafe_munge(args['project_team'])
          @role = Google::Storage::Property::Enum.unsafe_munge(args['role'])
        end
      end
    end

    module Property
      # A class to manage input to DefaultObjectAcl for bucket.
      class BuckeDefauObjecAcl < Google::Storage::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::BuckeDefauObjecAclCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::BuckeDefauObjecAclApi.new(value)
        end
      end

      # A Puppet property that holds an integer
      class BuckeDefauObjecAclArray < Google::Storage::Property::Array
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          return BuckeDefauObjecAcl.unsafe_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| BuckeDefauObjecAcl.unsafe_munge(v) }
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          return BuckeDefauObjecAcl.api_munge(value) \
            unless value.is_a?(::Array)
          value.map { |v| BuckeDefauObjecAcl.api_munge(v) }
        end
      end
    end
  end
end
