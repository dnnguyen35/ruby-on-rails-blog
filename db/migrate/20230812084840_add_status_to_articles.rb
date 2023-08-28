# frozen_string_literal: true

# This migration adds the "status" column to the "articles" table in the database.
# The "status" column will be used to track the status of individual articles, such as
# whether an article is published, unpublished, archived, or has a custom status.
#
# Table Structure (After Migration):
#   - id (integer): Primary key for the article.
#   - title (string): The title of the article.
#   - body (text): The main content of the article.
#   - status (string): The status of the article (e.g., "published", "unpublished").
#   - created_at (datetime): Timestamp of article creation.
#   - updated_at (datetime): Timestamp of last update.
#
# This migration prepares the database to store status information for articles.
class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :string
  end
end
