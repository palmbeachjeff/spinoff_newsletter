$(function(){
  $('#spinoffs').on('click', '.pagination > a', function(){
    $.get(this.href, null, null, "script");
    return false;
  });
});

// min 1 should be into (intro to you and project- title of app, what it does and why you built it)
// min 2 - 4 should be your tech stack with live demo or slides (what it actually does and how)
// outro - What you've learned as a developer throughout the course
