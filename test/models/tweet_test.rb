require 'test_helper'

class TweetTest < ActiveSupport::TestCase


  test "shouldn't save empty tweet" do
    tweet = Tweet.new
    assert_not tweet.save, "empty tweet saved"
  end

  test "shouldn't save tweet without user" do
    tweet = Tweet.new(content: "I am a test")
    tweet.save
    assert_not(tweet.id.present?, true)
  end
end
