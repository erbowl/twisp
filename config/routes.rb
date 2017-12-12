Rails.application.routes.draw do
  get :sign_in,to: 'users/sessions#new',as: :new_user_session
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    delete :sign_out,to: 'devise/sessions#destroy',as: :destroy_user_session
  end
  post 'tweet_post',to: 'home#tweet_post',as: :tweet_post
  root 'home#index'
end
