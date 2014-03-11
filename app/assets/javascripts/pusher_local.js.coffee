pusher = new Pusher '45148e84dab1d493390a' 
channel = pusher.subscribe 'snaps' 
channel.bind 'uploaded', (data) ->
	$('#snaps').prepend(""" 
		<li class='snap row'>
			<article class='medium-6 medium-offset-3 columns panel radius text-center'>
				<img class='th radius' src=#{data.src}>
				<label>#{data.snap.description}</label>
				<div class='row'>
					<ul class='small-9 small-centered columns'>
						#{("<li class='tiny button radius secondary' style='margin: 3px'>"+tag.name+"</li>" for tag in data.tags).join('')}
					</ul>
				</div>
			</article>
		</li>
	""")
	window.console.log "ouch!!!" 
	window.console.log data 