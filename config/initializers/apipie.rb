Apipie.configure do |config|
  config.app_name                = "ApiFlashcards"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/doc"
  # where is your API defined?
  config.api_controllers_matcher = "#{ApiFlashcards::Engine.root}/app/controllers/**/*.rb"
end
