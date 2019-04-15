function toggleNavBar() {
  var mobileElement = document.getElementById("mobile-nav-bar");
  var element = document.getElementById("nav-bar");

  if (element.classList) {
    element.classList.toggle("is-active");
    mobileElement.classList.toggle("is-active");
  }
  event.stopPropagation()
}

function closeNavBar() {
  var mobileElement = document.getElementById("mobile-nav-bar");
  var element = document.getElementById("nav-bar");

  if (element.classList) {
    element.classList.remove("is-active");
    mobileElement.classList.remove("is-active");
  }
}
