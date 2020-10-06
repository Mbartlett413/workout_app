# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', (event) ->
	submitBtn = document.getElementById('submitWeek')
	submitBtn.onclick = -> 
		order_collection = []

		allLoafs = document.getElementsByClassName('exercise')
		title = document.getElementById('workout_title')
		user = document.getElementById('user')
		console.log("WORKOUT", title)

		i=0
		key_value = []
		while i < allLoafs.length
			console.log("KEY",[i],allLoafs[i].children[0].value)
			key_value.push(allLoafs[i].children[0].value)
			i++

		order_collection.push(key_value)
		console.log("Woof", order_collection)
		$.post '/weeks',
			order_details: order_collection,
			title: title.value,
			user: user.innerHTML



