class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
    def twitter
      auth = request.env['omniauth.auth']

      user = User.find_or_create_by(
        uid:auth.uid
      )      
      user.update(
        screenname:auth.info.nickname,
        profile_url:auth.info.image,
        twitter_token:auth.credentials.token,
        twitter_secret:auth.credentials.secret
      )
      remember_me(user)
      sign_in_and_redirect user,event: :authentication
    end
end
