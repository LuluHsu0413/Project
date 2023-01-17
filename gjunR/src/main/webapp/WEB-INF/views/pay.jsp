<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
    <link rel="stylesheet" href="../../css/pay.css"/>
  </head>
  <body onload="current_time()">
    <span id="current"></span>
    <div class="container text-center">
      <div class="text-center mt-3">
        <img
          width="50"
          height="50"
          src="https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.6435-9/183446961_5786399431370995_238227825131624894_n.png?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yKu9KmnA-JgAX-gc2EJ&_nc_ht=scontent.ftpe8-3.fna&oh=00_AfCjo3SgORJzmeSFumQFhCHC5LmOLK6F7heJsPzEjNG7Lg&oe=63A1AD0C"
          alt=""
        />
        <span class="d-inline-block align-middle h1"
          >Gjun Restaurant 結帳系統</span
        >
      </div>
      <div class="row g-3 mb-5">
        <div class="d-inline-block mt-5">
          <div class="form-group">
            <div class="col-md-6 col-xl-4 container d-inline-block">
              <div class="input-group input-group-sm mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="inputGroup-sizing-sm"
                    >訂單編號</span
                  >
                </div>
                <input
                  type="text"
                  class="form-control"
                  aria-label="Small"
                  aria-describedby="inputGroup-sizing-sm"
                  placeholder="${orderID}"
                  readonly
                />
                <a type="button" href="../pay/${orderID}" class="btn btn-primary">結帳</a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-xl-4 container mt-4">
          <div
            class="alert alert-info text-right pr-3 d-flex justify-content-end align-items-center"
            id="result"
          >
            <div id="total"></div>
            <!-- <div id="operator"></div> -->
          </div>
          <div class="row" id="number-area">
            <div class="col-3 number-button">7</div>
            <div class="col-3 number-button">8</div>
            <div class="col-3 number-button">9</div>
            <div class="col-3 number-button">C</div>
            <div class="col-3 number-button">4</div>
            <div class="col-3 number-button">5</div>
            <div class="col-3 number-button">6</div>
            <div class="col-3 number-button">-</div>
            <div class="col-3 number-button">1</div>
            <div class="col-3 number-button">2</div>
            <div class="col-3 number-button">3</div>
            <div class="col-3 number-button">+</div>
            <div class="col-6 number-button">0</div>
            <div class="col-3 number-button">.</div>
            <div class="col-3 number-button">=</div>
          </div>
        </div>
      </div>
    </div>
    <script>
      function current_time() {
        NowDate = new Date();
        h = NowDate.getHours();
        m = NowDate.getMinutes();
        s = NowDate.getSeconds();
        document.getElementById("current").innerHTML =
          "現在時刻: " + h + "時" + m + "分" + s + "秒";
        setTimeout("current_time()", 1000);
      }
      const calc = {
        prevNum: "",
        num: 0,
        operator: "",
        operators: ["+", "-"],
        init() {
          $("#number-area > .number-button").on("click", (e) => {
            let value = $(e.target).html();
            this.isOperator(value);
            this.isNumber(value);
          });
        },
        isNumber(value) {
          if (!/^\d$/.test(value) && value != ".") {
            return false;
          }

          if (value == "." && /\./.test(this.num)) {
            return false;
          }

          this.num += value;
          this.num = this.num.replace(/^0+/, "");
          this.total(this.num);
        },
        isOperator(value) {
          if (this.operators.indexOf(value) >= 0) {
            this.operator = value;
            $("#operator").html(value);
            if (!this.prevNum) {
              this.prevNum = this.num;
            }
            this.num = 0;
          }

          if (value == "C") {
            this.prevNum = "";
            this.num = 0;
            this.total(0);
            this.operator = "";
            $("#operator").html("");
          }

          if (value == "=") {
            this.calc();
          }
        },
        calc() {
          if (!this.operator) {
            return false;
          }

          let total = 0;
          let a = parseFloat(this.prevNum);
          let b = parseFloat(this.num);

          switch (this.operator) {
            case "+":
              total = a + b;
              break;
            case "-":
              total = a - b;
              break;
          }

          total = Math.round(total * 100) / 100; // 小數兩位
          this.total(total);
          this.prevNum = total;
        },
        total(number) {
          $("#total").html(number);
        },
      };

      calc.init();
    </script>
  </body>
</html>
