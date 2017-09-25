console.log('ready')

var logo = $('#jetoj-logo');

logo.on('scroll', function(e) {
  console.log('test')
  if (this.scrollTop() > $(window).height() * 0.5) {
    console.log('triggered')
  }
});
