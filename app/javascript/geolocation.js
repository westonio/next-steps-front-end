
document.addEventListener('DOMContentLoaded', function() {
  const options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0,
  };

  function success(pos) {
    const crd = pos.coords;

    // Reverse Geocoding using Leaflet
    const latlng = L.latLng(crd.latitude, crd.longitude);

    L.Control.Geocoder.nominatim().reverse(latlng, 100000000, function(results) {
      if (results && results.length > 0) {
     
        const address = results[0].name;

        const locationField = document.getElementById('location');
        if (locationField) {
          locationField.value = address;
        }
      } else {
        console.error('No results found');
      }
    });

    console.log("Your current position is:");
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    console.log(`More or less ${crd.accuracy} meters.`);
  }

  function error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }

  navigator.geolocation.getCurrentPosition(success, error, options);
});

