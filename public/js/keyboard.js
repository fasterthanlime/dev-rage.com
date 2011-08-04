window.onkeydown = function(ev) {
       if(ev.keyCode == 37) { window.location.href = document.getElementById("prev-link").href }
  else if(ev.keyCode == 39) { window.location.href = document.getElementById("next-link").href };
}
