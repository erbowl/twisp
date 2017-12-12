class HomeController < ApplicationController
  def index
    @user=current_user
    @tweet=@user.tweets.new
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
end
