# frozen_string_literal: true

# The Article model represents individual articles in the application.
# It is associated with users who create the articles and can have multiple comments.
# Articles can be published and have various attributes like title, content, and timestamps.

# Common functionality provided by Article includes defining associations with User
# and Comment models, and adding validations to ensure data integrity.
class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
