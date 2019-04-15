function toggleShowLikes(id) {
  var element = document.getElementById("likes-section-"+id);

  if (element.classList) {
    element.classList.toggle("is-active");
  }
}
