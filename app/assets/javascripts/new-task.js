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

    return false;

  };

  var addTaskToList = function(taskHTML){
    var taskList = $("#task-list");
    taskList.append(taskHTML);
  };

  newTaskForm.on("submit", createNewTask);

});