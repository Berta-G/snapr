pusher = new Pusher '45148e84dab1d493390a' 
channel = pusher.subscribe 'snaps' 
channel.bind 'uploaded', (data) ->
	$('#snaps').prepend(""" 
		<li class='snap row'>
			<article class='medium-6 medium-offset-3 columns panel radius text-center'>
				<a href='/snaps/#{data.snap.id}', id="snap_link"><img class='th radius' src=#{data.src}></a>
				<blockquote>
				#{data.snap.description}
					<cite>
						<a href='/users/#{data.snap.user_id}', id="user_link">
							#{data.username}
						</a>
					</cite>
				</blockquote>
				<div class='row'>
					<ul class='small-9 small-centered columns'>
						#{("<a href='/tags/#{tag.id}', id='tag_link'><li class='tiny button radius secondary' style='margin: 3px'>"+tag.name+"</li></a>" for tag in data.tags).join('')}
					</ul>
				</div>
			</article>
		</li>
	""")
	window.console.log "ouch!!!" 
	window.console.log data 
