<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Page</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />
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
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/order.css" />
  </head>
  <body>
    <div class="container">
      <div class="pt-5 pb-3 d-flex">
        <img
          width="50"
          height="50"
          src="https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.6435-9/183446961_5786399431370995_238227825131624894_n.png?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yKu9KmnA-JgAX-gc2EJ&_nc_ht=scontent.ftpe8-3.fna&oh=00_AfCjo3SgORJzmeSFumQFhCHC5LmOLK6F7heJsPzEjNG7Lg&oe=63A1AD0C"
          alt=""
        />
        <h1 class="ms-3">Gjun Restaurant</h1>
      </div>
      <div
        id="carouselExampleControls"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="assets/carousel1.jpg" class="d-block w-100" />
          </div>
          <div class="carousel-item">
            <img src="assets/carousel2.jpg" class="d-block w-100" />
          </div>
          <div class="carousel-item">
            <img src="assets/carousel3.jpg" class="d-block w-100" />
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <nav class="nav nav-pills flex-column flex-sm-row mt-3 mb-4 mt-sm-5">
        <c:forEach var="pt" items="${productsTypeList}" varStatus="loop">
          <a
            class="flex-sm-fill text-sm-center nav-link ${loop.index == 0 ? 'active' : ''}"
            aria-current="page"
            href="#${pt.chiTypeDes}"
            >${pt.chiTypeDes}</a
          >
        </c:forEach>
      </nav>
      <c:forEach var="pt" items="${productsTypeList}">
        <h3 id="${pt.chiTypeDes}">${pt.chiTypeDes}</h3>
        <div class="row g-3 mb-5">
          <c:forEach var="p" items="${productsList}">
            <c:if test="${p.productCatagory == pt.typeID}">
              <div class="col-md-6 col-xl-4">
                <div class="card">
                  <div class="row g-0">
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title">${p.productNameChi}</h5>
                        <span class="price">${p.productPrice}</span>
                        <p class="card-text">${p.productDescribe}</p>
                        <div class="d-flex">
                          <button
                            type="button"
                            class="btn btn-primary me-2 getIDBtn"
                            data-id="${p.productID}"
                            data-price="${p.productPrice}"
                            data-name="${p.productNameChi}"
                            data-image="${p.productImagePath}"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasRight"
                            aria-controls="offcanvasRight"
                          >
                            <i class="fa-solid fa-cart-shopping"></i>
                          </button>
                          <div class="input-group">
                            <button
                              type="button"
                              class="btn btn-outline-primary minusBtn"
                            >
                              <i class="fa-solid fa-minus"></i>
                            </button>
                            <input
                              type="text"
                              class="form-control text-center red-input"
                              placeholder=""
                              aria-describedby="button-addon1"
                              value="1"
                              readonly
                              data-id="${p.productID}"
                            />
                            <button
                              type="button"
                              class="btn btn-outline-primary addBtn"
                            >
                              <i class="fa-solid fa-plus"></i>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div
                        class="cover w-100 h-100"
                        style="
                          background-image: url('assets/${p.productImagePath}');
                        "
                      ></div>
                    </div>
                  </div>
                </div>
              </div>
            </c:if>
          </c:forEach>
        </div>
      </c:forEach>
      <div
        class="offcanvas offcanvas-end"
        tabindex="-1"
        id="offcanvasRight"
        aria-labelledby="offcanvasRightLabel"
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasRightLabel">購物車</h5>
          <button class="btn btn-primary checkoutBtn">點餐</button>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></button>
        </div>
        <div class="offcanvas-body"></div>
      </div>
    </div>
    <script>
      // 給前端渲染資料
      let list = {};
      // 準備資料傳給後端

      $(".getIDBtn").click(function () {
        const productID = $(this).attr("data-id");
        const quantity = $("input[data-id=" + productID + "]").val();
        const productName = $(this).attr("data-name");
        const productPrice = $(this).attr("data-price");
        const productImage = $(this).attr("data-image");

        list[productID] = {
          productID,
          quantity,
          productName,
          productPrice,
          productImage,
        };

        let html = "<div class='cart'>";
        Object.values(list).forEach(
          (item) =>
            (html += `
            <div class="cart-list" data-id="\${item.productID}">
              <div class="cart-image">
                <div style="background-image: url(assets/\${item.productImage})"></div>
              </div>
              <div class="cart-info" data-id="\${item.productID}">
                <h5>\${item.productName} <span class="cart-price">$\${item.productPrice * item.quantity}</span></h5>
                <div class="cart-action">
                  <div class="input-group input-group-sm">
                    <button type="button" class="btn btn-outline-primary cart-minus">
                      <i class="fa-solid fa-minus"></i>
                    </button>
                    <input
                      type="text"
                      class="form-control text-center red-input cart-value"
                      aria-describedby="button-addon1"
                      value=\${item.quantity}
                      readonly
                    />
                    <button type="button" class="btn btn-outline-primary cart-add">
                      <i class="fa-solid fa-plus"></i>
                    </button>
                  </div>
                  <button type="button" class="btn btn-outline-primary cart-remove btn-sm">
                    <i class="fa-solid fa-trash-can"></i>
                  </button>
                </div>
                </div>
            </div>
            `)
        );
        html += "</div>";
        html += `
            <div class="cart-bottom">
              <h3>Total: </h3>
              <h3 class="cart-total"></h3>
            </div>
        `;
        $(".offcanvas-body").html(html);
        localStorage.setItem("Shopcart", JSON.stringify(list));
        updateTotal();
      });

      function updateTotal() {
        const total = Object.values(list).reduce(
          (acc, cur) => acc + cur.quantity * cur.productPrice,
          0
        );
        $(".cart-total").html(`$\${total}`);
        if (total === 0) {
          $(".checkoutBtn").attr("disabled", true);
        } else {
          $(".checkoutBtn").removeAttr("disabled");
        }
      }
      $(document).on("click", ".cart-minus", function () {
        const parent = $(this).parents(".cart-info");
        const id = parent.data("id");
        if (list[id].quantity <= 1) return;
        const quantity = +list[id].quantity - 1;
        parent.find(".cart-value").val(quantity);
        parent.find(".cart-price").html("$" + quantity * list[id].productPrice);
        $("input[data-id=" + id + "]").val(quantity);

        list[id] = {
          ...list[id],
          quantity,
        };
        updateTotal();
      });

      $(document).on("click", ".cart-add", function () {
        const parent = $(this).parents(".cart-info");
        const id = parent.data("id");
        const quantity = +list[id].quantity + 1;
        parent.find(".cart-value").val(quantity);
        parent.find(".cart-price").html("$" + quantity * list[id].productPrice);
        $("input[data-id=" + id + "]").val(quantity);

        list[id] = {
          ...list[id],
          quantity,
        };
        updateTotal();
      });

      $(document).on("click", ".cart-remove", function () {
        const parent = $(this).parents(".cart-info");
        const id = parent.data("id");
        $(`.cart-list[data-id=\${id}]`).remove();
        $("input[data-id=" + id + "]").val(1);
        delete list[id];
        updateTotal();
      });

      $(".checkoutBtn").click(function () {
        const data = Object.values(list).map((item) => ({
          productID: item.productID,
          quantity: item.quantity,
        }));

        $.ajax({
          url: "order/add",
          type: "POST",
          data: JSON.stringify(data),
          contentType: "application/json",
          success: function (msg) {
            list = {};
            let html = "";
            alert("點餐成功");
            $(".offcanvas-body").html(html);
            $(".addBtn").siblings("input").val(1);
            // $("#offcanvasRight").removeClass("show");
            // $(".offcanvas-backdrop").remove();
          },
          error: function () {
            console.log("error");
          },
        });
      });
      $(".addBtn").click(function () {
        let quantity = $(this).siblings("input").val();
        quantity++;
        $(this).siblings("input").val(quantity);
      });
      $(".minusBtn").click(function () {
        let quantity = $(this).siblings("input").val();
        if (quantity == 1) {
          return;
        }
        quantity--;
        $(this).siblings("input").val(quantity);
      });
      $("nav")
        .find("a")
        .click(function () {
          $("nav").find(".active").removeClass("active");
          $(this).addClass("active");
        });
    </script>
  </body>
</html>
