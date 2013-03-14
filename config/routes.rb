SocialcrunchSmk::Application.routes.draw do

  root to: 'home#index'

  get '/leader_board' => 'home#leader_board', as: :leader_board
  get '/the_end'      => 'home#the_end',      as: :the_end

  # @kamtodo: make this post on front-end
  post '/prefs' => 'questions#update_gender_pref'

  resources :questions, only: [:index, :show] do
    collection do
      match :respond
      match :get_more_questions
    end
  end
end
