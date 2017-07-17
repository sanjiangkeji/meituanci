$(document).on("pageinit", function(){
    $("#left img").on("tap", function(){
        location.href = "welcome/index";
    });

    $("#header #collect .im-collect").on('tap',function(){
        var _that = $(this);
        var productId = $('.product_id').val();
        $.get('user/collect',{'product_id':productId},function(data){
            if(data == 'success'){
                _that.children('span').html("取消");
                _that.addClass('im-collect');
                //_that.css('background-image',"url('img/star-yellow.png')");
            }
            else if(data == 'fail'){
                location.href="user/login_page";
            }
        },'text');
    });
});
