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

require 'google/object_store'
require 'puppet/property'

module Google
  module Sql
    module Data
      # Base class for ResourceRefs
      # Imports name from instance
      class InstanceNameRef
        include Comparable

        def ==(other)
          return false unless other.is_a? InstanceNameRef
          return false if resource != other.resource
          true
        end

        def <=>(other)
          resource <=> other.resource
        end
      end

      # A class to fetch the resource value from a referenced block
      # Will return the value exported from a different Puppet resource
      class InstanceNameRefCatalog < InstanceNameRef
        def initialize(title)
          @title = title
        end

        # Puppet requires the title for autorequiring
        def autorequires
          [@title]
        end

        def to_s
          resource.to_s
        end

        def to_json(_arg = nil)
          return if resource.nil?
          resource.to_json
        end

        def resource
          Google::ObjectStore.instance[:gsql_instance].each do |entry|
            return entry.exports[:name] if entry.title == @title
          end
          raise ArgumentError, "gsql_instance[#{@title}] required"
        end
      end

      # A class to manage a JSON blob from GCP API
      # Will immediately return value from JSON blob without changes
      class InstanceNameRefApi < InstanceNameRef
        attr_reader :resource

        def initialize(resource)
          @resource = resource
        end

        def to_s
          @resource.to_s
        end

        def to_json(_arg = nil)
          @resource.to_json
        end
      end
    end

    module Property
      # A class to manage fetching name from a instance
      class InstanceNameRef < Puppet::Property
        # Used for catalog values
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstanceNameRefCatalog.new(value)
        end

        # Used for fetched JSON values
        def self.api_munge(value)
          return if value.nil?
          Data::InstanceNameRefApi.new(value)
        end
      end
    end
  end
end
