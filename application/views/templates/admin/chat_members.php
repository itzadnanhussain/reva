<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<style>
   .chat-head .content-1 {
      padding-left: 34px;
   }

   .chat-screen .modal-body {
      height: 500px !important;
   }

   @media (max-width:768px) {
      .chat-head {
         position: relative;
      }

      .chat-head .content-1-2 {
         position: absolute;
         top: 10px;
         right: 15px;
      }

   }

   .chat-screen .modal-dialog {
      margin-top: 80px;
   }

   .select2-selection {
      height: 100px;
   }

   .select2-container--default .select2-selection--multiple .select2-selection__choice {
      background-color: #e2a063 !important;
      box-shadow: 0px 5px 36px rgb(144 164 183 / 22%) !important;
      border-radius: 5px;
      color: #ffffff !important;
      font-size: 16px !important;
      padding: 5px 10px !important;
   }

   .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
      padding-left: 27px !important;
      padding-right: 10px;

   }

   .select2-container--default .select2-selection--multiple .select2-selection__choice .select2-selection__choice__remove {
      font-size: 16px !important;
      padding: 5px 10px !important;

   }

   .select2-search__field {
      box-shadow: none !important;
   }

   .chat_div {
      display: inline-block;
      margin-right: 45px;
      cursor: pointer;
   }

   .chat_div img {
      margin-right: -15px;
      margin-left: -15px;
      border: 1px solid white;
   }

   .chat_div .circle-x {
      margin-left: -15px;
      margin-right: -15px;
      border: 1px solid white;
   }

   .select2-results__option--highlighted {
      border: 1px solid #edd0b6 !important;
      background: #eed6be98 !important;
      font-weight: normal;
      color: #d8873bec !important;
   }

   .chat-send .content-1 .content-1-2 {
      padding: 0px;
      margin-top: 10px;
      display: flex;
   }

   .chat-send .content-1 .content-1-2 .circle-x {
      margin-right: 10px;
   }
   .chat-send .content-1 .content-1-2 img {
      border-radius: 50%;
      margin-right: 10px;
   }

   .chat-send .content-1 .content-1-2 p {
      margin-top: 15px;
      font-size: 14px;
      line-height: 17px;

      color: #586F80 !important;
   }

   .chat-send .content-1 .content-1-2 p span {
      color: #ABB7BF !important;
      margin-left: 5px;
      font-size: 12px;
   }
</style>


<!-- chat heading -->
<div class="row chat-head">
   <div class="col-md-10 content-1">
      <?php if (isset($deal_chat) && !empty($deal_chat)) { ?>
         <?php foreach ($deal_chat as $key => $value) { ?>
            <?php echo GetChatUsers($value->deal_chat_room_id) ?>
         <?php }   ?>
      <?php  } ?>

   </div>
   <div class="col-md-2 content-1-2">
      <div class="add-btn">
         <button type="button" onclick="session_clear('chat_invited_list')" class="btn btn-primary btn-rounded btn-icon" data-toggle="modal" data-target="#addMember" data-whatever="">
            <img src="<?php echo base_url('assets/image/plus.png') ?>" alt="">
         </button>
      </div>

   </div>

</div>


