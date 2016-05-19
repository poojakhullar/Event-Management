<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Nested Slider Demo - Jssor Slider, Slideshow with Javascript Source Code</title>
</head>
<body style="font-family:Arial, Verdana;background-color:black;">
    <!-- it works the same with all jquery version from 1.x to 2.x -->
    <!-- <script type="text/javascript" src="../rajaTrail/JSfiles/jquery-1.9.1.min.js"></script> -->
    <!-- use jssor.slider.mini.js (40KB) or jssor.sliderc.mini.js (32KB, with caption, no slideshow) or jssor.sliders.mini.js (28KB, no caption, no slideshow) instead for release -->
    <!-- jssor.slider.mini.js = jssor.sliderc.mini.js = jssor.sliders.mini.js = (jssor.js + jssor.slider.js) -->
    <script>

        jQuery(document).ready(function ($) {

            var nestedSliders = [];

            $.each(["sliderh1_container", "sliderh2_container", "sliderh3_container"], function (index, containerId) {
                var nestedSliderOptions = {
                    $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1
                    $SlideDuration: 400,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                    $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                    //$SlideWidth: 200,                                   //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                    //$SlideHeight: 150,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                    $SlideSpacing: 3, 					                //[Optional] Space between each slide in pixels, default value is 0
                    $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                    $ParkingPosition: 0,                              //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                    $UISearchMode: 0,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).

                    $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                        $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                        $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                        $AutoCenter: 0,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                        $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                        $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                        $SpacingX: 10,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                        $SpacingY: 0,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                        $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                    }
                };

                nestedSliders.push(new $JssorSlider$(containerId, nestedSliderOptions));
            });

            var options = {
                $AutoPlay: false,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 2000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 300,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 80,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 150,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 3, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 0,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 2,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 0,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0),
                
                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $AutoCenter: 3,                                 //[Optional] Auto center thumbnail items in the thumbnail navigator container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 3
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange thumbnails, default value is 1
                    $SpacingX: 0,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 0,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 3,                              //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 0,                          //[Optional] The offset position to park thumbnail
                    $Orientation: 1,                                //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
                    $DisableDrag: false                            //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            function OnMainSliderPark(currentIndex, fromIndex) {
                $.each(nestedSliders, function (index, nestedSlider) {
                    nestedSlider.$Pause();
                });

                setTimeout(function () {
                    nestedSliders[currentIndex].$Play();
                }, 2000);
            }

            jssor_slider1.$On($JssorSlider$.$EVT_PARK, OnMainSliderPark);
            OnMainSliderPark(0, 0);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$ScaleWidth(Math.min(bodyWidth, bodyWidth*(0.8)));
                else
                    window.setTimeout(ScaleSlider, 30);
            }

            ScaleSlider();

            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $(window).bind('resize', ScaleSlider);
            }


            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
            //    $(window).bind("orientationchange", ScaleSlider);
            //}
            //responsive code end
        });
    </script>
    <!-- sliderh style begin -->
    <style>
        /* jssor slider bullet navigator skin 03 css */
        /*
        .jssorb03 div           (normal)
        .jssorb03 div:hover     (normal mouseover)
        .jssorb03 .av           (active)
        .jssorb03 .av:hover     (active mouseover)
        .jssorb03 .dn           (mousedown)
        */
        .jssorb03 div, .jssorb03 div:hover, .jssorb03 .av
        {
			background: url(${pageContext.request.contextPath}/resources/images/Slider/b03.png) no-repeat; 
            overflow:hidden;
            cursor: pointer;
        }
        .jssorb03 div { background-position: -5px -4px; }
        .jssorb03 div:hover, .jssorb03 .av:hover { background-position: -35px -4px; }
        .jssorb03 .av { background-position: -65px -4px; }
        .jssorb03 .dn, .jssorb03 .dn:hover { background-position: -95px -4px; }
    </style>
    <!-- sliderh style end -->
    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->
    <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 1200px; height: 305px; overflow: hidden; ">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(url(${pageContext.request.contextPath}/resources/images/Slider/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1200px; height: 300px;
            overflow: hidden;">
            <div>
                <div id="sliderh1_container" class="sliderh1" style="position: relative; top: 0px; left: 0px; width: 1200px;
                    height: 300px;">

                    <!-- Slides Container -->
                    <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1200px; height: 300px;
                        overflow: hidden;">
                      <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/05.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/06.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/07.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/01.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/02.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/03.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Past/04.jpg" /></div> 
                    </div>
                    <!-- Bullet Navigator Skin Begin -->
                    <!-- bullet navigator container -->
                    <div u="navigator" class="jssorb03" style="position: absolute; bottom: 10px; right: 10px;">
                        <!-- bullet navigator item prototype -->
                        <div u="prototype" style="position: absolute; width: 21px; height: 21px; text-align:center; line-height:21px; color:white; font-size:12px;"><NumberTemplate></NumberTemplate></div>
                    </div>
                    <!-- Bullet Navigator Skin End -->
                </div>
                <div u="thumb">
                    <img src="${pageContext.request.contextPath}/resources/images/Slider/landscape.jpg" />
                    <div class="title_back"></div>
                    <div class="title">
                        Past Events
                    </div>
                </div>
            </div>
            <div>
                <div id="sliderh2_container" class="sliderh2" style="position: relative; top: 0px; left: 0px; width: 1200px;
                    height: 300px;">

                    <!-- Slides Container -->
                    <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1200px; height: 300px;
                        overflow: hidden;">
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/001.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/002.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/003.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/004.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/005.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/006.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/007.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Present/008.jpg" /></div>
                    </div>
                    <!-- Bullet Navigator Skin Begin -->
                    <!-- bullet navigator container -->
                    <div u="navigator" class="jssorb03" style="position: absolute; bottom: 10px; right: 10px;">
                        <!-- bullet navigator item prototype -->
                        <div u="prototype" style="position: absolute; width: 21px; height: 21px; text-align:center; line-height:21px; color:white; font-size:12px;"><NumberTemplate></NumberTemplate></div>
                    </div>
                    <!-- Bullet Navigator Skin End -->
                </div>
                <div u="thumb">
                    <img src="${pageContext.request.contextPath}/resources/images/Slider/motor.jpg" />
                    <div class="title_back"></div>
                    <div class="title">
                        Present Events
                    </div>
                </div>
            </div>
            <div>
                <div id="sliderh3_container" class="sliderh3" style="position: relative; top: 0px; left: 0px; width: 1200px;
                    height: 300px;">

                    <!-- Slides Container -->
                    <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1200px; height: 300px;
                        overflow: hidden;">
                        <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/004.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/005.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/006.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/007.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/008.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/009.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/010.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/011.jpg" /></div>
                       <div><img u="image" src="${pageContext.request.contextPath}/resources/images/Slider/Future/012.jpg" /></div>
                    </div>
                    <!-- Bullet Navigator Skin Begin -->
                    <!-- bullet navigator container -->
                    <div u="navigator" class="jssorb03" style="position: absolute; bottom: 10px; right: 10px;">
                        <!-- bullet navigator item prototype -->
                        <div u="prototype" style="position: absolute; width: 21px; height: 21px; text-align:center; line-height:21px; color:white; font-size:12px;"><NumberTemplate></NumberTemplate></div>
                    </div>
                    <!-- Bullet Navigator Skin End -->
                </div>
                <div u="thumb">
                    <img src="${pageContext.request.contextPath}/resources/images/Slider/photography.jpg" />
                    <div class="title_back"></div>
                    <div class="title">
                        UpComing Events
                    </div>
                </div>
            </div> 
           
        </div>
        <!-- ThumbnailNavigator Skin Begin -->
        <div u="thumbnavigator" class="jssort12" style="cursor: default;border: green 0px dashed; position: absolute; width: 600px; height: 100px; left:0px; bottom: 0px; top : 200px">

            <!-- Thumbnail Item Skin Begin -->
            <style>
                /* jssor slider thumbnail Navigator Skin 12 css */
                /*
                .jssort12 .p            (normal)
                .jssort12 .p:hover      (normal mouseover)
                .jssort12 .pav          (active)
                .jssort12 .pav:hover    (active mouseover)
                .jssort12 .pdn          (mousedown)
                */
                .jssort12 .p img {
                    FILTER: alpha(opacity=55);
                    opacity: .55;
                    transition: opacity .6s;
                    -moz-transition: opacity .6s;
                    -webkit-transition: opacity .6s;
                    -o-transition: opacity .6s;
                }

                .jssort12 .pav img, .jssort12 .pav:hover img, .jssort12 .p:hover img {
                    FILTER: alpha(opacity=100);
                    opacity: 1;
                    transition: none;
                    -moz-transition: none;
                    -webkit-transition: none;
                    -o-transition: none;
                }

                .jssort12 .pav:hover img, .jssort12 .p:hover img {
                    FILTER: alpha(opacity=70);
                    opacity: .7;
                }

                .jssort12 .title, .jssort12 .title_back {
                    position: absolute;
                    top: 75px;
                    left: 0px;
                    width: 200px;
                    height: 30px;
                    line-height: 30px;
                    text-align: center;
                    color: #000;
                    font-size: 20px;
                }

                .jssort12 .title_back {
                    background-color: #fff;
                    filter: alpha(opacity=50);
                    opacity: .5;
                }

                .jssort12 .pav:hover .title_back, .jssort12 .p:hover .title_back {
                    filter: alpha(opacity=40);
                    opacity: .4;
                }

                .jssort12 .pav .title_back {
                    background-color: #000;
                    filter: alpha(opacity=50);
                    opacity: .5;
                }

                .jssort12 .pav .title {
                    color: #fff;
                }
            </style>
            <div u="slides" style="cursor: move;">
                <div u="prototype" class=p style="POSITION: absolute; WIDTH: 200px; HEIGHT: 100px; TOP: 0; LEFT: 0;">
                    <thumbnailtemplate style="WIDTH: 100px; HEIGHT: 50px; border: none;border: red 0px dashed; position: absolute; TOP: 0; LEFT: 0; "></thumbnailtemplate>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- ThumbnailNavigator Skin End -->

        <a style="display: none" href="http://www.jssor.com">javascript</a>
    </div>
    <!-- Jssor Slider End --></body>
</html>