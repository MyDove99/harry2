let id;
let nick;
$(document)
.on('click','#Comment_send',function(){
nick = $("#nick").text();
        var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("로그인이 필요합니다.");
			$("#userName").focus();
		}else{
		var time = new Date();
                var year =time.getFullYear();
                var month = time.getMonth()+1;
                var day =time.getDate();
                if(month <10){
                    month = '0'+month;
                }
                if(day <10){
                    day = '0'+day;
                }
                var hours = time.getHours();
                if(hours <10){
                            hours = '0'+hours;
                        }
                var min = time.getMinutes();
                if(min <10){
                            min = '0'+min;
                        }
                var sec = time.getSeconds();
                if(sec <10){
                            sec = '0'+sec;
                                }
                var times = year + "-"+month +"-"+ day+" "+hours+":"+min+":"+sec;

            var boardnum = $("#boardnum").val();
            var content = $("#Comment").val();
            var writer = $("#nick").text();

        	$.ajax({
        	    url:"/commentwrite",
        	    type :'POST',
        	    data: {"boardnum":boardnum,"content":content,"writer":writer,"times":times}
        	    ,success : function(data){
                    $("#tfoot").empty();
        	        var tbody2 = "";
        	        for(i =0; i<data.length; i++){
                        var depth =data[i].cdepth;
                        var comnum = data[i].comnum;
                        var comgroup = data[i].comgroup;
                        var writer = data[i].writer
                        var content = data[i].content;
                        var writedate = data[i].writedate;
                        if(depth==0){
                            if(nick == writer){
                                tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                writer+" · "+writedate+"</td></tr><tr>"+
                                "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                "</tr><tr><td id='답글' style='text-align:left;'>"+
                                "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                "<input type='button' id='deletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                "</td></tr><hr>"
                            }else{
                                tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                writer+" · "+writedate+"</td></tr><tr>"+
                                "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                "</tr><tr><td id='답글' colspan='2' style='text-align:left;'>"+
                                "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                "</td></tr><hr>"
                            }
                        }else{
                            if(nick == writer){
                                tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td><td>"+
                                "<input type='button' id='todeletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                "</tr><hr>"
                            }else{
                                tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td></tr><hr>"
                            }
                        }
        	        }
        	        $("#tfoot").append(tbody2);
        	        $('#commentcount').text("댓글: "+i);
        	    },error:function(){
        	        alert("통신 실패");
        	    }
        	});
        	$("#Comment").val("");
		}
})
.on('click','.tocomment',function(){
        var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("로그인이 필요합니다.");
			$("#userName").focus();
		}else{
		    $(".recom").remove();
            var eq = $(this).closest('tr').index()+1;
            id = $(this).attr("id");
            var tr = "<tr class='recom'><td id='답글 칸'>"+
                     "<textarea id='답글내용' maxlength='300' spellcheck='false'></textarea></td>"+
                     "<td id='답글 등록 칸'><input type='button' id='resultcoment' value='등록'></td></tr>";
            $("#commenttable tr:eq("+eq+")").after(tr);
		}
})
.on('click','#resultcoment',function(){
var userName = $("#userName").val();
nick = $("#nick").text();
		if(userName == null || userName.trim() == ""){
			alert("로그인이 필요합니다.");
			$("#userName").focus();
		}else{
		var time = new Date();
                    var year =time.getFullYear();
                    var month = time.getMonth()+1;
                    var day =time.getDate();
                    if(month <10){
                        month = '0'+month;
                    }
                    if(day <10){
                        day = '0'+day;
                    }
                    var hours = time.getHours();
                    if(hours <10){
                                hours = '0'+hours;
                            }
                    var min = time.getMinutes();
                    if(min <10){
                                min = '0'+min;
                            }
                    var sec = time.getSeconds();
                    if(sec <10){
                                sec = '0'+sec;
                                    }
                    var times = year + "-"+month +"-"+ day+" "+hours+":"+min+":"+sec;

            var boardnum = $("#boardnum").val();
            var content = $("#답글내용").val();
            var writer = $("#nick").text();
            var group = id.split('z');
        	$.ajax({
        	    url:"/tocommentwrite",
        	    type :'POST',
        	    data: {"boardnum":boardnum,"content":content,"writer":writer,
        	    "comgroup":group[1],"topcum":group[1],"times":times}
        	    ,success : function(data){
                    $("#tfoot").empty();
        	        var tbody2 = "";
        	        for(i =0; i<data.length; i++){
                        var depth =data[i].cdepth;
                        var comnum = data[i].comnum;
                        var comgroup = data[i].comgroup;
                        var writer = data[i].writer
                        var content = data[i].content;
                        var writedate = data[i].writedate;
                        if(depth==0){
                            if(nick == writer){
                                tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                writer+" · "+writedate+"</td></tr><tr>"+
                                "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                "</tr><tr><td id='답글' style='text-align:left;'>"+
                                "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                "<input type='button' id='deletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                "</td></tr><hr>"
                            }else{
                                tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                writer+" · "+writedate+"</td></tr><tr>"+
                                "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                "</tr><tr><td id='답글' colspan='2' style='text-align:left;'>"+
                                "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                "</td></tr><hr>"
                            }
                        }else{
                            if(nick == writer){
                                tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td><td>"+
                                "<input type='button' id='todeletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                "</tr><hr>"
                            }else{
                                tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td></tr><hr>"
                            }
                        }
        	        }
        	        $("#tfoot").append(tbody2);
        	        $('#commentcount').text("댓글: "+i);
        	    },error:function(){
        	        alert("통신 실패");
        	    }
        	});
		}
})
.on('click','#btnlike',function(){
var userName = $("#userName").val();
            if(userName == null || userName.trim() == ""){
    			alert("로그인이 필요합니다.");
    			$("#userName").focus();
    		}else{
    		var boardnum = $("#boardnum").val();
                var nick = $("#nick").text();

            	$.ajax({
            	    url:"/onliked",
            	    type :'POST',
            	    data: {"boardnum":boardnum,"nick":nick}
            	    ,success : function(data){
            	        if(data[0]==0){
            	            alert("추천완료");
            	            $("#MAB01_03").text("추천 : "+data[1]);
            	            $("#liked").text("추천 : "+data[1]);
            	        }else{
            	            alert("이미 추천하셨습니다");
            	            $("#MAB01_03").text("추천 : "+data[1]);
                            $("#liked").text("추천 : "+data[1]);
            	        }

            	    },error:function(){
            	        alert("통신 실패");
            	    }
            	});
    		}
})
.on('click','.commentdel',function(){
            id = $(this).attr("id");
            var group = id.split('z');
            var boardnum = $("#boardnum").val();
            nick = $("#nick").text();

            if(group[0]=="delete"){
                $.ajax({
                    url:"/comdelete",
                    type :'POST',
                    data: {"comnum":group[1],"boardnum":boardnum}
                    ,success : function(data){
                        $("#tfoot").empty();
                        var tbody2 = "";
                        for(i =0; i<data.length; i++){
                            var depth =data[i].cdepth;
                            var comnum = data[i].comnum;
                            var comgroup = data[i].comgroup;
                            var writer = data[i].writer
                            var content = data[i].content;
                            var writedate = data[i].writedate;
                            var deleteyn = data[i].deleteyn;
                            if(depth==0){
                                if(nick == writer){
                                    tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                    writer+" · "+writedate+"</td></tr><tr>"+
                                    "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                    "</tr><tr><td id='답글' style='text-align:left;'>"+
                                    "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                    "<input type='button' id='deletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                    "</td></tr><hr>"
                                }else{
                                    tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                    writer+" · "+writedate+"</td></tr><tr>"+
                                    "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                    "</tr><tr><td id='답글' colspan='2' style='text-align:left;'>"+
                                    "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                    "</td></tr><hr>"
                                }
                            }else{
                                if(nick == writer){
                                    tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                    "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                    "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td><td>"+
                                    "<input type='button' id='todeletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                    "</tr><hr>"
                                }else{
                                    tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                    "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                    "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td></tr><hr>"
                                }
                            }
                        }
                        $("#tfoot").append(tbody2);
                        $('#commentcount').text("댓글: "+i);
                    },error:function(){
                        alert("통신 실패");
                    }
                });
            }else{
                $.ajax({
                    url:"/tocomdelete",
                    type :'POST',
                    data: {"comnum":group[1],"boardnum":boardnum}
                    ,success : function(data){
                        $("#tfoot").empty();
                        var tbody2 = "";
                        for(i =0; i<data.length; i++){
                            var depth =data[i].cdepth;
                            var comnum = data[i].comnum;
                            var comgroup = data[i].comgroup;
                            var writer = data[i].writer
                            var content = data[i].content;
                            var writedate = data[i].writedate;
                            if(depth==0){
                                if(nick == writer){
                                    tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                    writer+" · "+writedate+"</td></tr><tr>"+
                                    "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                    "</tr><tr><td id='답글' style='text-align:left;'>"+
                                    "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                    "<input type='button' id='deletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                    "</td></tr><hr>"
                                }else{
                                    tbody2 = tbody2+"<tr><td id='list-nick' colspan='2'>"+
                                    writer+" · "+writedate+"</td></tr><tr>"+
                                    "<td id='list-contents' colspan='2'>"+content+"</td>"+
                                    "</tr><tr><td id='답글' colspan='2' style='text-align:left;'>"+
                                    "<input type='button' id='tocommentz"+comgroup+"' style='cursor:pointer;'' class='tocomment' value='답글'>"+
                                    "</td></tr><hr>"
                                }
                            }else{
                                if(nick == writer){
                                    tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                    "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                    "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td><td>"+
                                    "<input type='button' id='todeletez"+comnum+"' style='cursor:pointer; background-color:red;' class='commentdel' value='삭제'>"+
                                    "</tr><hr>"
                                }else{
                                    tbody2 = tbody2+"<tr class='recom-nick'><td id='recom-nick' colspan='2'>"+
                                    "└ "+writer+" · "+writedate+"</td></tr><tr class='recom-con'>"+
                                    "<td id='recom-con'>&nbsp&nbsp&nbsp&nbsp"+content+"</td></tr><hr>"
                                }
                            }
                        }
                        $("#tfoot").append(tbody2);
                        $('#commentcount').text("댓글: "+i);
                    },error:function(){
                        alert("통신 실패");
                    }
                });
            }
})