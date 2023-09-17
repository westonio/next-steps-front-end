document.addEventListener('DOMContentLoaded', function() {
 const locationField = document.getElementById('location');
  const hiddenLocationField = document.getElementById('hidden-location');

  locationField.addEventListener('input', function() {
    console.log('Input event triggered');
    hiddenLocationField.value = this.value;
  });
});
