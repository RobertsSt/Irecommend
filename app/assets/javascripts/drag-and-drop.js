(function() {
  var dropzone = $('#dropzone');

  dropzone.ondragover = function() {
    console.log("HALLO");
    this.className = 'dropzone dragover';
    return false;
  }
}())

  // dropzone.ondragleave = function() {
  //   this.className = 'dropzone';
  //   return false;
  // }
