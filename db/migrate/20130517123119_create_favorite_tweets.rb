class CreateFavoriteTweets < ActiveRecord::Migration
  def change
    create_table :favorite_tweets do |t|
      t.integer :tweet_id, :limit => 8
      t.string :tweet_text
      t.datetime :tweet_time

      t.timestamps
    end

    add_index :favorite_tweets, :tweet_id, :unique => true

  end
end
