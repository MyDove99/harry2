$(document)
.on('click','#Search-Button',function(){
    var search = $('#Search-Box').val();
    location.href='search?search='+search;
})