$(document).ready(function () {

	function favorite_add() {
		var tweet_id = $(this).attr("id");
	  	$.ajax({
		    'url' : '/favorite_tweets',
		    'type' : 'POST',
		    'data' : {tweet_id: tweet_id},
		    'success' : function(data) {
		    	$('#'+tweet_id).html('<img src="/assets/star_icon.png" />')
		    }
	 	});
 	}

 	function favorite_remove() {
		var tweet_id = $(this).attr("id");
	  	$.ajax({
		    'url' : '/favorite_tweets',
		    'type' : 'POST',
		    'data' : {tweet_id: tweet_id, remove: true},
		    'success' : function(data) {
		    	$('#' + tweet_id).remove();
		    }
	 	});
 	}

 	function old_tweets() {
	  	$.ajax({
		    'url' : '/favorite_tweets/old_tweets/' + $('#tweets_table tr:last').find('div').attr('id'),
		    'type' : 'GET',
		    'success' : function(data) {
		    	$('#tweets_table tr:last').after(data);
		    }
	 	});
 	}

 	function new_tweets() {
	  	$.ajax({
		    'url' : '/favorite_tweets/new_tweets/' + $('#tweets_table tr:first').next('tr').find('div').attr('id'),
		    'type' : 'GET',
		    'success' : function(data) {
		    	$('#tweets_table tr:first').next('tr').before(data);
		    }
	 	});
 	}

	$(document).on("click", "div.favorite_add", favorite_add);  
	$("tr.favorite_remove").click(favorite_remove);
	$("a#old_tweets_link").click(old_tweets);
	$("a#new_tweets_link").click(new_tweets);
	setInterval(new_tweets, 60000);
});