$(document).ready(() => {
  $("a[role='tab']").on('click', (event) => {
    let mediumType = $(event.target).attr('aria-controls');
    $("input[name='medium[medium_type]']").attr("value", mediumType);
  })
})
