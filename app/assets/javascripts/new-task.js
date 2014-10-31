$(function(){
  var newTaskForm = $("#new_task");

  var createNewTask = function(){
    var formData = newTaskForm.serialize();

    var taskRequest = $.ajax ({
      type: "POST",
      url: "/tasks",
      data: formData
    });

    taskRequest.done(addTaskToList);
    taskRequest.fail(addTaskError);
    return false;

  };

  var addTaskToList = function(taskHTML){
    var taskList = $("#task-list");
    taskList.append(taskHTML);
  };


  var addTaskError = function(response) {
    
    var errorMessage = "<p>We could not save your task.</p>"
    $("#errors").html(response.responseText)

  };


  newTaskForm.on("submit", createNewTask);

});