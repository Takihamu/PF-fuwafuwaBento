$(function () {
  var customer_id = $("#calendar").data('customer-id');
  // $("td[data-date='2021-12-02']").css("backgrond-color", "red");
 // console.log(11111111)
  //console.log(customer_id)

  $('#calendar').fullCalendar({
    events: `${customer_id}.json`,
  })
})
