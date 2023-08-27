# frozen_string_literal: true

# This migration adds the "first_name" and "last_name" columns to the "users" table
# in the database. These columns will store the first name and last name of each user.
#
# Table Structure (After Migration):
#   - id (integer): Primary key for the user.
#   - email (string): The email address of the user.
#   - encrypted_password (string): The encrypted password of the user.
#   - reset_password_token (string): Token for resetting user password.
#   - reset_password_sent_at (datetime): Timestamp of when the reset password token was sent.
#   - remember_created_at (datetime): Timestamp of when user session was created.
#   - first_name (string): The first name of the user.
#   - last_name (string): The last name of the user.
#   - created_at (datetime): Timestamp of user creation.
#   - updated_at (datetime): Timestamp of last update.
#
# This migration prepares the database to store first and last names of users.
class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
  end
end
