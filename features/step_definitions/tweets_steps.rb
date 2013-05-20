Given(/^Nothing$/) do
  # really nothing
end

Given(/^No tweets in favorite$/) do
  FavoriteTweet.delete_all
end

When(/^I go to the main page$/) do
  visit root_url
end

When(/^I go to the favorite page$/) do
  visit favorite_tweets_url
end

When(/^click star link$/) do
  page.first(".favorite_add > a").click
end

When(/^click "(.*?)" link$/) do |link_text|
  click_on link_text
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

# not working yet.....

Then(/^I shoul have ([0-9]+) favorite tweet$/) do |num|
  #FavoriteTweet.count.should == num
end

Then(/^I should see ([0-9]+) tweets$/) do |count|
  #(page.all('table#tweets_table tr').count - 1).should == count.to_i
end