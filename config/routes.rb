Rails.application.routes.draw do


  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      get "speeches", to: 'speeches#index'
      post "speeches", to: 'speeches#create'
      post "notify_email", to: 'speeches#notify_email'
    end
  end

  get "*path" => "application#index"
  root to: "application#index"
end
