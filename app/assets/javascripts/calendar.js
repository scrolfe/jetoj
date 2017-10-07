$(document).on('turbolinks:load', () => {
  $.ajax({
    url: "/events/calendar",
    cache: false,
    success: function(response) {
      console.log(response);
      let calData = JSON.parse(response.data);
      console.log(calData);

      $('#calendar').fullCalendar({
        header: {
          left: 'prev, next, today',
          center: 'title',
          right: 'month, agendaWeek, listYear'
        },
        selectable: true,
        selectHelper: true,
        events: calData,

        // events: [
        //   {
        //     title: response.data['title'],
        //     start: response.data['start'],
        //     end: response.data['end']
        //   }
        // ],
        defaultDate: "2018-10-01",
        editable: true,
        eventLimit: true, // allow "more" link when too many events
      });


    }
  })


})
