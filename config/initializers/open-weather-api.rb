# config/initializers/open-weather-api.rb

# Note that 'config' is an instance of `OpenWeatherAPI::API` (just name it as you like).
OpenWeatherAPI.configure do |config|
  # API key
  config.api_key = ENV['WEATHER_KEY']

  # Optionals
  config.default_language = 'en'     # 'en' by default
  config.default_country_code = 'en' # nil by default (ISO 3166-1 alfa2)
  config.default_units = 'metric'    # 'metric' by default
end