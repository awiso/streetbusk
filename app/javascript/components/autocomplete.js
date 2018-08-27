function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var performanceAddress = document.getElementById('performance_location');

    if (performanceAddress) {
      var autocomplete = new google.maps.places.Autocomplete(performanceAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(performanceAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };