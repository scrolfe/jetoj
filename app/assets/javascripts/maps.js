<<<<<<< Updated upstream
initMap = () => {
  let lat = @event.lat 
  let lng = <%= @event.lng %>
  let map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: {lat: lat, lng: lng}
  });
  let marker = new google.maps.Marker({
    position: {lat: lat, lng: lng},
    map: map
  });
}
=======
// const initMap = function(){
//   let eventAddress = {lat: gon.lat, lng: gon.lng}
//   const map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 7,
//     center: {lat: event.lat, lng: event.lng}
//   });
//   const marker = new google.maps.Marker({
//     position: {lat: event.lat, lng: event.lng},
//     map: map
//   });
// }
// initMap();

var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
>>>>>>> Stashed changes
