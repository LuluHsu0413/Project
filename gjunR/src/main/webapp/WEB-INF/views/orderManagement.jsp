<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>訂單管理後台</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="../css/orderManagement.css" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="container p-0 pt-5 position-relative">
      <div class="title d-flex justify-content-center align-items-center mb-5">
        <img
          width="50"
          height="50"
          src="https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.6435-9/183446961_5786399431370995_238227825131624894_n.png?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yKu9KmnA-JgAX-gc2EJ&_nc_ht=scontent.ftpe8-3.fna&oh=00_AfCjo3SgORJzmeSFumQFhCHC5LmOLK6F7heJsPzEjNG7Lg&oe=63A1AD0C"
          alt=""
        />
        <h1 class="ms-3">Gjun 訂單管理後台</h1>
        <a
          class="btn btn-primary position-absolute end-0"
          href="http://localhost:8080/gjunR/html/manager.html"
          >返回後台</a
        >
      </div>
      <div class="tableform">
        <table class="table table-bordered text-center">
          <thead>
            <tr>
              <th scope="col">訂單編號</th>
              <th scope="col">訂餐日期</th>
              <th scope="col">訂餐時間</th>
              <th scope="col">總金額</th>
              <th scope="col">付款狀態</th>
              <th scope="col">結帳</th>
              <th scope="col">修改</th>
              <th scope="col">刪除</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="o" items="${orderMainList}">
              <tr>
                <form class="form">
                  <td>${o.orderID}</td>
                  <td>${o.orderDate}</td>
                  <td>${o.orderTime}</td>
                  <td>$${o.totalPrice}</td>
                  <td class="${o.paidStatus == 0 ? 'noPay' : 'paid'}">
                    <c:if test="${o.paidStatus == 1}"> 已付款 </c:if>
                    <c:if test="${o.paidStatus == 0}"> 未付款 </c:if>
                  </td>
                  <td>
                    <a
                      type="button"
                      class="payCheckBtn"
                      href="http://localhost:8080/gjunR/order/payCheck/${o.orderID}"
                    >
                      <i class="fa-solid fa-dollar-sign"></i>
                    </a>
                  </td>
                  <td>
                    <a
                      type="button"
                      class="updateOrderBtn"
                      data-id="${o.orderID}"
                      data-bs-toggle="offcanvas"
                      data-bs-target="#offcanvasRight"
                      aria-controls="offcanvasRight"
                    >
                      <i class="fa-solid fa-wrench"></i>
                    </a>
                  </td>
                  <td>
                    <a
                      class="deleteBtn"
                      href="http://localhost:8080/gjunR/order/delete/${o.orderID}"
                    >
                      <i class="fa-solid fa-trash-can"></i>
                    </a>
                  </td>
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
          <h5 class="offcanvas-title" id="offcanvasRightLabel">訂單修改</h5>
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
      <div
        class="offcanvas offcanvas-end"
        tabindex="-1"
        id="orderDetailOffcanvasRight"
        aria-labelledby="orderDetailOffcanvasRightLabel"
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="orderDetailOffcanvasRightLabel"></h5>
          <button class="btn btn-primary updateBtn">結帳</button>
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
      let data = new Array();
      let orderID = "";
      let html = "";

      // 訂單結帳確認
      $(".payCheckBtn").click(function () {
        // 清空資料
        data = [];
        orderID = "";
        html = "";
        $(".offcanvas-body").html("");

        // 取得orderID
        orderID = $(this).attr("data-id");
        const url = "payCheck/" + orderID;
        $.ajax({
          url: url,
          type: "GET",
          data: orderID,
          success: function (data) {
            html =
              "<form id='form-payCheck'>" +
              "<div> 訂單日期: " +
              "<input type='text' readonly value=" +
              data.orderDate +
              ">" +
              "</div>" +
              "<div> 訂單時間: " +
              "<input type='text' readonly value=" +
              data.orderTime +
              ">" +
              "</div>" +
              "<div> 訂單金額: " +
              "<input type='text' readonly value=" +
              data.totalPrice +
              ">" +
              "</div>" +
              "</form>";
            $(".offcanvas-body").html(html);
            console.log(data);
          },
          error: function () {
            console.log("error");
          },
        });
      });

      // 訂單更新確認
      $(".updateOrderBtn").click(function () {
        // 清空資料
        data = [];
        orderID = "";
        html = "";
        $(".offcanvas-body").html("");

        // 取得orderID
        orderID = $(this).attr("data-id");
        url = "test/" + orderID;
        // 取得單筆訂單明細
        $.ajax({
          url: url,
          type: "GET",
          success: function (data) {
            let html = "<form id='form-products'>";
            Object.values(data).forEach((item, i) => {
              html +=
                "<div>" +
                item[2] +
                " " +
                "<input type='text' data-id=" +
                item[1] +
                " value=" +
                item[3] +
                ">" +
                "</div>";
            });
            html += "</form>";
            $(".offcanvas-body").html(html);
          },
        });
      });

      // 更新訂單
      $(".updateBtn").click(function () {
        const url = "update/" + orderID;
        const inputs = $("#form-products").find("input");
        for (i = 0; i < inputs.length; i++) {
          const productID = inputs[i].getAttribute("data-id");
          const quantity = inputs[i].value;
          const tempArray = { productID, quantity };
          data.push(tempArray);
        }
        $.ajax({
          url: url,
          type: "POST",
          data: JSON.stringify(data),
          contentType: "application/json",
          success: function () {
            alert("修改成功");
            window.location.replace("http://localhost:8080/gjunR/order/read");
          },
          error: function () {
            console.log("Error");
          },
        });
      });
      $(".deleteBtn").click(function () {
        alert("刪除成功");
      });
    </script>
  </body>
</html>
