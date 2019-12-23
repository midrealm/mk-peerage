# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.action_mailer.default_url_options = {host: 'localhost:3000', protocol: 'https' }
end
