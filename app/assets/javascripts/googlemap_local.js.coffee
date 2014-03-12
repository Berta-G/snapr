mapStyle = [
    {
        "stylers": [
            {
                "hue": "#007fff"
            },
            {
                "saturation": 89
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    }
]

LatLng = new google.maps.LatLng($('a#snap_link img').data('latitude'), $('a#snap_link img').data('longitude'))

myOptions = {
    zoom: 15,
    center: LatLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: mapStyle,
    disableDefaultUI: true
}

map = new google.maps.Map(document.getElementById('map'), myOptions)

marker = new google.maps.Marker({
  position: LatLng,
  icon: '/assets/logo.png'
})

marker.setMap(map)



    