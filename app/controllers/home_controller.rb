class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user=current_user
      @tweet=@user.tweets.new
    else
      render template: 'home/welcome'
    end
  end

  def tweet_post
    config={
      consumer_key:Rails.application.secrets.twitter_api_key,
      consumer_secret:Rails.application.secrets.twitter_api_secret,
      access_token:current_user.twitter_token,
      access_token_secret:current_user.twitter_secret
    }
    require 'twitter'
    client = Twitter::REST::Client.new(config)

    # Twitter投稿
    client.update(params[:tweet][:content])
    # ajaxで結果を通知したいところ。
    # redirect_to root_path, notice: 'ツイートしました！'
  end

  def tweet_config
    current_user.update(tweet_config_params)
  end
    private
    def tweet_config_params
      params.require(:user).permit(:tweet_confirm,:tweet_signal)
    end
end
