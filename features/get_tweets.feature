Feature: Get Tweets
	In order to get a tweets
	As a user
	I want to get a tweets and add them to favorites

	Scenario: Link to Favorites Tweets from Main Page
		Given Nothing
		When I go to the main page
		Then I should see "See favorite tweets"

	Scenario: Link to Main Page from Favorites Tweets page
		Given Nothing
		When I go to the favorite page
		Then I should see "See last tweets"

	Scenario: Add tweets to favorite
		Given No tweets in favorite
		When I go to the main page
		And click star link
		And click star link
		And click star link
		Then I shoul have 1 favorite tweet

	Scenario: Loading old tweets
		Given Nothing
		When I go to the main page
		And click "old_tweets_link" link
		And click "Get older tweets" link
		Then I should see 60 tweets
