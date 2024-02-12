<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up</title>

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
      background: url(images/bg.jpg);
      background-size: cover;
      background-attachment: fixed;
    "
  >
    <div class="container">
      <div class="row">
        <div class="col-m6 offset-m3">
          <div class="card">
            <div class="card-content">
              <h3 class="center-align">Register Here!</h3>
              <h5 id="msg" class="center-align"></h5>
              <div class="form center-align">
                <form
                  action="Register3"
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
                      <span>File</span><input type="file" name="image" />
                    </div>
                    <div class="file-path-wrapper">
                      <input type="text" class="file-path validate" />
                    </div>
                  </div>
                  <button class="btn light-blue accent-3">Submit</button>
                </form>
              </div>
              <div
                class="loader center-align"
                style="margin-top: 10px; display: none"
              >
                <div class="preloader-wrapper medium active">
                  <div class="spinner-layer spinner-blue">
                    <div class="circle-clipper left">
                      <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                      <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                      <div class="circle"></div>
                    </div>
                  </div>

                  <div class="spinner-layer spinner-red">
                    <div class="circle-clipper left">
                      <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                      <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                      <div class="circle"></div>
                    </div>
                  </div>

                  <div class="spinner-layer spinner-yellow">
                    <div class="circle-clipper left">
                      <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                      <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                      <div class="circle"></div>
                    </div>
                  </div>

                  <div class="spinner-layer spinner-green">
                    <div class="circle-clipper left">
                      <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                      <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                      <div class="circle"></div>
                    </div>
                  </div>
                </div>
                <h5>Please wait...</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <script>
    $(document).ready(function () {
      console.log("page is ready...");
      $("#myform").on("submit", function (event) {
        event.preventDefault();
        let f = new FormData(this);
        console.log(f);
        $(".loader").show();
        $(".form").hide();
        $.ajax({
          url: "Register3",
          data: f,
          type: "post",
          success: function (data, textStatus, jqXHR) {
            console.log(data);
            console.log("success");
          },
          error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
            console.log("error");
          },
          processData: false,
          contentType: false,
        });
      });
    });
  </script>
</html>
