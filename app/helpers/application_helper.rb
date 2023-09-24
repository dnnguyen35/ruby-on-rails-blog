# frozen_string_literal: true

# The ApplicationHelper is a module that provides utility methods for views across the application.
# It contains helper methods that can be used to generate dynamic content, format data, and perform
# common view-related tasks.

# Common functionality provided by ApplicationHelper includes generating HTML tags,
# formatting dates, handling user authentication and permissions, and simplifying
# complex view logic.
module ApplicationHelper
  include Pagy::Frontend
end
