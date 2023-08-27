# frozen_string_literal: true

# The Comment model represents comments made on different types of content in the application.
# It is associated with users who post comments and belongs to articles or other entities.
# Comments can contain content and timestamps.

# Common functionality provided by Comment includes associations with User and Article,
# and validation to ensure comments are properly associated and have content.
class Comment < ApplicationRecord
  include Visible

  belongs_to :article
end
