pusher = new Pusher '45148e84dab1d493390a' 
channel = pusher.subscribe 'snaps'

prependSnap = (data)->
	source   = $("#snap-template").html()
	template = Handlebars.compile(source)
	$('#snaps').prepend(template(data))

channel.bind 'uploaded', (data) ->
	prependSnap(data)