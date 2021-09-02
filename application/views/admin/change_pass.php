<!-- css file for this page -->
<style>
    <?php require_once(APPPATH . 'views/admin/css/change_pass.css') ?>
</style>

<div class="container-fluid header-box-1">
    <div class="col-md-12 mt-4 mb-4 content-1">
        <h2>Change Password</h2>
        <hr>
    </div>
</div>
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-6 offset-md-3">

            <!-- success message -->
            <div class="alert alert-fill-success" id="alert-success" style="display: none;" role="alert">

            </div>
            <!-- warning message -->
            <div class="alert alert-fill-warning" id="alert-warning" style="display: none;" role="alert">

            </div>

            <form class="submit-form">
                <div class="form-group">
                    <input type="hidden" name="email" value="<?php echo $_SESSION['email'] ?>">
                    <input type="password" class="form-control" name="old_password" placeholder="Current Password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="new_password" placeholder="New Password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password">
                </div>
                <div class="form-group text-center">
                    <button type="submit" id="Submitbtn" class="btn btn-primary form-control" style="width: 40%;">Change</button>
                </div>
            </form>

        </div>

    </div>

</div>

<script>
    ///post form data 
    $('.submit-form').submit(function(e) {
        e.preventDefault();
        e.stopPropagation();
        var form = $(this).serialize();
        $(".error").remove();

        $.ajax({
            type: 'POST',
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
                        $('#alert-success').show();
                        $('#alert-success').text(res.message);
                        setTimeout(function() {
                            window.location.href = '<?php echo base_url('logout') ?>';
                        }, 1000)
                        break;

                    case 'warning':
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
            },
            complete: function() {
                $('#Submitbtn').text('Change');
                $('#Submitbtn').attr('disabled', false);
            },
        });
    })


    ///hide error by press key
    $(document).keypress(function(e) {
        $('.error').hide();
    });
</script>