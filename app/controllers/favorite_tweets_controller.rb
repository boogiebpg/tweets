class FavoriteTweetsController < ActionController::Base
	helper_method :favorite_tweets

  	def last_tweets
  		@posts = Twitter.user_timeline("ciklum")
  		render :layout => 'application'
	end

	def old_tweets
  		@posts = Twitter.user_timeline("ciklum", {:max_id => params[:the_oldest_id].to_i - 1, :count => 20})
  		render :layout => false
	end

	def new_tweets
  		@posts = Twitter.user_timeline("ciklum", {:since_id => params[:the_newest_id].to_i})
  		render :layout => false
	end

	def index
		@posts = FavoriteTweet.all
		render :layout => 'application'
	end

	def create
		if params[:remove] == nil
			tweet = Twitter.status(params[:tweet_id])
			FavoriteTweet.create :tweet_id => params[:tweet_id], :tweet_text => tweet.text, :tweet_time => tweet.created_at
		else
			tweet = FavoriteTweet.find_by_tweet_id params[:tweet_id]
			tweet.destroy
		end
		render :nothing => true
	end

	private

	def favorite_tweets
		@favorite_tweets ||= FavoriteTweet.all.map(&:tweet_id)
	end

end