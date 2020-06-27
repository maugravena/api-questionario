Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[create] do
        resources :quizzes, only: %i[create]
      end

      resources :questions, only: %i[create]
    end
  end
end
