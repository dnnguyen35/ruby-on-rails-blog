# frozen_string_literal: true

# ApplicationRecord serves as the base class for all models in the application.
# It inherits from ActiveRecord::Base and provides a common place to define
# global configurations, associations, and shared methods for all models.

# Common functionality provided by ApplicationRecord includes setting up database
# connections, defining associations, and adding custom methods that can be
# accessed by all models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
