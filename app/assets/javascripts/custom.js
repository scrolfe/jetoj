console.log('ready');

// var jetoj_logo = $('#jetoj-logo')
// var menu = $('menu')


originalClasses = () => {
    $('jetoj-logo').removeClass('col-xs-5 col-xs-offset-1')
    $('jetoj-logo').addClass('col-xs-12');
    $('.row').children().eq(1).remove()
}

logoResize = () => {
    $('#jetoj-logo').removeClass('col-xs-12');
    $('#jetoj-logo').addClass('col-xs-5 col-xs-offset-1');
}
spacing = () => {
    $('#jetoj-logo').css('padding', 0);
}
addJetojRight = () => {
        $('.row').eq(0).append("<img src='https://s3.us-east-2.amazonaws.com/jetoj/jetoj-right.jpg' class='col-xs-2 col-xs-offset-4'>");
}



$(window).on('scroll', function(e) {
    if ($(window).scrollTop() > 400) {
        logoResize();
        spacing();
        if ($('.row').eq(0).children().length === 1) {
            addJetojRight();
        }
    } else {
        originalClasses();
    }
})
