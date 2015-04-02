$(function() {
  $("input[type='submit']").on('click', function(e) {
    e.preventDefault();
    $.ajax('/tasks', {
      method: 'POST',
      data: {"task": {"description": $('#task_description').val() }}
    }).done(function(data) {
      $("<li>" + data.description + "</li>").appendTo('ol');
      $('#task_description').val('');
    }).fail(function(data) {
      console.log("we failed");
    });
  });
});
