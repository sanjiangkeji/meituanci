$(document).on("pageinit", function(){
    $("#left").on("tap", function(){
        history.go(-1);
    });
    $("#header #home").on("tap", function(){
        location.href = "welcome";
    });

    var path1="img/star-gray.png";
    var path2="img/star-yellow.png";
    $('.score .star #img1').on('tap',function(){
        $(".score .star img").attr('src',path1);
        $(this).attr('src',path2);
        $('#comment .score').val(1);
    });

    $('.score .star #img2').on('tap',function(){
        $(".score .star img").attr('src',path1);
        $(".score .star #img1").attr('src',path2);
        $(".score .star #img2").attr('src',path2);
        $('#comment .score').val(2);
    });

    $('.score .star #img3').on('tap',function(){
        $(".score .star img").attr('src',path1);
        $(".score .star #img1").attr('src',path2);
        $(".score .star #img2").attr('src',path2);
        $(".score .star #img3").attr('src',path2);
        $('#comment .score').val(3);
    });

    $('.score .star #img4').on('tap',function(){
        $(".score .star img").attr('src',path1);
        $(".score .star #img1").attr('src',path2);
        $(".score .star #img2").attr('src',path2);
        $(".score .star #img3").attr('src',path2);
        $(".score .star #img4").attr('src',path2);
        $('#comment .score').val(4);
    });

    $('.score .star #img5').on('tap',function(){
        $(".score .star img").attr('src',path2);
        $('#comment .score').val(5);
    });

    $('#submit').on('tap',function(){
        var productId=$('#comment .product_id').val();
        var orderId=$('#comment .order_id').val();
        var score=$('#comment .score').val();
        var content=$('#comment .content').val();
        location.href="user/add_comment/"+productId+'/'+orderId+'/'+score+'/'+content;
    });
});
