# frozen_string_literal: true

# The Visible module provides functionality for managing visibility statuses of content.
# It is included in models that need to handle public, private, or archived statuses.
# The module adds validations, class methods, and instance methods to manage visibility.

# Common functionality provided by Visible includes validating that the status is one of
# the valid values (public, private, archived), defining a class method to count public
# items, and providing an instance method to check if an item is archived.
module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
