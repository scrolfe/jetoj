var initMap = function() {
  var eventAddress = {lat: gon.lat, lng: gon.lng}
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: new google.maps.LatLng(gon.lat, gon.lng),
  });
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(gon.lat, gon.lng),
    map: map
  });
}

// var map;
// function initMap() {
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: gon.lat, lng: gon.lng},
//     zoom: 8
//   });
// }
