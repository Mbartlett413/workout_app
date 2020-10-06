# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', (event) ->
	submitBtn = document.getElementById('submitWorkout')
	submitBtn.onclick = -> 
		order_collection = []
		primary = document.getElementById('active_week');
		title = document.getElementById('title');
		allSelect = document.querySelectorAll("select");
		user = document.getElementById('user');

		i=0
		loaf = []
		while i < allSelect.length
			selectElement = allSelect[i];
			console.log("loa1f",[i], selectElement.id)
			console.log("loaf2",[i], selectElement.options[selectElement.selectedIndex].value)
			#loaf.push([selectElement.id,selectElement.options[selectElement.selectedIndex].value])
			loaf.push(selectElement.options[selectElement.selectedIndex].value)
			i++

		console.log("loaf", loaf)
		$.post '/workouts',
			order_details: loaf,
			primary: primary.checked,
			title: title.value,  
			user: user.innerHTML 
