ApiFlashcards::Engine.routes.draw do
  apipie
  root to: 'home#index'

  scope module: 'api', defaults: { format: 'json' } do
    namespace :v1 do
      resources :cards
      put 'review_card' => 'trainer#review_card'
      get 'trainer' => 'trainer#index'
    end
  end
end
