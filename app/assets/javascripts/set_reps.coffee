# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', (event) ->
	submitBtn = document.getElementById('submitSetRep')
	submitBtn.onclick = -> 
		order_collection = []

		allLoafs = document.getElementsByClassName('percent')
		allQuan = document.getElementsByClassName('hash_value')
		title = document.getElementById('title')

		q=0
		hash_values = []
		while q < allQuan.length
			console.log("VALUE",[q],allQuan[q].children[0].value)
			hash_values.push(allQuan[q].children[0].value)
			q++

		order_collection.push(hash_values)	
		i=0
		key_value = []
		while i < allLoafs.length
			console.log("KEY",[i],allLoafs[i].children[0].value)
			key_value.push(allLoafs[i].children[0].value)
			i++

		order_collection.push(key_value)
		console.log("Woof", order_collection)
		$.post '/set_reps',
			order_details: order_collection,
			title: title.value

