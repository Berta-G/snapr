var page_counter = 2;

$(window).scroll(function()
{

    if($(window).scrollTop() > 400)
    {
        
        $('div#loadmoreajaxloader').show();
        $.get("/snaps.json?page="+page_counter, function(data)
        {
            $.each(data, function(index, snap){
                $('#snaps').append('<li class="snap"><img src="'+snap.src+'">'+snap.description+'</li>');
                page_counter++;
            });
            if(data.length==0) {
                $('div#loadmoreajaxloader').html('<center>Snap! No more snaps.</center>');
            }
        })};
        //     if($(html).find('.snap').length > 0 )
        //     {
        //         $('#snaps').append($(html).find('.snap'));
        //         $('div#loadmoreajaxloader').hide();
        //         page_counter++
        //     }else
        //     {
        //         $('div#loadmoreajaxloader').html('<center>Snap! No more snaps.</center>');
        //     }
        // }
        // );
    // }
});