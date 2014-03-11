$('#snaps').infinitescroll({
    loading: {
    finishedMsg: "<p class='medium-6 medium-offset-3 columns panel radius text-center'>Snap! No more snaps! </p>",
    img: "/assets/animated.gif",
    msg: null,
    msgText: null
    },

    navSelector  : "div.pagination",            
                   // selector for the paged navigation (it will be hidden)
    nextSelector : "div.pagination a.next_page",    
                   // selector for the NEXT link (to page 2)
    itemSelector : "li.snap",          
                   // selector for all items you'll retrieve


  });




