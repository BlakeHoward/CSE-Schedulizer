/**
 * Created by blake on 11/30/16.
 */


 $(document).on('turbolinks:load',function() {
     $("#showNav").click(function() {
         $('.ui.labeled.icon.sidebar').sidebar('toggle');
     });
});


$(document).ready(function() {
    $("#showNav").click(function() {
        $('.ui.labeled.icon.sidebar').sidebar('toggle');
    });
});
