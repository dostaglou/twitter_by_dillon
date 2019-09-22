class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def show
    authenticate @tweet
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(set_tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to tweets_path
    else
      render :index
    end
  end

  def edit
    authorize @tweet
  end

  def update
    authorize @tweet
    if @tweet.update(set_tweet_params)
      redirect_to tweets_path
    else
      render :edit
      end
  end

  def destroy
    authorize @tweet
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
