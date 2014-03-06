$('#tags').inputosaurus({
			width : '350px',
			allowDuplicates: false,
			nputDelimiters: [',', ';', " "],
			change : function(ev){
				$('#widget1_reflect').val(ev.target.value);
			}
		});
