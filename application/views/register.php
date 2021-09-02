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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />

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

        .label-span {
            color: darkgreen;
            font-size: 13px;
            font-weight: bold;
            font-family: Arimo !important;
        }

        .select2-results__option--highlighted {
            border: 1px solid #edd0b6 !important;
            background: #eed6be98 !important;
            font-weight: normal; 
            color: #d8873bec !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 20px;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow {

            top: 12px;
        }

        .select2-container .select2-selection--single {
            height: 50px;
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
                            <h2 class="text-center">Register</h2>
                            <hr class="login-border">
                            <!-- success message -->
                            <div class="alert alert-fill-success" id="alert-success" style="display: none;" role="alert">

                            </div>
                            <!-- warning message -->
                            <div class="alert alert-fill-warning" id="alert-warning" style="display: none;" role="alert">

                            </div>

                            <form class="pt-3" action="<?php echo base_url('login/register') ?>" enctype='multipart/form-data'>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-lg" name="name" placeholder="Name" autocomplete="of">
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control form-control-lg" name="email" value="<?php echo (isset($email) ? $email : '') ?>" placeholder="Email" autocomplete="of">
                                </div>

                                <div class="form-group">
                                    <input type="text" class="form-control form-control-lg phone" name="contact" placeholder="(000) 000 - 0000" minlength="13">
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


                                <div class="form-group mt-3">
                                    <label for="">User Role</label>

                                    <select name="role_id" class="form-control goog-te-combo">
                                        <option value=""></option>
                                        <?php if (isset($user_roles) && !empty($user_roles)) { ?>
                                            <?php foreach ($user_roles as $key => $value) { ?>
                                                <option value="<?php echo $value->role_id ?>"><?php echo $value->role_title ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input type="text" name="company" class="form-control" placeholder="Add your company">
                                </div>
                                <div class="form-group">
                                    <!-- <span class="label-span">Fils Size allow less than 3 MB</span> -->
                                    <input type="file" name="profile" class="form-control">
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label text-muted">
                                        <input type="checkbox" class="form-check-input">
                                        Remember Me
                                    </label>
                                </div>

                                <div class="mb-4">
                                    <div class="form-check">
                                        <label class="form-check-label text-muted">
                                            <input type="checkbox" id="agreement" class="form-check-input">
                                            By clicking this you agree to the Privacy Policy & the Terms & Conditions
                                        </label>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="btn-submit" disabled>SIGN UP</a>
                                </div>
                                <div class="text-center mt-4 font-weight-light forgot-label">
                                    Already have an account? <a href="<?php echo base_url() ?>">Login</a>
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

    <div class="modal-loader">
        <!-- Place at bottom of page -->
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <!-- Page script -->
    <script>
        //input mask
        $('.phone').mask('(000) 000 - 0000');

        $('#agreement').change(function(e) {
            e.preventDefault();
            e.stopPropagation();
            if ($('#agreement').is(":checked")) {
                $('#btn-submit').attr('disabled', false);
            } else {
                $('#btn-submit').attr('disabled', true);
            }
        });

        ///submit form
        $('.pt-3').submit(function(e) {
            e.preventDefault();
            e.stopPropagation();
            var formData = new FormData(this);
            var url = $(this).attr('action');
            $(".error").remove();

            $.ajax({

                type: 'POST',
                data: formData,
                dataType: 'html',
                success: function(data) {
                    let res = JSON.parse(data);
                    switch (res.code) {
                        case 'success':
                            // showSuccessToast(res.message);
                            $('#alert-success').show();
                            $('#alert-success').text(res.message);
                            setTimeout(function() {
                                window.location.href = '<?php echo base_url('deals') ?>';
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
                        case 'warning-img':
                            //showWarningToast(res.message);
                            $('#alert-warning').show();
                            $('#alert-warning').text(res.message);
                            setTimeout(function() {
                                $('#alert-warning').hide();
                                window.location.href = '<?php echo base_url('deals') ?>';
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
                cache: false,
                contentType: false,
                processData: false
            });
        });

        ///hide error 
        $(document).keypress(function(e) {
            $('.error').hide();
            $('.input-group-error').hide();
        });

        ///load loader
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <script type="text/javascript">
        $(".goog-te-combo").select2();
    </script>
</body>

</html>