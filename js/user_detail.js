$(document).on("pageinit", function(){
    $("#header #home").on("tap", function(){
        location.href = "welcome";
    });
    $("#user_detail").on("tap",function(){
        location.href = "user/user_detail";
    });

    $("#logout").on("tap",function(){
        location.href = "user/logout";
    });
});