<div class="chat-members" style="display: none;">

   <div id="messages">
   </div>


   <!-- chat send part -->
   <!-- <div class="container-fluid chat-send">
      <div class="row content-1">
         <div class="col-lg-6 col-md-6 col-xs-12 content-1-1">
            <p>Yes, we just received the clear to close! Let’s schedule a time & date.</p>
            <span>5:30 pm</span>
         </div>
      </div>
   </div> -->

   <!-- chat receive part -->
   <!-- <div class="container-fluid chat-recieve">
      <div class="row content-1">
         <div class="col-lg-4 col-md-4 col-xs-12 offset-md-8 offset-lg-8 content-1-1">
            <p>Excellent! How does March 27th look for everyone?</p>
            <span>5:30 pm</span>
         </div>
      </div>
   </div> -->

   <!----Chat typing form section--->
   <div class="row chat-typing">
      <form class='content-1' action="<?php echo base_url('Admin/Partial/send_chat_to_socket') ?>" enctype="multipart/form-data">
         <div class="form-group">
            <input type="hidden" name="deal_id" id="deal_id">
            <input type="hidden" name="room_id" id="room_id">
            <textarea name="message_content" id="message_content" placeholder="Type text here" class="form-control chat-disconnect" cols="30" rows="10"></textarea>
            <input id="myInput" type="file" style="visibility:hidden" />
            <label class="icon">
               <img src="<?php echo base_url('assets/image/upload.svg') ?>" width="20" height="20" onClick="$('#myInput').click();" />
            </label>
         </div>
         <button type="submit" class="content-1-2 chat-disconnect" id="sbmit-btn"> <img src=" <?php echo base_url('assets/image/enter.svg') ?>">
         </button>
      </form>
   </div>

</div>

<!-- Invite Chat Model -->
<div class="modal fade chat-screen" id="addMember" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <img src="<?php echo base_url('assets/image/vector-cross.png') ?>" aria-hidden="true" alt="">
            </button>
         </div>
         <div class="modal-body ui-front">
            <form class="submit-form-chat" action="<?php echo base_url('Admin/Partial/add_chat_member_to_system') ?>" enctype="form/multipart">
               <input type="hidden" name="deal_id" value="<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>">
               <input type="hidden" name="inviting_by" value="<?php echo $_SESSION['user_id'] ?>">
               <input type="hidden" name="members[]" value="<?php echo $_SESSION['user_id'] ?>">
               <!-- General details -->
               <div class="row">
                  <div class="col-md-12 deals_model_heading">
                     <h3>Chat Members</h3>
                     <hr>
                  </div>
                  <!-- error -->
                  <div class="col-sm-12">
                     <!-- success message -->
                     <div class="alert alert-fill-success mt-3" id="alert-success" style="display: none;" role="alert">
                     </div>
                     <!-- warning message -->
                     <div class="alert alert-fill-warning mt-3" id="alert-warning" style="display: none;" role="alert">

                     </div>
                  </div>
               </div>
               <!-- Form Details -->
               <div class="row next">
                  <!-- heading -->
                  <div class="col-md-12 mt-5">
                     <h5>Invite Chat Members</h5>
                  </div>


                  <div class="col-sm-12 form-group">
                     <select class="member-list form-control" name="members[]" multiple="multiple">
                        <?php if (isset($deal_members) && !empty($deal_members)) { ?>
                           <?php foreach ($deal_members as $key => $value) { ?>
                              <option value="<?php echo $value->invited_user_id ?>"><?php echo GetUserEmail($value->invited_user_id) ?></option>

                           <?php } ?>
                        <?php } ?>

                     </select>
                  </div>


               </div>


               <script>
                  $(document).ready(function() {
                     $('.member-list').select2({
                        width: '100%',
                        placeholder: "Enter an email"
                     });
                  });
               </script>



               <div class="row test-1">
                  <div class="col-md-6 offset-md-3 mt-2">
                     <div class="form-group">
                        <button type="submit" class="btn btn-primary form-control mt-3">Invite</button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>




