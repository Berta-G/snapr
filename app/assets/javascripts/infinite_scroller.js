$('#snaps').infinitescroll({
    loading: {
    finishedMsg: "Snap! No more snaps!",
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


