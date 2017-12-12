class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
    def twitter
      auth = request.env['omniauth.auth']
      d
      user = User.find_or_create_by(
        uid:auth.id,
        screenname:auth.nickname
      )
      remember_me(user)
      sign_in_and_redirect user,event: :authentication
    end
end
