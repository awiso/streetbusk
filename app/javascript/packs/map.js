import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';
import { mySwiper, getActiveSlide, animateActiveSlide } from './performance_slider.js'

const mapElement = document.getElementById('map');
const styles = [
    {
        "featureType": "all",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "weight": "2.00"
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#9c9c9c"
            }
        ]
    },
    {
        "featureType": "all",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#eeeeee"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#7b7b7b"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#46bcec"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#c8d7d4"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#070707"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ffffff"
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
    scaledSize: new google.maps.Size(15, 15)
  };

  markers.forEach(function(marker) {
    marker.icon = image
  });

  const icons = {
        //   active: 'https://maps.google.com/mapfiles/ms/icons/orange.png',
        //   regular: 'https://maps.google.com/mapfiles/ms/icons/blue.png',
        // active: {url: 'http://res.cloudinary.com/djvp4os8m/image/upload/v1535652658/mark_active.svg', scaledSize: new google.maps.Size(50, 50) },
        // regular: {url: 'http://res.cloudinary.com/djvp4os8m/image/upload/v1535652658/mark_inactive.svg', scaledSize: new google.maps.Size(50, 50) },
        active: {url: 'https://res.cloudinary.com/djvp4os8m/image/upload/v1535705045/main-pin.png', scaledSize: new google.maps.Size(40, 40) },
        regular: {url: 'https://res.cloudinary.com/djvp4os8m/image/upload/v1535705052/map-pin.png', scaledSize: new google.maps.Size(40, 40) },
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

document.addEventListener("DOMContentLoaded", function(event) {
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
});

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

const cardsContainer = document.querySelector('#cards-performances');
 if(mapElement && cardsContainer){
  //  if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
  //    $( document ).ready(function() {
  //      mapElement.style.height = ($( window ).height() - cardsContainer.clientHeight) + "px";
  //    });
  //
  // }
  // else{
    $( document ).ready(function() {
      mapElement.style.height = ($( window ).height() - cardsContainer.clientHeight - 80) + "px";
    });
  // }
 }

autocomplete();
