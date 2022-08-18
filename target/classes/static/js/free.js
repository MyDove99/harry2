$(document)
    .on('click','.page',function(){
        var page = $(this).text();
        var category = $("#category").val();
    	$.ajax({
    	    url:"/paging",
    	    type :'POST',
    	    data: {"paging":page,"category":category}
    	    ,success : function(data){
    	        $("#tbody").empty();

                var url = "location.href='read?boardnum="
                var tbody = "";
                	        for(i =0; i<data.length; i++){
                	            var catename = data[i].catename;
                                var boardnum =data[i].boardnum;
                                var boardname = data[i].boardname;
                                var writer = data[i].writer
                                var views = data[i].views;
                                var writedate = data[i].writedate;
                                var date = writedate.substr(0,10);
                                var category = data[i].category;
                                tbody = tbody+"<tr class='Main-All-Board-Contents'><td class='MAB02_01'>"+catename+"</td>"+
                                "<td class='MAB02_02' style='text-align: left; cursor:pointer;'onclick='"+url+boardnum+"'>"+boardname+
                                "</td><td class='MAB02_03'>"+writer+"</td><td class='MAB02_04'>"+date+"</td><td class='MAB02_05'>"+
                                views+"</td></tr><input type='hidden' id='category' value="+category+">"
                	        }
                $("#tbody").append(tbody);
    	    },error:function(){
    	        alert("통신 실패");
    	    }
    	});
    })