<script>
   ///session clear  
   function session_clear(section) {
      var section = 'chat_invited_list'
      var url = '<?php echo base_url('Admin/Partial/session_clear') ?>';
      $.ajax({
         type: 'POST',
         url: url,
         data: {
            'section': section,
         },
         dataType: 'html',
         success: function(data) {
            let res = JSON.parse(data);
            switch (res.code) {
               case 'success':

                  break;
               case 'session-clear':
                  $('.chat-screen #list-members').html('');
                  $('.chat-screen #list-members').append(res.html);
                  break;
               case 'warning':

                  break;

            }
         },

      });

   }


   ///invite_chat_user by email
   function invite_chat_user() {
      var email = $('.chat-screen #invite_chat').val();
      $('.chat-screen #list-members').html('');
      var url = '<?php echo base_url('Admin/Partial/invite_chat_user') ?>';
      $.ajax({
         type: 'POST',
         url: url,
         data: {
            'email': email,
            'deal_id': '<?php echo $deal[0]->deal_id ?>'
         },
         dataType: 'html',

         success: function(data) {
            let res = JSON.parse(data);
            switch (res.code) {
               case 'success':
                  $('.chat-screen #list-members').append(res.html);
                  $('.chat-screen #alert-success').show();
                  $('.chat-screen #alert-success').text(res.message);
                  setTimeout(function() {
                     $('.chat-screen #alert-success').hide();
                     $('.chat-screen #invite_chat').val('');
                  }, 1000);

                  break;
               case 'warning':
                  //showWarningToast(res.message);
                  $('.chat-screen #alert-warning').show();
                  $('.chat-screen #alert-warning').text(res.message);
                  $('.chat-screen #list-members').append(res.html);
                  setTimeout(function() {
                     $('.chat-screen #alert-warning').hide();
                     $('.chat-screen #invite_chat').val('');
                  }, 1500);
                  break;




            }
         },

      });




   }

   ///post data to system
   ///submit form 
   $('.submit-form-chat').submit(function(e) {
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
                  $('#alert-success').show();
                  $('#alert-success').text(res.message);
                  console.log(res.room);
                  register_room(res.room);
                  setTimeout(function() {
                     window.location.reload();
                  }, 1500)
                  break;


               case 'warning':
                  $('#alert-warning').show();
                  $('#alert-warning').text(res.message);
                  setTimeout(function() {
                     $('#addMember').modal('hide');
                     $('#alert-warning').hide();
                     get_chat(res.deal_chat_room_id);
                     session_clear('chat_invited_list');
                  }, 1500)
                  break;

            }
         },

      });
   })

   ///
   function get_chat(deal_chat_room_id, chat_type = null) {
      $('.chat-members').hide();
      $('#messages').html('');
      var url = '<?php echo base_url('Admin/Partial/get_chat') ?>';
      $.ajax({
         type: 'POST',
         url: url,
         data: {
            'deal_chat_room_id': deal_chat_room_id,
            'chat_type': chat_type,
         },
         dataType: 'html',
         success: function(data) {
            let res = JSON.parse(data);
            switch (res.code) {
               case 'success':
                  $('.chat-members').show();
                  $('#deal_id').val(res.deal_id);
                  $('#room_id').val(res.room_id);
                  $('#messages').append(res.html);
                  break;
               case 'warning':

                  break;

            }
         },

      });

   }

   $('.chat_div').click(function() {
      $(".chat_div").removeClass("active-chat");
      $(this).addClass("active-chat");
   })
   
</script>
<style>
   .active-chat .circle-x,
   .active-chat img {
      border: 1px solid #e2a063;
   }
</style>

<!-- message send script -->
<script>
   ///
   $('#message_content').keypress(function(e) {
      if (e.which == 13 && !e.shiftKey) {
         $('form.content-1').submit();
         return false; //<---- Add this line
      }
   });
   ///submit form 
   $('.content-1').submit(function(e) {
      e.preventDefault();
      e.stopPropagation();
      var formData = new FormData(this);
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
                  send_group_message(res.data.deal_id, res.data.room_id, res.data.message_content);

                  break;

               case 'warning':
                  $('#sbmit-btn').attr('disabled', true);

                  break;

            }
         },
         cache: false,
         contentType: false,
         processData: false

      });
   })

   ///
   $(document).ready(function() {
      $('#sbmit-btn').attr('disabled', true);
      $('.chat-typing .content-1 .content-1-2').css('background', '#3a8bc1');
      $('#message_content').on('keyup', function() {
         var textarea_value = $("#message_content").val();
         if (textarea_value != '') {
            $('#sbmit-btn').attr('disabled', false);
            $('.chat-typing .content-1 .content-1-2').css('background', '#005995');
         } else {
            $('#sbmit-btn').attr('disabled', true);
            $('.chat-typing .content-1 .content-1-2').css('background', '#3a8bc1');
         }
      });
   });
</script>