 <link href="<?php echo base_url('vendor/emoji-picker/css/emoji.css') ?>" rel="stylesheet">
 <link rel="stylesheet" href="<?php echo base_url('assets/css/') ?>jquery-ui.css">
 <style>
   .ui-autocomplete {
     max-height: 100px;
     overflow-y: auto;
     z-index: 100;
     /* prevent horizontal scrollbar */
     overflow-x: hidden;
   }

   /* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
   * html .ui-autocomplete {
     height: 100px;
   }
 </style>
 <style>
   <?php require_once(APPPATH . 'views/admin/css/deals.css') ?>
 </style>


 <!-- testing -->
 <style>
   .ui-menu img {
     width: 40px;
     height: 40px;
   }

   .ui-menu li span {
     font-size: 2em;
     padding: 0 0 10px 10px;
     margin: 0 0 10px 0 !important;
     white-space: nowrap;
   }
 </style>





 <div class="content-wrapper">
   <!-- <div class="ui-widget">
        <label for="tags">Tags: </label>
        <input type="text" name="members" id="invite" placeholder="Enter an email or phone number to send them an invite" class="form-control tags">

    </div> -->
   <!-- my tabs -->
   <div class="row test">
     <div class="col-sm-12 col-xs-12">
       <div class="headings">
         <ul class="nav nav-pills nav-pills-success" id="pills-tab" role="tablist">
           <li class="nav-item">
             <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Current Deals</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Completed Deals</a>
           </li>
         </ul>
         <div class="add-btn">
           <button type="button" onclick="navigate_slide(1)" class="btn btn-primary btn-rounded btn-icon" data-toggle="modal" data-target="#creatDeal" data-whatever="">
             <img src="<?php echo base_url('assets/image/plus.png') ?>" alt="">
           </button>
         </div>
       </div>
     </div>
   </div>


   <div class="row">
     <div class="col-md-12 col-xl-12">
       <div class="tab-content" id="pills-tabContent">

         <!-- Incomplete Deals -->
         <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
           <?php if (isset($active_deals) && !empty($active_deals)) { ?>
             <div class="row">
               <?php foreach ($active_deals as $key => $value) { ?>
                 <div class="col-lg-4">
                   <div class="accordion" id="accordion" role="tablist">
                     <div class="card">
                       <?php echo RecentActivitiesCount($value->deal_id) ?>
                       <div class="card-header" role="tab" id="heading-1">
                         <div class="row">
                           <div class="col-sm-12 col-xs-12 card-heading" onclick="redirect('<?php echo urlencode(base64_encode($value->deal_id)) ?>')">
                             <a class="heading-link" href="javascript:void(0)"><?php echo $value->name ?></a>
                             <span><?php echo $value->address ?></span>

                             <div class="follow-image">
                               <?php echo GetFollowUsers($value->deal_id) ?>
                             </div>

                             <h6>Current Task</h6>

                             <div class="current-task">
                               <!-- <img src="<?php echo base_url("assets/") ?>image/image_1.png"> -->
                               <div class="circle-x"><span>B</span></div>

                               <a href="javascript:void(0)"> David</a>
                             </div>

                           </div>


                         </div>
                         <hr>
                         <h6 class="mb-0">
                           <a data-toggle="collapse" class="recent-activity" href="#collapse-<?php echo $value->deal_id ?>" aria-expanded="false" aria-controls="collapse-1">
                             Recent Activity
                           </a>
                         </h6>
                       </div>
                       <div id="collapse-<?php echo $value->deal_id ?>" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                         <div class="card-body">
                           <div class="row">
                             <div class="col-12">
                               <?php echo RecentActivities($value->deal_id) ?>
                             </div>
                           </div>
                         </div>
                       </div>
                     </div>


                   </div>

                 </div>
               <?php  } ?>
             </div>
           <?php  } else { ?>
             <div class="row">
               <div class="col-sm-12 text-center no_deal">
                 <img src="<?php echo base_url('assets/image/no_deal.png') ?>" alt="">
                 <h3>No Deals Yet!</h3>
                 <p>Click the (+) button to create a deal</p>
               </div>

             </div>
           <?php }  ?>
         </div>

         <!-- Completed Deals -->
         <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
           <?php if (isset($inactive_deals) && !empty($inactive_deals)) { ?>
             <div class="row" id="complete">
               <?php foreach ($inactive_deals as $key => $value) { ?>
                 <div class="col-lg-4">
                   <div class="accordion" id="accordion" role="tablist">
                     <div class="card">
                       <?php echo RecentActivitiesCount($value->deal_id) ?>
                       <div class="card-header" role="tab" id="heading-1">
                         <div class="row">
                           <div class="col-sm-12 col-xs-12 card-heading" onclick="redirect('<?php echo urlencode(base64_encode($value->deal_id)) ?>')">
                             <a class="heading-link" href="javascript:void(0)"><?php echo $value->name ?></a>
                             <span><?php echo $value->address ?></span>

                             <div class="follow-image">
                               <?php echo GetFollowUsers($value->deal_id) ?>
                             </div>

                             <h6>Current Task</h6>

                             <div class="current-task">
                               <!-- <img src="<?php echo base_url("assets/") ?>image/image_1.png"> -->
                               <div class="circle-x"><span>B</span></div>
                               <a href="javascript:void(0)"> David</a>
                             </div>

                           </div>


                         </div>
                         <hr>
                         <h6 class="mb-0">
                           <a data-toggle="collapse" class="recent-activity" href="#collapse-<?php echo $value->deal_id ?>" aria-expanded="false" aria-controls="collapse-1">
                             Recent Activity
                           </a>
                         </h6>
                       </div>
                       <div id="collapse-<?php echo $value->deal_id ?>" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                         <div class="card-body">
                           <div class="row">
                             <div class="col-12">
                               <?php echo RecentActivities($value->deal_id) ?>
                             </div>
                           </div>
                         </div>
                       </div>
                     </div>


                   </div>

                 </div>
               <?php  } ?>
             </div>
           <?php  } else { ?>
             <div class="row">
               <div class="col-sm-12 text-center no_deal">
                 <img src="<?php echo base_url('assets/image/no_deal.png') ?>" alt="">
                 <h3>No Deals Yet!</h3>
                 <p>Click the (+) button to create a deal</p>
               </div>

             </div>
           <?php }  ?>
         </div>

       </div>
     </div>
   </div>


 </div>


 <!-- create deal model -->
 <?php $this->load->view('templates/modals/new_deal') ?> 

  



 



 <!---Emoji Library--->
 <script src="<?php echo base_url('vendor/emoji-picker/js/config.js') ?>"></script>
 <script src="<?php echo base_url('vendor/emoji-picker/js/util.js') ?>"></script>
 <script src="<?php echo base_url('vendor/emoji-picker/js/jquery.emojiarea.js') ?>"></script>
 <script src="<?php echo base_url('vendor/emoji-picker/js/emoji-picker.js') ?>"></script>
 <script>
   $(function() {
     // Initializes and creates emoji set from sprite sheet
     window.emojiPicker = new EmojiPicker({
       emojiable_selector: '[data-emojiable=true]',
       assetsPath: '<?php echo base_url('vendor/emoji-picker/img/') ?>',
       popupButtonClasses: 'icon-smile'
     });

     window.emojiPicker.discover();
   });
 </script>



 <!---Autocomplete Jquery API--->
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script>
   $(function() {
     get_autocomplete_user();
   })

   ///submit form 
   function get_autocomplete_user() {
     var url = '<?php echo base_url('Admin/Partial/get_autocomplete_user') ?>';
     $.ajax({
       type: 'POST',
       url: url,
       data: {
         'table': 'users',
       },
       dataType: 'html',
       success: function(data) {
         let res = JSON.parse(data);
         switch (res.code) {
           case 'success':
             $(".tags").autocomplete({
               source: res.data
             });

             break;
           case 'warning':

             break;

         }
       },

     });
   }
 </script>




 