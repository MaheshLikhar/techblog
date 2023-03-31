function doLiked(pid,uid){
    
//    console.log(pid,uid);
    
    const d = {
        PID : pid,
        UID : uid,
        Operation :'like'
    };
    
    
    $.ajax({
        url : "LikeServlet",
        data : d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            
            var c= $('.like-counter').html()
            
            if(data.trim()==='true'){
                let c= $('.like-counter').html();
                c++;
                
                $('.like-counter').html(c);
            }else{
                 var c= $('.like-counter').html()
                c--;
                $('.like-counter').html(c);
            }
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
             console.log(data);
        }   
    });
    
}