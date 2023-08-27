# frozen_string_literal: true

# This migration creates the "comments" table in the database. The table is used
# to store user-generated comments related to individual articles.
#
# Table Structure:
#   - id (integer): Primary key for the comment.
#   - commenter (string): The name of the commenter.
#   - body (text): The content of the comment.
#   - article_id (integer): Foreign key linking the comment to an article.
#   - created_at (datetime): Timestamp of comment creation.
#   - updated_at (datetime): Timestamp of last update.
#
# Associations:
#   - Belongs to article: Each comment is associated with an article.
#
# This migration prepares the database to store user comments associated with articles.
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
