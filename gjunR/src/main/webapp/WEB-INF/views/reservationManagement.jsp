<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>訂位管理後台</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="../css/reservationManagement.css" />
    <style>
      .table a {
        --bs-table-color: var(--bs-body-color);
        --bs-table-bg: transparent;
        --bs-table-border-color: var(--bs-border-color);
        --bs-table-accent-bg: transparent;
        --bs-table-striped-color: var(--bs-body-color);
        --bs-table-striped-bg: rgba(0, 0, 0, 0.05);
        --bs-table-active-color: var(--bs-body-color);
        --bs-table-active-bg: rgba(0, 0, 0, 0.1);
        --bs-table-hover-color: var(--bs-body-color);
        --bs-table-hover-bg: rgba(0, 0, 0, 0.075);
      }
      .btn-primary {
        --bs-btn-color: #fff;
        --bs-btn-bg: #df2514;
        --bs-btn-border-color: #df2514;
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: #c91d0d;
        --bs-btn-hover-border-color: #c91d0d;
        --bs-btn-focus-shadow-rgb: 49, 132, 253;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: #c91d0d;
        --bs-btn-active-border-color: #c91d0d;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #df2514;
        --bs-btn-disabled-border-color: #df2514;
      }
      .btn-outline-primary {
        --bs-btn-color: #df2514;
        --bs-btn-border-color: #df2514;
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: #df2514;
        --bs-btn-hover-border-color: #df2514;
        --bs-btn-focus-shadow-rgb: 13, 110, 253;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: #df2514;
        --bs-btn-active-border-color: #df2514;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #df2514;
        --bs-btn-disabled-bg: transparent;
        --bs-btn-disabled-border-color: #df2514;
        --bs-gradient: none;
      }
    </style>
  </head>
  <body>
    <div class="container p-0 pt-5 position-relative">
      <div class="title d-flex justify-content-center mb-5">
        <img
          width="50"
          height="50"
          src="https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.6435-9/183446961_5786399431370995_238227825131624894_n.png?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yKu9KmnA-JgAX-gc2EJ&_nc_ht=scontent.ftpe8-3.fna&oh=00_AfCjo3SgORJzmeSFumQFhCHC5LmOLK6F7heJsPzEjNG7Lg&oe=63A1AD0C"
          alt=""
        />
        <h1 class="ms-3">Gjun 訂位管理後台</h1>
        <a
          class="btn btn-primary position-absolute end-0"
          href="http://localhost:8080/gjunR/html/manager.html"
          >返回後台</a
        >
      </div>
      <div class="inputField mb-2 d-flex justify-content-center">
        <span class="fw-bold">輸入日期 : </span>
        <input type="text" id="myInput" class="ms-2" onkeyup="myFunction()" />
      </div>
      <div class="tableform">
        <table class="table table-striped table-bordered text-center">
          <thead>
            <tr>
              <th scope="col">訂位編號</th>
              <th scope="col">訂位日期</th>
              <th scope="col">訂位時間</th>
              <th scope="col">訂位人數</th>
              <th scope="col">訂位姓名</th>
              <th scope="col">訂位電話</th>
              <th scope="col">刪除</th>
              <!-- <th scope="col">修改</th> -->
            </tr>
          </thead>
          <tbody>
            <c:forEach var="r" items="${reservationList}">
              <tr>
                <form class="form">
                  <td>${r.reservationID}</td>
                  <td>${r.reservationDate}</td>
                  <td>${r.reservationTime}</td>
                  <td>${r.reservationPerson}</td>
                  <td>${r.reservationName}</td>
                  <td>${r.reservationPhone}</td>
                  <td>
                    <a
                      class="deleteBtn"
                      href="http://localhost:8080/gjunR/reservation/delete/${r.reservationID}"
                    >
                      <i class="fa-solid fa-trash-can"></i>
                    </a>
                  </td>
                  <!-- href="http://localhost:8080/gjunR/reservation/readOne/${r.reservationID}" -->
                  <!-- <td>
                    <a
                      type="button"
                      class="readOneBtn"
                      data-id="${r.reservationID}"
                      data-bs-toggle="offcanvas"
                      data-bs-target="#offcanvasRight"
                      aria-controls="offcanvasRight"
                    >
                      <i class="fa-solid fa-wrench"></i>
                    </a>
                  </td> -->
                </form>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div
        class="offcanvas offcanvas-end"
        tabindex="-1"
        id="offcanvasRight"
        aria-labelledby="offcanvasRightLabel"
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasRightLabel">訂位修改</h5>
          <button class="btn btn-primary updateBtn">修改</button>
          <a
            type="button"
            class="btn-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></a>
        </div>
        <div class="offcanvas-body"></div>
      </div>
    </div>
    <script>
      function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("mytable");
        tr = document.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          if (i == 0) {
            tr[i].style.display = "";
          } else {
            td = tr[i].getElementsByTagName("td")[1];
            if (td.innerHTML || td.textContent) {
              txtValue = td.textContent || td.innerText;
              if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
              } else {
                tr[i].style.display = "none";
              }
            }
          }
        }
      }
      $(".readOneBtn").click(function () {
        const reservationID = $(this).attr("data-id");
        const url = "readOne/" + reservationID;
        $.ajax({
          url: url,
          type: "POST",
          data: reservationID,
          success: function (data) {
            console.log(data.reservationID);
            let html =
              "<form id='form-reservation'>" +
              "<div> 訂位日期: " +
              "<input type='text' value=" +
              data.reservationDate +
              ">" +
              "</div>" +
              "</form>";
            $(".offcanvas-body").html(html);
          },
          error: function () {
            console.log("error");
          },
        });
      });
      $(".deleteBtn").click(function () {
        alert("刪除成功");
      });
    </script>
  </body>
</html>
