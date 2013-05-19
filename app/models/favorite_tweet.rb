class FavoriteTweet < ActiveRecord::Base
  attr_accessible :tweet_id, :tweet_text, :tweet_time
  default_scope :order => "tweet_id DESC"
end
