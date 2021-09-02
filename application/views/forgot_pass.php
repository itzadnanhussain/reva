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
    <link rel="stylesheet" href="<?php echo base_url('assets/') ?>vendors/font-awesome/css/font-awesome.min.css">



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

                            <!-- <a href="<?php echo base_url() ?>" class="btn btn-primary  font-weight-medium auth-form-btn">Back</a> -->

                            <img src="<?php echo base_url() ?>assets\image\logo_large.png" class="logoimg mx-auto d-block">
                            <h2 class="text-center">Forgot Password</h2>
                            <hr class="login-border">
                            <div class="circle mx-auto d-block">
                                <i class="fa fa-key"></i>
                                <!-- <img src="<?php echo base_url('assets/image/key_img.png') ?>" class="mx-auto d-block" width="40" height="56" alt=""> -->
                            </div>


                            <!-- success message -->
                            <div class="alert alert-fill-success mt-3 mb-3" id="alert-success" style="display: none;" role="alert">

                            </div>
                            <!-- warning message -->
                            <div class="alert alert-fill-warning mt-3 mb-3" id="alert-warning" style="display: none;" role="alert">

                            </div>
                            <style>
                                .circle {
                                    width: 70px;
                                    height: 70px;
                                    text-align: center;
                                    padding: 5px;
                                    border-radius: 70px; 

                                }

                                .circle i {
                                    font-size: 60px;
                                    color: #576e7f  !important;
                                     
                                }

                                .btn-white {
                                    background-color: white;
                                    color: gray;
                                }
                            </style>

                            <form class="pt-3" action="<?php echo base_url('login/forgot_password') ?>">

                                <div class="form-group key-form-group">
                                    <p>No problem! Submit your registered e-mail below and you will receive a link to reset your password</p>
                                    <input type="email" class="form-control form-control-lg" name="email" placeholder="Email">
                                </div>

                                <div class="mt-3">
                                    <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">Send Email</button>
                                </div>
                                <div class="mt-3">
                                    <a href="<?php echo base_url() ?>" class="btn btn-block btn-white btn-lg font-weight-medium auth-form-btn">Cancel</a>
                                </div>

                            </form>

                        </div>
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
                success: function(data) {
                    let res = JSON.parse(data);
                    switch (res.code) {
                        case 'success':
                            // showSuccessToast(res.message);
                            $('#alert-success').show();
                            $('#alert-success').text(res.message);
                            setTimeout(function() {
                                window.location.href = '<?php echo base_url() ?>';
                            }, 1500)
                            break;
                        case 'success1':
                            // showSuccessToast(res.message);
                            $('#alert-success').show();
                            $('#alert-success').text(res.message);
                            setTimeout(function() {
                                window.location.href = '<?php echo base_url() ?>';
                            }, 1500)
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
                                $('[name=' + error[0] + ']').parent().append('<span class="error">' + error[1] + '</span>');
                            })
                            break;
                    }
                }
            });
        })
    </script>
    <script>
        $(document).keypress(function(e) {
            $('.error').hide();
        });
    </script>
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
    <!-- endinject -->
</body>

</html>