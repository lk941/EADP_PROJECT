<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="EADProj.map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src='https://api.mapbox.com/mapbox-gl-js/v1.7.0/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v1.7.0/mapbox-gl.css' rel='stylesheet' />
    <style>
	    body { margin: 0; padding: 0; }
	    #map { top: 0; bottom: 0; width: 100%; }
        .mapboxgl-popup {
            max-width: 200px;
        }

        .mapboxgl-popup-content {
            text-align: center;
            font-family: 'Open Sans', sans-serif;
        }

        .marker {
            background-image: url('https://icons.iconarchive.com/icons/paomedia/small-n-flat/1024/map-marker-icon.png');
            background-size: cover;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 100%; width: 100%; position: fixed; ">
        <div id='map' style='width: 100%; height: 100%;'></div>

    </div>
<script src="https://unpkg.com/es6-promise@4.2.4/dist/es6-promise.auto.min.js"></script>
<script src="https://unpkg.com/@mapbox/mapbox-sdk/umd/mapbox-sdk.min.js"></script>
<script>
    mapboxgl.accessToken = 'pk.eyJ1IjoiY2Vld2FpIiwiYSI6ImNqbng3eDcyZDByeXgzcHBnY2w0cGloM2sifQ.NsvAT34SplBxuUvZsvUSKA';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [-77.04, 38.907],
            zoom: 17,
            pitch: 75,
            bearing: -18,
            container: 'map',
            antialias: true
    });

    <% if (user != null) { %>


    var mapboxClient = mapboxSdk({ accessToken: mapboxgl.accessToken });
        mapboxClient.geocoding
        .forwardGeocode({
            query: '<%=user.country%> <%=user.address%>  <%=user.postalCode%>',
            autocomplete: false,
            limit: 1
        })
        .send()
        .then(function(response) {
        if (
            response &&
            response.body &&
            response.body.features &&
            response.body.features.length
        ) {
            var feature = response.body.features[0];
            console.log(feature.center);

            var geojson = {
              type: 'FeatureCollection',
              features: [{
                type: 'Feature',
                geometry: {
                  type: 'Point',
                  coordinates: feature.center
                },
                properties: {
                  title: '<%= user.name%>',
                  description: '<%= user.address%>',
                }
              },
              /*{
                type: 'Feature',
                geometry: {
                  type: 'Point',
                  coordinates: [-122.414, 37.776]
                },
                properties: {
                  title: 'Mapbox',
                  description: 'San Francisco, California'
                }
              }*/
              ]
            };


            geojson.features.forEach(function(marker) {

                // create a HTML element for each feature
                var el = document.createElement('div');
                el.className = 'marker';
                el.style.backgroundImage = '<%= user.imageURL%>';

                // make a marker for each feature and add to the map
                new mapboxgl.Marker(el)
                .setLngLat(marker.geometry.coordinates)
                .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
                .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>'))
                .addTo(map);

                map.flyTo({
                    center: marker.geometry.coordinates,
                    essential: true // this animation is considered essential with respect to prefers-reduced-motion
                });

            });
            //new mapboxgl.Marker().setLngLat(feature.center).addTo(map);
            }
        <% } %>

});


// The 'building' layer in the mapbox-streets vector source contains building-height
// data from OpenStreetMap.
    
map.on('load', function() {
    // Insert the layer beneath any symbol layer.
    var layers = map.getStyle().layers;
 
    var labelLayerId;
    for (var i = 0; i < layers.length; i++) {
        if (layers[i].type === 'symbol' && layers[i].layout['text-field']) {
            labelLayerId = layers[i].id;
            break;
        }
    }
 
    map.addLayer(
    {
        'id': '3d-buildings',
        'source': 'composite',
        'source-layer': 'building',
        'filter': ['==', 'extrude', 'true'],
        'type': 'fill-extrusion',
        'minzoom': 15,
        'paint': {
            'fill-extrusion-color': '#aaa',
 
            // use an 'interpolate' expression to add a smooth transition effect to the
            // buildings as the user zooms in
            'fill-extrusion-height': [
                'interpolate',
                ['linear'],
                ['zoom'],
                15,
                0,
                15.05,
                ['get', 'height']
            ],
            'fill-extrusion-base': [
                'interpolate',
                ['linear'],
                ['zoom'],
                15,
                0,
                15.05,
                ['get', 'min_height']
            ],
            'fill-extrusion-opacity': 0.6
        }
    },
    labelLayerId
    );
});

</script>

<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

<script>
    $( document ).ready(function() {
        $(".footer__webservice").hide();
    });
</script>
</asp:Content>
