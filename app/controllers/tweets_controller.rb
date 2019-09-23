include ApplicationHelper

class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
    @following_tweets = []
    @personal_tweets = []
    @non_personal_tweets = []
    if signed_in?
      @tweets.each do |tweet|
        @following_tweets << tweet if is_following?(current_user.id, tweet.user.id)
      end
    end
    @tweets.each do |tweet|
      if tweet.user == current_user
        @personal_tweets << tweet
      else
        @non_personal_tweets << tweet
      end
    end
    @tweet = Tweet.new
    @user = current_user
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(set_tweet_params)
    @tweet.user = current_user
    if @tweet.save
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    else
      redirect_to tweets_path
    end
  end

  def edit
    authorize @tweet
  end

  def update
    if @tweet.update(set_tweet_params)
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def set_tweet_params
    params.require(:tweet).permit(:content)
  end
end
