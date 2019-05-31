function filterUsernames() {
  var input, filter, ul, li, a, i, txtValue;
  input = document.getElementsByClassName('activeSearch')[0];
  filter = input.value.toUpperCase(); // Lai būtu case insesitive
  ul = document.getElementsByClassName('activeUsernames')[0];
  li = ul.getElementsByTagName("li");
  if (!ul.classList.contains("has-display-block")) {
    ul.classList.toggle("has-display-block"); //rāda matching usernames
  }
  if (filter.length < 2) {
    ul.classList.remove("has-display-block") //rāda usernames sākot no otrā simbola
  }
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    txtValue = a.textContent || a.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}

jQuery(document).ready(function($) { #tiek izvēlēts aktīvais search bar atkarībā no ekrāna izmēra
  var alterClass = function() {
    var ww = document.body.clientWidth;
    if (ww > 1456) {
      $('#searchUsername1').addClass('activeSearch');
      $('#AllUsernames1').addClass('activeUsernames');
      $('#searchUsername2').removeClass('activeSearch');
      $('#AllUsernames2').removeClass('activeUsernames');
      $('#searchUsername3').removeClass('activeSearch');
      $('#AllUsernames3').removeClass('activeUsernames');
    } else if (ww > 753) {
      $('#searchUsername2').addClass('activeSearch');
      $('#AllUsernames2').addClass('activeUsernames');
      $('#searchUsername1').removeClass('activeSearch');
      $('#AllUsernames1').removeClass('activeUsernames');
      $('#searchUsername3').removeClass('activeSearch');
      $('#AllUsernames3').removeClass('activeUsernames');
    } else {
      $('#searchUsername3').addClass('activeSearch');
      $('#AllUsernames3').addClass('activeUsernames');
      $('#searchUsername1').removeClass('activeSearch');
      $('#AllUsernames1').removeClass('activeUsernames');
      $('#searchUsername2').removeClass('activeSearch');
      $('#AllUsernames2').removeClass('activeUsernames');
    };
  };
  $(window).resize(function(){ //kad izmaina izmēru maina klases
    alterClass();
  });
  alterClass();   //Kad lapa ielādējas uzliek klasi
});
