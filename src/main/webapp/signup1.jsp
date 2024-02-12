<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- Compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
    />

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  </head>
  <body
    style="
      background: url(images/pexels-photo.jpg);
      background-size: cover;
      background-attachment: fixed;
    "
  >
    <div class="container">
      <div class="row">
        <div class="col-md-6 offset-md-3">
          <div class="card">
            <div class="card-content">
              <h3 style="margin-top: 10px" class="center-align">
                Register here !!
              </h3>
              <h5 id="msg" class="center-align"></h5>

              <div class="form center-align">
                <form
                  action="Register"
                  method="post"
                  enctype="multipart/form-data"
                  id="myform"
                >
                  <input
                    type="text"
                    name="user_name"
                    placeholder="Enter user name"
                  />
                  <input
                    type="password"
                    name="user_password"
                    placeholder="Enter user password"
                  />
                  <input
                    type="email"
                    name="user_email"
                    placeholder="Enter user email"
                  />
                  <div class="file-field input-field">
                    <div class="btn blue">
                      <span>File</span> <input type="file" name="image" />
                    </div>
                    <div class="file-path-wrapper">
                      <input class="file-path validate" type="text" />
                    </div>
                  </div>
                  <button type="submit" class="btn light-blue accent-3">
                    Submit
                  </button>
                </form>
              </div>

              <div
                class="loader progress center-align"
                style="margin-top: 10px; display: none"
              >
                <div class="indeterminate"></div>

                <h5>Please wait...</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
      $(document).ready(function () {
        console.log("page-bootstrapped");
        $("#myform").on("submit", function (e) {
          e.preventDefault();

          $(".loader").show();
          $(".form").hide();

          let furum = new FormData(this);

          console.log(furum);

          $.ajax({
            url: "Register",
            data: furum,
            type: "POST",
            success: function (data, textStatus, jqXHR) {
              $(".loader").hide();
              $(".form").show();

              if (data.trim() === "done") {
                $("#msg").html("REGISTRATION SUCCESFUL :) ");
                $("#msg").addClass("green-text");
              } else {
                console.log(data);
                $("#msg").html("REGISTRATION FAILED :/ ");
                $("#msg").addClass("red-text");
              }
            },
            error: function (jqXHR, textStatus, errorThrown) {
              $(".loader").hide();
              $(".form").show();

              $("#msg").html("SERVER ERROR ) ");
              $("#msg").addClass("red-text");
            },
            contentType: false,
            processData: false,
          });
        });
      });
    </script>
  </body>
</html>
