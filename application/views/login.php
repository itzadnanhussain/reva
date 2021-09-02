<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?php echo $title; ?> </title>

  <link rel="stylesheet" href="<?php echo base_url() ?>assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>assets/vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>assets/css/style.css">
  <link rel="stylesheet" href="<?php echo base_url() ?>assets/css/responsive.css">
  <link rel="shortcut icon" href="<?php echo base_url() ?>assets/images/favicon.png" />
  <style>
    .content-wrapper {
      background: url(<?php echo base_url('assets/image/bg.png') ?>);
      background-repeat: no-repeat !important;
      background-size: cover;
    }

    .modal-loader {
      display: none;
      position: fixed;
      /* z-index: 1000; */
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      background: rgba(255, 255, 255, .8) url('<?php echo base_url('assets/loader.gif') ?>') 50% 50% no-repeat;
    }

    body.loading .modal-loader {
      overflow: hidden;
    }

    body.loading .modal-loader {
      display: block;
    }
  </style>
</head>

<body class="sidebar-fixed">
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-5 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">

              <img src="<?php echo base_url() ?>assets\image\logo_large.png" class="logoimg mx-auto d-block">

              <h2 class="text-center">Login</h2>
              <hr class="login-border">
              <!-- success message -->
              <div class="alert alert-fill-success" id="alert-success" style="display: none;" role="alert">

              </div>
              <!-- warning message -->
              <div class="alert alert-fill-warning" id="alert-warning" style="display: none;" role="alert">

              </div>
              <form class="pt-3" action="<?php echo base_url() ?>">

                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="email" placeholder="Email Address">
                </div>

                <div class="input-group">
                  <input type="password" id="password" class="form-control form-control-lg" name="password" placeholder="Password">
                  <div class="input-group-append">
                    <span class="input-group-text" onclick="passwordinfo()"><i class="mdi mdi-eye" id="eye-icon"></i></span>
                  </div>
                </div>

                <span class="input-group-error" style="display: none;"></span>

                <script>
                  function passwordinfo() {
                    var x = document.getElementById("password");
                    if (x.type === "password") {
                      x.type = "text";
                      $("#eye-icon").removeClass("mdi-eye");
                      $("#eye-icon").addClass("mdi-eye-off");
                    } else {
                      x.type = "password";
                      $("#eye-icon").addClass("mdi-eye");
                      $("#eye-icon").removeClass("mdi-eye-off");
                    }
                  }
                </script>
                

                <div class="my-2 d-flex justify-content-between align-items-center">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" name="remember_me" class="form-check-input">
                      Remember Me
                    </label>
                  </div>
                  <a href="<?php echo base_url('forgot_password') ?>" class="forgot-label">Forgot password?</a>
                </div>


                <div class="form-group terms text-center mt-5 mb-4">
                  <p><a href="javascript:void(0)">Terms and Conditions</a> | <a href="javascript:void(0)"> Privacy Policy</a>  </p> 

                </div>

                <div class="mt-3">
                  <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="Submitbtn">SIGN IN</a>
                </div>


                <div class="text-center mt-4 font-weight-light forgot-label">
                  Don't have an account? <a href="<?php echo base_url('register') ?>">Register</a>
                </div>
                
              </form>

            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->




    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script src="<?php echo base_url() ?>assets/vendors/base/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="<?php echo base_url() ?>assets/js/off-canvas.js"></script>
    <script src="<?php echo base_url() ?>assets/js/hoverable-collapse.js"></script>
    <script src="<?php echo base_url() ?>assets/js/template.js"></script>
    <script src="<?php echo base_url() ?>assets/js/settings.js"></script>
    <script src="<?php echo base_url() ?>assets/js/todolist.js"></script>

    <div class="modal-loader">
      <!-- Place at bottom of page -->
    </div>
    <script>
      $body = $("body");
      $(document).on({
        ajaxStart: function() {
          $body.addClass("loading");
        },
        ajaxStop: function() {
          $body.removeClass("loading");
        }
      });
    </script>



    <script>
      $('.pt-3').submit(function(e) {
        e.preventDefault();
        e.stopPropagation();
        var form = $(this).serialize();
        var url = $(this).attr('action');
        $(".error").remove();

        $.ajax({
          type: 'POST',
          url: url,
          data: form,
          dataType: 'html',
          beforeSend: function() {
            $('#Submitbtn').text('Please Wait...');
            $('#Submitbtn').attr('disabled', true);
          },
          success: function(data) {
            let res = JSON.parse(data);
            switch (res.code) { 
              case 'success':
                // showSuccessToast(res.message);
                // $('#alert-success').show();
                // $('#alert-success').text(res.message);
                // setTimeout(function() {
                 
                  window.location.href = '<?php echo base_url('deals') ?>';
                // }, 1000)
                break;

              case 'warning':
                //showWarningToast(res.message);
                $('#alert-warning').show();
                $('#alert-warning').text(res.message);
                setTimeout(function() {
                  $('#alert-warning').hide();
                }, 1500)
                break;
              case 'error':
                res.message.forEach(function(error) {
                  if (error[0] == 'password') {
                    $('.input-group-error').show();
                    $('.input-group-error').text(error[1]);
                  } else {
                    $('[name=' + error[0] + ']').parent().append('<span class="error">' + error[1] + '</span>');
                  }

                })
                break;
            }
          },
          complete: function() { 
            $('#Submitbtn').text('SIGN IN');
            $('#Submitbtn').attr('disabled', false);
          },
        });
      })
    </script>
    <script>
      $(document).keypress(function(e) {
        $('.error').hide();
      }); 
    </script>
   
    <!-- endinject -->
</body>

</html>