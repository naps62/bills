require "active_support/dependencies"

ActiveSupport::Dependencies.autoload_paths += %w(
  app/models
  app/models/concerns
  app/types
)
