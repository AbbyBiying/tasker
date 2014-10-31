$(function(){
  var deleteTasks = $(".delete-task");

  var deleteTask = function(){ 
    var task = $(this).parent();
    
    var url = $(this).attr("action");
    var taskRequest = $.ajax ({  
      type: "DELETE",
      url: url
    });  
    task.remove();

    return false;

  };

 
  deleteTasks.on("submit", deleteTask)

});