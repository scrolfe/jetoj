console.log('ready');

// var jetoj_logo = $('#jetoj-logo')
// var menu = $('menu')

$(window).on('scroll', function(e) {
    if ($(window).scrollTop() > 400) {
        $('#jetoj-logo').removeClass('col-xs-12');
        console.log('removed');
        console.log($('#jetoj-logo'));
        $('#jetoj-logo').addClass('col-xs-5');
        $('#jetoj-logo').addClass('col-xs-offset-1');
        console.log('added');
    };
})
