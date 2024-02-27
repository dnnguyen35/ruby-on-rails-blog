# frozen_string_literal: true

# The User model represents individual users of the application.
# It can create articles, post comments, and has various attributes like email and username.
# Users can be associated with articles they authored and comments they posted.

# Common functionality provided by User includes associations with Article and Comment,
# along with authentication-related methods and validations.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attr_accessor :skip_password_validation

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: :skip_password_validation
  validates :password_confirmation, presence: true, unless: :skip_password_validation
  validates :password, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
