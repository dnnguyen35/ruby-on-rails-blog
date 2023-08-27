# frozen_string_literal: true

# This migration creates the "users" table in the database to support user authentication
# and authorization using the Devise gem. The table includes columns for storing email,
# encrypted password, and additional fields required for Devise modules such as Recoverable,
# Rememberable, and Trackable.
#
# Table Structure (After Migration):
#   - id (integer): Primary key for the user.
#   - email (string): The email address of the user.
#   - encrypted_password (string): The encrypted password of the user.
#   - reset_password_token (string): Token for resetting user password.
#   - reset_password_sent_at (datetime): Timestamp of when the reset password token was sent.
#   - remember_created_at (datetime): Timestamp of when user session was created.
#   - created_at (datetime): Timestamp of user creation.
#   - updated_at (datetime): Timestamp of last update.
#
# This migration prepares the database to store user information and enable authentication and
# authorization functionalities through Devise.
class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
