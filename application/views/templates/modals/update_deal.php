<div class="modal fade" id="updateDeal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <!-- <span aria-hidden="true">&times;</span> -->
                    <img src="<?php echo base_url('assets/image/vector-cross.png') ?>" aria-hidden="true" alt="">
                </button>
            </div>
            <div class="modal-body ui-front">
                <form class="submit-form" action="<?php echo base_url('deals') ?>" enctype="multipart/form-data">
                    <input type="hidden" name="deal_id" value="<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>">
                    <input type="hidden" name="user_id" value="<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->user_id : '' ?>">
                    <input type="hidden" name="deal_check" value="update">
                    <!-- General details -->
                    <div class="row">
                        <div class="col-md-12 deals_model_heading">
                            <h3>Update Deal</h3>
                            <hr>
                        </div>
                        <!-- error -->
                        <div class="col-sm-12">
                            <!-- success message -->
                            <div class="alert alert-fill-success" style="display: none;" role="alert">
                            </div>
                            <!-- warning message -->
                            <div class="alert alert-fill-warning" style="display: none;" role="alert">
                            </div>
                        </div>
                    </div>
                    <!-- Form Details -->
                    <div class="row next">
                        <!-- heading -->
                        <div class="col-md-12">
                            <h5>Basic Details</h5>
                        </div>
                        <!-- name -->
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <input type="text" name="name" id="deal_name" value="<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->name : '' ?>" class="form-control">
                            </div>
                        </div>
                        <!-- address -->
                        <div class="col-md-6 col-xs-12">
                            <div class="form-group">
                                <input type="text" name="address" id="location" value="<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->address : '' ?>" class="form-control">
                            </div>
                        </div>
                        <!-- description -->
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group emoji-picker-container">
                                <?php $this->load->view('templates/admin/emoji_textarea') ?>
                                <!-- <textarea rows="5" name="description" data-emojiable="true" data-emoji-input="text" class="form-control"><?php echo (isset($deal) && !empty($deal)) ? br2nl($deal[0]->description) : '' ?></textarea> -->
                            </div>
                        </div>
                        <!-- heading -->
                        <div class="col-md-12">
                            <h5>Invite Members</h5>
                        </div>
                        <!-- members -->
                        <div class="col-md-12 col-xs-12 mb-4">
                            <div class="form-group btn-input mb-0">
                                <input type="text" name="members" id="invite" placeholder="Enter an email or phone number to send them an invite" class="form-control tags">
                                <button type="button" id="Plusbtn" class="btn btn-primary btn-rounded btn-icon" onclick="inviteuser()"><img src="<?php echo base_url('assets/image/plus.png') ?>" alt=""></button>
                            </div>
                            <span class="input-group-error" style="display: none;"> </span>
                        </div>
                        <!-- member list -->
                        <div class="col-md-12 col-xs-12 scroll">
                            <div class="row add_member_list" id="list-members">
                            </div>
                        </div>
                    </div>
                    <!-- slide two -->
                    <div class="row done" style="display: none;">
                        <!-- heading -->
                        <div class="col-md-12">
                            <h5>Timeline Tasks</h5>
                        </div>
                        <!-- Client Begins Process -->
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group btn-input-arrow">
                                <!-- <img src="<?php echo base_url('assets/image/arrow.png') ?>" alt=""> -->
                                <input type="text" name="tasks[]" value="Client Begins Process" class="form-control">
                            </div>
                        </div>
                        <!-- Home Tours -->
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group btn-input-arrow">
                                <!-- <img src="<?php echo base_url('assets/image/arrow.png') ?>" alt=""> -->
                                <input type="text" name="tasks[]" value="Home Tours" class="form-control">
                            </div>
                        </div>
                        <!-- Bank Loan Authorized -->
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group btn-input-arrow">
                                <!-- <img src="<?php echo base_url('assets/image/arrow.png') ?>" alt=""> -->
                                <input type="text" name="tasks[]" value="Bank Loan Authorized" class="form-control">
                            </div>
                        </div>
                        <!-- Title Company Chosen -->
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group btn-input-arrow">
                                <!-- <img src="<?php echo base_url('assets/image/arrow.png') ?>" alt=""> -->
                                <input type="text" name="tasks[]" value="Title Company Chosen" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12 col-xs-12">
                            <div class="form-group">
                                <input type="text" name="tasks[]" class="form-control" placeholder="add a new task">
                            </div>
                        </div>
                    </div>
                    <div class="row test-1">
                        <div class="col-sm-12 circle mt-5">
                            <i class="fa fa-circle dot" id="slide-1" onclick="navigate_slide(1)"></i>
                            <i class="fa fa-circle-thin dot" id="slide-2" onclick="navigate_slide(2)"></i>
                        </div>
                        <div class="col-md-6 offset-md-3 mt-2">
                            <div class="form-group">
                                <button type="button" id="nextbtn" class="btn btn-white form-control mt-3" onclick="navigate_slide(2)">Next</button>
                                <button type="submit" id="Submitbtn" class="btn btn-primary form-control mt-3">Save</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    

    $(".close").on('click', function() {
        var value = $('#invite').val();
        if (value != '') {
            confirm("Your content has not been properly saved yet!");
        } 
    });


    ///navigate
    function navigate_slide(value) {
        if (value == 1) {
            $('.next').show()
            $('.done').hide()

            ///remove class slide one
            $('#slide-1').removeClass('fa-circle-thin');
            $('#slide-1').addClass('fa-circle');

            ///add class slide two
            $('#slide-2').removeClass('fa-circle');
            $('#slide-2').addClass('fa-circle-thin');

            // ///button nature change
            // $('#Submitbtn').removeClass('btn-primary');
            // $('#Submitbtn').addClass('btn-white');

            $('#Submitbtn').show();
            $('#nextbtn').show();

        } else {
            $('.next').hide();
            $('.done').show()

            ///remove class slide one
            $('#slide-1').removeClass('fa-circle');
            $('#slide-1').addClass('fa-circle-thin');

            ///add class slide two
            $('#slide-2').removeClass('fa-circle-thin');
            $('#slide-2').addClass('fa-circle');

            ///button nature change
            $('#nextbtn').hide();

            // $('#Submitbtn').removeClass('btn-white');
            // $('#Submitbtn').addClass('btn-primary');
            $('#Submitbtn').show();
        }
    }

    ///input function 
    function nextfn() {
        $('.next').hide();
        $('.done').show();
    }

    ///inviteuser 
    function inviteuser(id) {
        var value = $('#invite').val();
        $('.add_member_list').html('');
        var deal = $('#deal_name').val();
        var address = $('#location').val();


        var url = '<?php echo base_url('Admin/Partial/invited_member_add') ?>';
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                'value': value,
                'id': id,
                'address': address,
                'deal': deal,
                'table': 'users'
            },
            dataType: 'html',

            success: function(data) {
                let res = JSON.parse(data);
                switch (res.code) {
                    case 'success':
                        $('#invite').val('');
                        $('.add_member_list').append(res.html);
                        break;
                    case 'warning':
                        //showWarningToast(res.message);
                        $('#alert-warning').show();
                        $('#alert-warning').text(res.message);
                        $('.add_member_list').append(res.html);
                        setTimeout(function() {
                            $('#alert-warning').hide();
                            $('#invite').val('');
                        }, 1500);
                        break;
                    case 'success-email':
                        $('.add_member_list').append(res.html);
                        $('.alert-fill-success').show();
                        $('.alert-fill-success').text(res.message);
                        setTimeout(function() {
                            $('.alert-fill-success').hide();
                            $('#invite').val('');
                        }, 1000);

                        break;



                }
            },

        });




    }

    ///removeitem
    function removeitem(id) {
        var url = '<?php echo base_url('Admin/Partial/invited_member_remove') ?>';
        $('.add_member_list').empty();
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                'user_id': id,
                'table': 'users'
            },
            dataType: 'html',
            beforeSend: function() {
                //  $('#Plusbtn').attr('disabled', true);
            },
            success: function(data) {
                let res = JSON.parse(data);
                switch (res.code) {
                    case 'success':
                        $('#invite').val('');
                        $('.add_member_list').append(res.html);
                        break;
                    case 'warning':
                        //showWarningToast(res.message);
                        $('#alert-warning').show();
                        $('#alert-warning').text(res.message);
                        $('.add_member_list').append(res.html);
                        setTimeout(function() {
                            $('#alert-warning').hide();
                            $('#invite').val('');
                        }, 1500);
                        break;

                }
            },
            complete: function() {
                //  $('#Plusbtn').attr('disabled', false);
            },
        });
    }

    ///hide error by press key
    $(document).keypress(function(e) {
        $('.error').hide();
        $('.input-group-error').hide();
    });

    function getinvitedusers(id) {
        var url = '<?php echo base_url('Admin/Partial/get_invited_user_list') ?>';
        $('.add_member_list').html('');
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                'deal_id': id,
                'table': 'deal_invite_members'
            },
            dataType: 'html',
            beforeSend: function() {
                //  $('#Plusbtn').attr('disabled', true);
            },
            success: function(data) {
                let res = JSON.parse(data);
                switch (res.code) {
                    case 'success':
                        $('#invite').val('');
                        $('.add_member_list').append(res.html);
                        break;
                }
            },
            complete: function() {
                //  $('#Plusbtn').attr('disabled', false);
            },
        });

    }


    function DeleteInvitedMember(id, invited) {
        var confirm = confirmation(id);
        if (confirm == true) {
            var url = '<?php echo base_url('Admin/Partial/delete_member') ?>';
            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    'invite_id': id,
                    'invited_user_id': invited,
                    'user_id': '<?php echo $_SESSION['user_id'] ?>',
                    'deal_id': '<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>',

                },
                dataType: 'html',
                success: function(data) {
                    let res = JSON.parse(data);
                    switch (res.code) {
                        case 'success':
                            showSuccessToast(res.message);
                            setTimeout(function() {
                                window.location.reload();
                            }, 1500)

                            break;
                        case 'admin-success':
                            showSuccessToast(res.message);
                            setTimeout(function() {
                                window.location.href = '<?php echo base_url('deals') ?>';
                            }, 1500)

                            break;
                        case 'warning':
                            showWarningToast(res.message);
                            break;
                    }
                },
            });

        }

    }

    function delete_deal(id) {
        var confirm = confirmation(id);
        if (confirm == true) {
            var url = '<?php echo base_url('Admin/Partial/delete_deal') ?>';
            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    'deal_id': id,
                    'user_id': '<?php echo $_SESSION['user_id'] ?>',
                },
                dataType: 'html',
                success: function(data) {
                    let res = JSON.parse(data);
                    switch (res.code) {
                        case 'success':
                            showSuccessToast(res.message);
                            setTimeout(function() {
                                window.location.href = '<?php echo base_url('deals') ?>';
                            }, 2500)

                            break;
                        case 'warning':
                            showWarningToast(res.message);
                            break;
                    }
                },
            });

        }

    }

    function confirmation(id) {
        var del = confirm("Are you sure you want to remove this user from the deal?");
        if (del == true) {
            return true;
        } else {
            return false;
        }
    }


    ///submit form 
    $('.submit-form').submit(function(e) {
        e.preventDefault();
        e.stopPropagation();
        var textarea = tinymce.get("mytextarea").getContent();
        var formData = new FormData(this);
        formData.append("description", textarea);
        var url = $(this).attr('action');
        $(".error").remove();

        $.ajax({
            type: 'POST',
            url: url,
            data: formData,
            dataType: 'html',
            success: function(data) {

                let res = JSON.parse(data);
                switch (res.code) {
                    case 'success':
                        // showSuccessToast(res.message);
                        $('.alert-fill-success').show();
                        $('.alert-fill-success').text(res.message);
                        setTimeout(function() {
                            window.location.href = '<?php echo base_url('deals') ?>';
                        }, 1500)
                        break;
                        //   case 'success-email':
                        //     // showSuccessToast(res.message);
                        //     $('.alert-fill-success-email').show();
                        //     $('.alert-fill-success-email').text(res.message);
                        //     setTimeout(function() { 
                        //       $('.alert-fill-success-email').hide();
                        //     }, 1000)

                        // setTimeout(function() {
                        //   $('.add_member_list').html('');
                        //   $('#creatDeal').modal('show');
                        //   $('.add_member_list').append(res.html);
                        // }, 1500)

                        break;
                        //   case 'warning-email':
                        //     //showWarningToast(res.message);
                        //     $('#alert-warning-email').show();
                        //     $('#alert-warning-email').text(res.message);
                        //     setTimeout(function() {
                        //       $('#alert-warning-email').hide();
                        //     }, 1000)
                        //     break;

                    case 'warning':
                        //showWarningToast(res.message);
                        $('.alert-fill-warning').show();
                        $('.alert-fill-warning').text(res.message);
                        setTimeout(function() {
                            $('.alert-fill-warning').hide();
                            //   window.location.href = '<?php echo base_url('deals') ?>';
                        }, 1500)
                        break;
                    case 'error':
                        res.message.forEach(function(error) {
                            navigate_slide(1);
                            if (error[0] == 'members') {
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
</script>