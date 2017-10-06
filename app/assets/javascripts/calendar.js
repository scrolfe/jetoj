$(document).ready(() => {
  $('#calendar').fullCalendar({
    header: {
      left: 'prev, next, today',
      center: 'title',
      right: 'month, agendaWeek'
    },
    selectable: true,
    selectHelper: true,
    events: [
      {
        title: "Test Title",
        start: "2017-10-07",
        end: "2017-10-08"
      }
    ],
    defaultDate: moment(),
    editable: true,
    eventLimit: true, // allow "more" link when too many events
  });
})
