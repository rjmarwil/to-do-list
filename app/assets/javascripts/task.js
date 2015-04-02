$(function() {
  $("input[type='submit']").on('click', function(e) {
    e.preventDefault();
    $.ajax('/tasks', {
      method: 'POST',
      data: {"task": {"description": $('#task_description').val() }}

    }).done(function(data) {
      $("<li>" + data.description +
      "<a rel='nofollow data-method='patch' href='/tasks/" + data.id + "swap?direction=-1'>up</a></li>" +
      "<a rel='nofollow data-method='patch' href='/tasks/" + data.id + "swap?direction=1'>down</a></li>"
      ).appendTo('ol');
      $('#task_description').val('');
    }).fail(function(data) {
      console.log("we failed");
    });
  });

  $("a").on('click', function(e) {
    e.preventDefault();
    console.log(e.target.prop('href'));

    $.ajax(e.target.prop('href'), {
      method: 'PATCH'
    }).done(function(data) {
      console.log(data);
    })
  });
});
