console.log('ready');

// var jetoj_logo = $('#jetoj-logo')
// var menu = $('menu')

//
// $(window).on('scroll', function(e) {
//     if ($(window).scrollTop > 400) {
//         $('.row').eq(0).toggle('col-xs-5 col-xs-offset-1');
//     }
// })

jetojRightProps = () => {
    var icon = $('#jetoj-right');
    icon.css('max-width', '100px');
    icon.css('max-height', '100px');
}

logoResize = () => {
    $('#jetoj-logo').removeClass('col-xs-12');
    $('#jetoj-logo').addClass('col-xs-5 col-xs-offset-1');
    $('#jetoj-logo').css('padding', 0);
}
addJetojRight = () => {
        $('.row').eq(0).append("<img src='https://s3.us-east-2.amazonaws.com/jetoj/jetoj-right.jpg' class='col-xs-2 col-xs-offset-4' id='jetoj-right'>");
}
headerAffix = () => {
    $('.nav').addClass('navbar-fixed-top');
}

originalClasses = () => {
    $('#jetoj-logo').removeClass('col-xs-5 col-xs-offset-1');
    $('#jetoj-logo').addClass('col-xs-12');
    $('#jetoj-right').remove();
    // $('.menu').css('position', 'static')
}

$(window).on('scroll', function(e) {
    if ($(window).scrollTop() > 400) {
        logoResize();
        headerAffix();
        if ($('.row').eq(0).children().length === 1) {
            addJetojRight();
            jetojRightProps();
        }
    } else {
        originalClasses();
    }

})
