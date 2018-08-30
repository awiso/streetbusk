import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
import { mySwiper, getActiveSlide, animateActiveSlide } from './performance_slider.js'

const mapElement = document.getElementById('map');
const styles = [
{
        "featureType": "all",
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#ff4400"
            },
            {
                "saturation": -68
            },
            {
                "lightness": -4
            },
            {
                "gamma": 0.72
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry",
        "stylers": [
            {
                "hue": "#0077ff"
            },
            {
                "gamma": 3.1
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.attraction",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.government",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.medical",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#44ff00"
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "saturation": -64
            },
            {
                "hue": "#ff9100"
            },
            {
                "lightness": 16
            },
            {
                "gamma": 0.47
            },
            {
                "weight": 2.7
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": -48
            },
            {
                "hue": "#ff5e00"
            },
            {
                "gamma": 1.2
            },
            {
                "saturation": -23
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "hue": "#00ccff"
            },
            {
                "gamma": 0.44
            },
            {
                "saturation": -33
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "hue": "#007fff"
            },
            {
                "gamma": 0.77
            },
            {
                "saturation": 65
            },
            {
                "lightness": 99
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "gamma": 0.11
            },
            {
                "weight": 5.6
            },
            {
                "saturation": 99
            },
            {
                "hue": "#0091ff"
            },
            {
                "lightness": -86
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    }
]



if (mapElement) { // don't try to build a map if there's no div#map to inject in
 const map = new GMaps({ el: '#map', lat: 47, lng: 2, disableDefaultUI: true, zoom: 4 });
  const markers = JSON.parse(mapElement.dataset.markers);


  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');


  const image = {
    url: "http://www.pngall.com/wp-content/uploads/2017/05/Map-Marker-Free-Download-PNG-180x180.png",
    scaledSize: new google.maps.Size(40, 40)
  };

  markers.forEach(function(marker) {
    marker.icon = image
  });

  const icons = {
          active: 'https://maps.google.com/mapfiles/ms/icons/orange.png',
          regular: 'https://maps.google.com/mapfiles/ms/icons/blue.png',
          person: 'https://icon-icons.com/icons2/403/PNG/32/user-orange_40489.png'
        };

  let mapMarkers = [];
  markers.forEach((marker, index) => {

    //if same let long then assign to same pin
    //push the same map marker to array
    const mapMarker = map.createMarker({
      lat: marker.lat,
      lng: marker.lng,
      icon: index == 0 ? icons["active"]: icons["regular"],
      click: (function (marker) {
            return function () {
              changeMarkerColor(index);
              if (mySwiper){
                mySwiper.slideTo(marker.index, 500);
              }
              animateActiveSlide(index);
            };
        })(marker)
      });
    mapMarkers.push(mapMarker);
    map.addMarker(mapMarker);
  });


  //mySwiper on change
if(mySwiper){
  const swiperContainer = document.querySelector('.swiper-container');
  if(swiperContainer.dataset.slider=="performances_index"){
    mySwiper.on('touchEnd', function(e){
      let activeIndex = getActiveSlide();
      changeMarkerColor(activeIndex);
    })
  }
}

function changeMarkerColor(index){
  mapMarkers.forEach(marker => {
    marker.setIcon(icons["regular"]);
    marker.setZIndex(0);
  })
  mapMarkers[index].setIcon(icons["active"]);
  mapMarkers[index].setZIndex(999);
}

if (!window.location.search.includes("query")){
  navigator.geolocation.getCurrentPosition(function(position) {
    map.setCenter(position.coords.latitude, position.coords.longitude);
    map.setZoom(12);
    const currentLocMarker = map.createMarker({
      lat:position.coords.latitude,
      lng: position.coords.longitude,
      icon: icons["person"]
    })
    map.addMarker(currentLocMarker);
  }, function() {
    alert("Your browser does not support geolocation");
  });
}

//Unmark to use old one
  // old one
  if (markers.length === 0) {
    map.setZoom(0);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(10);
  } else {
    map.fitLatLngBounds(markers);
  }

}; // if map present

 if(window.location.pathname == "/performances"){
   const cardsContainer = document.querySelector('.cards-container');
   mapElement.style.height = ($( window ).height() - cardsContainer.clientHeight - 80) + "px";
 }

autocomplete();
