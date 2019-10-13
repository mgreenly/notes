/* site.js */
document.addEventListener("DOMContentLoaded", function(event) { 
  console.log('DOM Content Loaded!');
});

function myFunction(p1, p2) {
  var ts = new Date();
  document.getElementById("target").innerHTML = ts.toISOString();
}
