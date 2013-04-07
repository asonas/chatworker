Chatworker::Application.routes.draw do
  resources :icons, only: [:index, :new, :create]
  root to: "icons#index"
end
