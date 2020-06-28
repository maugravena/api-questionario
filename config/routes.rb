Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, path: 'usuario', shallow: true, only: %i[create] do
        resources :quizzes, path: 'questionario', only: %i[create] do
          resources :questions, path: 'questao', only: %i[create]
        end
      end
    end
  end
end
