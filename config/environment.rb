ActiveSupport::Deprecation.silenced = true

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Levelset::Application.initialize!
