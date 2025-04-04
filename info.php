<!DOCTYPE html>
<htm>

    <head>
        <title>
            Map
        </title>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC-RwQuqZ9AyZMcs7aVKdIBoVlLqo4zcrY&libraries=places&language=en"></script>
        <script>
            function initializeMap() {
                var LatLng = {
                    lat: 20.23,
                    lng: -8.28460
                };
                var mapOptions = {
                    center: LatLng,
                    zoom: 6,
                    scrollwheel: false,
                    noClear: true
                }

                var map = new google.maps.Map(document.getElementById('map'), mapOptions);

                var marker = new google.maps.Marker({
                    position: LatLng,
                    map: map,
                    draggable: true,
                    title: "Binko"
                });

                var input = document.getElementById('accommodation_address');
                var autocomplete = new google.maps.places.Autocomplete(input);
                autocomplete.bindTo('bounds', map);

                google.maps.event.addListener(autocomplete, 'place_changed', function() {
                    var place = autocomplete.getPlace();
                    if (!place.geometry) {
                        return;
                    }
                    if (place.geometry.viewport) {
                        map.fitBounds(place.geometry.viewport);
                    } else {
                        map.setCenter(place.geometry.location);
                        map.setZoom(17);
                    }

                    marker.setPlace(({
                        placeId: place.place_id,
                        location: place.geometry.location
                    }));
                });
            };

            google.maps.event.addDomListener(window, 'load', initializeMap);
        </script>
        <style type="text/css">
            html,
            body,
            #map {
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
            }

            #accommodation_address {
                width: 20%;
                position: absolute;
                left: 10%;
                top: 10%;
                background-color: white;
                border: 1px solid gray;
                z-index: 100;
            }
        </style>
    </head>

    <body>
        <div id="map">
            <input type="text" id="accommodation_address" />
        </div>
    </body>

    </html>