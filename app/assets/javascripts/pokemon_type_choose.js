// Create a CHANGE function to see if changing type meet the requirements
function update_checkboxes() {
    // Create a variable to see how many boxes been check
    var $curr=$('.checkbox_type input:checkbox:checked');
  
    // Check to see if we fufill the requirement of how many check box can user have
    if ($curr.length == 2) {
      $('.checkbox_type input:checkbox:not(:checked)').attr("disabled", true);
    }
    else {
      $('.checkbox_type input:checkbox').attr("disabled", false);
    }
}


// Create the ON LOAD event for the checkbox
$(document).ready(function() {
    // Create a variable to see how many boxes been check
    var $see_check=$('.checkbox_type input:checkbox:checked');
  
    // Check to see if we fufill the requirement of how many check box can user have
    if ($see_check.length == 2) {
      $('.checkbox_type input:checkbox:not(:checked)').attr("disabled", true);
    }
    else {
      $('.checkbox_type input:checkbox').attr("disabled", false);
    }
});