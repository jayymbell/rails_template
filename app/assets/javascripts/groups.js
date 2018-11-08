$( document ).ready(function() {
    autocomplete(document.getElementById("group_available_users"), JSON.parse($('#group_available_users').attr("data-autocomplete-source")), document.getElementById("group_add_user"));
});