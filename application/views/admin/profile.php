<!-- css file for this page -->
<style>
    <?php require_once(APPPATH . 'views/admin/css/profile.css') ?>
</style>

<div class="container-fluid header-box-1">

    <!-- new code for test -->

    <div class="row">
        <!-- <div id="imgContainer">
            <form enctype="multipart/form-data" action="<?php echo base_url('Admin/Partial/image_upload_process') ?>" method="post" name="image_upload_form" id="image_upload_form">
                <div id="imgArea">
                    <input type="hidden" name="user_id" value="<?php echo $user[0]->user_id ?>">
                    <img src="<?php echo base_url('process') ?>/img/default.jpg">
                    <div class="progressBar">
                        <div class="bar"></div>
                        <div class="percent">0%</div>
                    </div>
                    <div id="imgChange"><span>Change Photo</span>
                        <input type="file" accept="image/*" name="image_upload_file" id="image_upload_file">
                    </div>
                </div>
            </form>
        </div> -->



    </div>

    <div class="row">
        <div class="col-md-4 offset-md-4 content-1">
            <div class="content-2">
                <form enctype="multipart/form-data" action="<?php echo base_url('Admin/Partial/image_upload_process') ?>" method="post" name="image_upload_form" id="image_upload_form">
                    <div id="imgArea">
                        <input type="hidden" name="user_id" value="<?php echo $user[0]->user_id ?>">
                        <img src="<?php echo ($_SESSION['profile'] !=  'No Profile') ? base_url($_SESSION['profile']) : base_url('assets/profiles/no-profile.jpg') ?>">

                        <div class="progressBar">
                            <div class="bar"></div>
                            <div class="percent">0%</div>
                        </div>
                        <div id="imgChange">
                            <div class="ellipse-camera">
                                <i class="fa fa-camera"></i>
                                <input type="file" accept="image/*" name="image_upload_file" id="image_upload_file">
                            </div>
                        </div>

                    </div>
                </form>
                <h2 id="head-input"><?php echo $user[0]->name ?></h2>
                <!-- <h2 style="display: none;" id="h2-input"><input type="text" name="name" value="<?php echo $user[0]->name ?>"></h2> -->
                <!-- <i class="fa fa-pencil edit-img"></i> -->

            </div>

        </div>
    </div>
</div>


<div class="content-wrapper">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <form class="submit-form">

                <div class="form-group">
                    <!-- success message -->
                    <div class="alert alert-fill-success" id="alert-success" style="display: none;" role="alert">

                    </div>
                    <!-- warning message -->
                    <div class="alert alert-fill-warning" id="alert-warning" style="display: none;" role="alert">

                    </div>
                </div>

                <div class="form-group">
                    <label>Name</label>
                    <input type="hidden" name="user_id" value="<?php echo $user[0]->user_id ?>">
                    <input type="text" class="form-control" name="name" value="<?php echo $user[0]->name ?>">
                </div>

                <!-- <div class="form-group">
                <label>Last Name</label>
                <input type="text" class="form-control" name="lname" value="johns">
            </div> -->

                <div class="form-group">
                    <label for="">User Role</label>
                    <select name="role_id" class="form-control" style="height: 50px;">
                        <?php if (isset($user_roles) && !empty($user_roles)) { ?>
                            <?php foreach ($user_roles as $key => $value) { ?>
                                <option value="<?php echo $value->role_id ?>" <?php echo ($value->role_id == $_SESSION['role_id']) ? 'selected' : '' ?>><?php echo $value->role_title ?></option>
                            <?php } ?>
                        <?php } ?>
                    </select>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" name="email" value="<?php echo $user[0]->email ?>">
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" class="form-control phone" name="contact" placeholder="(000) 000 - 0000" value="<?php echo $user[0]->contact ?>" minlength="13">
                </div>

                <div class="form-group">
                    <label>Company</label>
                    <input type="text" class="form-control" name="company" value="<?php echo $user[0]->company ?>">
                </div>

                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary form-control" style="width: 40%;">Update</button>
                </div>

            </form>

        </div>

    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

<script>
    $('.submit-form').data('serialize', $('.submit-form').serialize()); // On load save form current state

    $(window).bind('beforeunload', function(e) {
        if ($('.submit-form').serialize() != $('.submit-form').data('serialize')) return true;
        else e = null; // i.e; if form state change show warning box, else don't show it.
    });

    //input Mask script 
    $('.phone').mask('(000) 000 - 0000');

    ///submit form
    $('.submit-form').submit(function(e) {
        e.preventDefault();
        e.stopPropagation();
        var formData = new FormData(this);
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

                        ///check form status
                        $('.submit-form').data('serialize', $('.submit-form').serialize()); 
                        setTimeout(function() {
                            window.location.href = '<?php echo base_url('profile') ?>';
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
    })

    function h2_input() {
        $('#head-input').hide();
        $('#h2-input').show();
    }
</script>

<script>
    $(document).on('change', '#image_upload_file', function() {
        var progressBar = $('.progressBar'),
            bar = $('.progressBar .bar'),
            percent = $('.progressBar .percent');

        $('#image_upload_form').ajaxForm({
            beforeSend: function() {
                progressBar.fadeIn();
                var percentVal = '0%';
                bar.width(percentVal)
                percent.html(percentVal);
            },
            uploadProgress: function(event, position, total, percentComplete) {
                var percentVal = percentComplete + '%';
                bar.width(percentVal)
                percent.html(percentVal);
            },
            success: function(html, statusText, xhr, $form) {
                obj = $.parseJSON(html);
                if (obj.status) {
                    var percentVal = '100%';
                    bar.width(percentVal)
                    percent.html(percentVal);
                    $("#imgArea>img").prop('src', obj.output);
                    $('#alert-success').show();
                    $('#alert-success').text('Profile Uploaded Successfuly!');
                    setTimeout(function() {
                        $('#alert-success').hide();

                    }, 2000)
                } else {
                    $('#alert-warning').show();
                    $('#alert-warning').text(obj.message);
                    setTimeout(function() {
                        $('#alert-warning').hide();
                        // window.location.reload();

                    }, 2000)

                }
            },
            complete: function(xhr) {
                progressBar.fadeOut();
            }
        }).submit();

    });
</script>