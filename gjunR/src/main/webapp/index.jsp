<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Gjun Restaurant</title>
    <meta charset="utf-8" />
  </head>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <style type="text/css">
    html,
    body {
      width: 100%;
      height: 100%;
      margin: 0;
      background-color: #e6af2e;
      overflow: hidden;
    }

    #cat {
      width: 300px;
      position: absolute;
      left: 50%;
      bottom: 0px;
      transform: translateX(-50%);
    }

    #cross {
      position: absolute;
    }
    #cross:before,
    #cross:after {
      content: "";
      display: block;
      width: 60px;
      height: 15px;
      background-color: #fff;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%) rotate(45deg);
    }
    #cross:after {
      transform: translate(-50%, -50%) rotate(136deg);
    }
    nav {
      width: 100%;
      height: 80px;
      background: rgba(0, 0, 0, 0.3);
      position: fixed;
      z-index: 10;
    }

    nav ul {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    nav ul li {
      text-align: center;
      float: left;
      line-height: 80px;
    }

    nav ul li a {
      width: 100px;
      color: #fff;
      font-size: 20px;
      font-weight: 600;
      display: block;
    }

    nav ul li a:hover,
    nav ul li a:visited {
      text-decoration: none;
      background: rgba(0, 0, 0, 0.5);
      color: #fff;
    }
    nav ul li a {
      text-decoration: none;
    }

    #specialA {
      height: 80px;
      width: 80px;
    }
  </style>
  <body>
    <nav>
      <ul>
        <li class="active">
          <a href="#" id="specialA"
            ><img
              height="80"
              src="https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.6435-9/183446961_5786399431370995_238227825131624894_n.png?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yKu9KmnA-JgAX-gc2EJ&_nc_ht=scontent.ftpe8-3.fna&oh=00_AfCjo3SgORJzmeSFumQFhCHC5LmOLK6F7heJsPzEjNG7Lg&oe=63A1AD0C"
              alt=""
          /></a>
        </li>
        <li>
          <a href="/gjunR/product" target="_blank"> 點餐系統 </a>
        </li>
        <li>
          <a href="/gjunR/html/reservationPage.html" target="_blank">訂位系統</a>
        </li>
        <li>
          <a href="/gjunR/html/login.html" target="_blank">後台登入</a>
        </li>
      </ul>
    </nav>
    <img
      id="cat"
      src="http://awiclass.monoame.com/catpic/cat_lefttop.png"
      alt=""
    />
    <div id="cross"></div>
  </body>
  <script>
    $(window).mousemove(function (evt) {
      console.log(evt);
      var x = evt.pageX;
      var y = evt.pageY;

      $("#cross").css("left", x + "px");
      $("#cross").css("top", y + "px");

      if (x < $(window).width() / 2 - 50) {
        $("#cat").attr(
          "src",
          "http://awiclass.monoame.com/catpic/cat_left.png"
        );
      } else if (x > $(window).width() / 2 + 50) {
        $("#cat").attr(
          "src",
          "http://awiclass.monoame.com/catpic/cat_right.png"
        );
      } else {
        $("#cat").attr("src", "http://awiclass.monoame.com/catpic/cat_top.png");
      }
      if (x < $(window).width() / 2 - 50 && y < $(window).height() / 2) {
        $("#cat").attr(
          "src",
          "http://awiclass.monoame.com/catpic/cat_lefttop.png"
        );
      }
      if (x > $(window).width() / 2 + 50 && y < $(window).height() / 2) {
        $("#cat").attr(
          "src",
          "http://awiclass.monoame.com/catpic/cat_righttop.png"
        );
      }
    });
  </script>
</html>
