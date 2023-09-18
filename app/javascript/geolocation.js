document.addEventListener('DOMContentLoaded', function() {
  const options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0,
  };

  const geolocationButton = document.getElementById('geolocation-button');
    geolocationButton.addEventListener('click', (event) => {
      event.preventDefault()
      navigator.geolocation.getCurrentPosition(success, error, options);
      document.getElementById('searching-indicator').classList.remove('hidden');
    });
    

  function success(pos) {
    const crd = pos.coords;

    // Reverse Geocoding using Leaflet
    const latlng = L.latLng(crd.latitude, crd.longitude);

    L.Control.Geocoder.nominatim().reverse(latlng, 100000000, function(results) {
      if (results && results.length > 0) {
     
        const address = results[0].name;
        
        const locationField = document.getElementById('location');
        const hiddenLocationField = document.getElementById('hidden-location')

        if (locationField && hiddenLocationField) {
          locationField.value = address;
          hiddenLocationField.value = address;
          document.getElementById('searching-indicator').classList.add('hidden');
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
});

