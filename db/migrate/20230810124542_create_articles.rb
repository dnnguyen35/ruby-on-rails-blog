# frozen_string_literal: true

# This migration creates the "articles" table in the database. The table is used
# to store information about individual articles posted on the platform.
#
# Table Structure:
#   - id (integer): Primary key for the article.
#   - title (string): The title of the article.
#   - body (text): The main content of the article.
#   - created_at (datetime): Timestamp of article creation.
#   - updated_at (datetime): Timestamp of last update.
#
# This migration prepares the database to store articles with their titles and content.
class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
