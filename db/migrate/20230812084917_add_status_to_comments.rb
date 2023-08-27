# frozen_string_literal: true

# This migration adds the "status" column to the "comments" table in the database.
# The "status" column will be used to track the status of individual comments, such as
# whether a comment is approved, pending, flagged, or has a custom status.
#
# Table Structure (After Migration):
#   - id (integer): Primary key for the comment.
#   - commenter (string): The name of the commenter.
#   - body (text): The content of the comment.
#   - article_id (integer): Foreign key linking the comment to an article.
#   - status (string): The status of the comment (e.g., "approved", "pending").
#   - created_at (datetime): Timestamp of comment creation.
#   - updated_at (datetime): Timestamp of last update.
#
# This migration prepares the database to store status information for comments.
class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
  end
end
