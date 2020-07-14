# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

module CRM
  class << self
    # Return either Application or Engine,
    # depending on how CRM has been loaded
    def application
      engine? ? Engine : Application
    end

    delegate :root, to: :application

    # Are we running as an engine?
    def engine?
      defined?(CRM::Engine).present?
    end

    def application?
      !engine?
    end
  end
end

# Load CRM as a Rails Engine, unless running as a Rails Application
require 'crm/engine' unless defined?(CRM::Application)

require 'crm/load_settings' # register load hook for Setting

# Require gem dependencies, monkey patches, and vendored plugins (in lib)
require "crm/gem_dependencies"
require "crm/gem_ext"

require "crm/custom_fields" # load hooks for Field
require "crm/version"
require "crm/core_ext"
require "crm/comment_extensions"
require "crm/exceptions"
require "crm/export_csv"
require "crm/errors"
require "crm/i18n"
require "crm/permissions"
require "crm/exportable"
require "crm/renderers"
require "crm/fields"
require "crm/sortable"
require "crm/tabs"
require "crm/callback"
require "crm/view_factory"

require "activemodel-serializers-xml"
require "country_select"
require "gravatar_image_tag"
