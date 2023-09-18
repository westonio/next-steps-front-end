document.addEventListener('DOMContentLoaded', function() {
 const locationField = document.getElementById('location');
  const hiddenLocationField = document.getElementById('hidden-location');

  locationField.addEventListener('input', function() {
    console.log('Address copied to hidden field');
    hiddenLocationField.value = this.value;
  });
});
