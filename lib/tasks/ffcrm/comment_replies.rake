# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
namespace :ffcrm do
  namespace :comment_replies do
    desc "Run comment inbox crawler and process incoming emails"
    task run: :environment do
      require "crm/mail_processor/comment_replies"
      CRM::MailProcessor::CommentReplies.new.run(false)
    end
    namespace :run do
      desc "[Dry run] - Run comment inbox crawler and process incoming emails"
      task dry: :environment do
        require "crm/mail_processor/comment_replies"
        CRM::MailProcessor::CommentReplies.new.run(true)
      end
    end

    desc "Set up comment inbox based on currently loaded settings"
    task setup: :environment do
      require "crm/mail_processor/comment_replies"
      CRM::MailProcessor::CommentReplies.new.setup
    end
  end
end
