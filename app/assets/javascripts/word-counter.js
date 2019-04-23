document.addEventListener("turbolinks:load", function() {
  var textarea = document.querySelector("textarea");
  if (textarea) {
    textarea.addEventListener("input", function(){
      var maxlength = 420;
      var currentLength = this.value.length;
      if( currentLength > 0 ){
        document.querySelector("div.textcount").innerHTML = (maxlength - currentLength);
        document.querySelector("div.textcount").style.color = "#00FF00";
        if ( currentLength > maxlength ) document.querySelector("div.textcount").style.color = "red";
        if ( currentLength > maxlength-5 && currentLength < maxlength+1 ) document.querySelector("div.textcount").style.color = "orange";
      }
    });
  }
})
