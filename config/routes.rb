SocialcrunchSmk::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root to: 'home#index', as: :home

  get '/prefs'        => 'home#update_gender_pref', as: :gender_pref
  get '/leader_board' => 'home#leader_board', as: :leader_board
  get '/the_end'      => 'home#the_end',      as: :the_end
  get '/signout'      => 'home#signout'

  resources :questions, only: [:index, :show] do
    collection do
      post :respond
      get :get_more_questions
    end
  end
end
