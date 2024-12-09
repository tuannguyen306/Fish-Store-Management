require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NguyenDucAnh0123456789LibrarySystemFinalSubmission
  class Application < Rails::Application
    # Use Sidekiq for Active Job queueing
    config.active_job.queue_adapter = :sidekiq

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Add additional hosts for the application
    config.hosts << "library-app-production-5dbc.up.railway.app"

    # Ensure Sidekiq is included in eager loading
    config.eager_load_paths += %W(#{config.root}/app/workers)
  end
end
