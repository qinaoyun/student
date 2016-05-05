<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-sm-3 " style="margin-top:-96px;" >
   
<div class="widget-container widget_avatar boxed">
    <div class="avatar-image">
        <img src="<%=request.getContextPath()%>/module/images/temp/avatar-image.jpg" alt="" />
    </div>
    <div class="inner clearfix">
        <div class="avatar">
            <img src="<%=request.getContextPath()%>${frontnumber.sheadimg}" alt="" />
        </div>
        <h5>${frontnumber.sname}</h5>
        <span class="subtitle">
            ${frontnumber.sdesc}
        </span>
    </div>
    <div class="post-meta-links">
        <ul class="clearfix">
            <li class="post-view">
                <a href="<%=request.getContextPath() %>/front/personInfoModify.jsp"><span><i class="icon-post"></i>设置</span></a>
            </li>
            <li class="post-comm">
                <a href="<%=request.getContextPath() %>/getTimeProcessWork.do"><span><i class="icon-post"></i>时光机</span></a>
            </li>
            <li class="post-like">
                <a href="<%=request.getContextPath() %>/getClassfiles.do"><span><i class="icon-post"></i>库</span></a>
            </li>
        </ul>
    </div>
</div>
<!--dddddddddddddddddddddddd-->


<!--panel-->
<div class="widget-container widget_gallery boxed">
        <div class="inner">
            <div id="myCarousel" class="carousel slide" data-interval="20000">
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item"><img src="<%=request.getContextPath()%>/module/images/temp/post_img6.jpg" alt="" /><div class="carousel-desc"><span>Wild Deer</span></div></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/module/images/temp/post_img1.jpg" alt="" /><div class="carousel-desc"><span>Change your fate</span></div></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/module/images/temp/post_img3.jpg" alt="" /><div class="carousel-desc"><span>Unstoppable hero</span></div></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/module/images/temp/post_img2.jpg" alt="" /><div class="carousel-desc"><span>Change your fate</span></div></div>
                    <div class="item"><img src="<%=request.getContextPath()%>/module/images/temp/post_img4.jpg" alt="" /><div class="carousel-desc"><span>Unstoppable hero</span></div></div>
                </div>
                <!-- Carousel indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                    <li data-target="#myCarousel" data-slide-to="4"></li>
                </ol>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev"></a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next"></a>
            </div>
        </div>
    </div>

<!-- link -->
        <div class="horizontal widget-social boxed ">
        <ul class="rerange">
        <li>
            <a href="#" class="social-facebook"><span>Facebook</span></a>
        </li>
        <li>
            <a href="#" class="social-pinterest"><span>Pinterest</span></a>
        </li>
        <li>
            <a href="#" class="social-twitter"><span>Twitter</span></a>
        </li>
       </ul>
</div>
<!-- link -->
<!--panel-->


</div>