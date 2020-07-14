# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
namespace :ffcrm do
  namespace :dropbox do
    desc "Run dropbox crawler and process incoming emails"
    task run: :environment do
      require "crm/mail_processor/dropbox"
      CRM::MailProcessor::Dropbox.new.run(false)
    end

    namespace :run do
      desc "[Dry run] - Run dropbox crawler and process incoming emails"
      task dry: :environment do
        require "crm/mail_processor/dropbox"
        CRM::MailProcessor::Dropbox.new.run(true)
      end
    end

    desc "Set up email dropbox based on currently loaded settings"
    task setup: :environment do
      require "crm/mail_processor/dropbox"
      CRM::MailProcessor::Dropbox.new.setup
    end
  end
end
