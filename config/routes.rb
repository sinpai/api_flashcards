ApiFlashcards::Engine.routes.draw do
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :cards
    end
  end
end
