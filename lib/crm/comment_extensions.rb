# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module CRM
  module CommentExtensions
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def uses_comment_extensions
        include CRM::CommentExtensions::InstanceMethods unless included_modules.include?(InstanceMethods)
      end
    end

    module InstanceMethods
      def add_comment_by_user(comment_body, user)
        comments.create(comment: comment_body, user: user) if comment_body.present?
      end
    end
  end
end

ActiveRecord::Base.include CRM::CommentExtensions
