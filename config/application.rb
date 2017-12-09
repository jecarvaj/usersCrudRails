require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UsersCrud
  SOCIAL_NETS=[{:name_net=>'Youtube', :url=>'https://www.youtube.com/user/'},
               {:name_net=>'Twitter', :url=>'https://www.twitter.com/' },
               {:name_net=>'Instagram', :url=>'https://www.instagram.com/'},
               {:name_net=>'Linkedin', :url=>'https://www.linkedin.com/in/'},
             #  {:name_net=>'Tumblr', :url=>'.tumblr.com/'},
               {:name_net=>'Facebook', :url=>'https://www.facebook.com/'}]
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end


