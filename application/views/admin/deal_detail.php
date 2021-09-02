<link href="<?php echo base_url('vendor/emoji-picker/css/emoji.css') ?>" rel="stylesheet">
<link rel="stylesheet" href="<?php echo base_url('assets/css/') ?>jquery-ui.css">

<style>
  <?php require_once(APPPATH . 'views/admin/css/detail_deal.css') ?>
</style>
<style>
  .ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    z-index: 100;
    /* prevent horizontal scrollbar */
    overflow-x: hidden;
  }

  * html .ui-autocomplete {
    height: 100px;
  }
</style>


<div class="container-fluid header-box-1">
  <div class="col-md-12 mt-3 mb-2 content-1">
    <h5><?php echo (isset($deal) && !empty($deal)) ? $deal[0]->name : 'Deal Name' ?></h5>
    <div class="content-2">
      <p><?php echo (isset($deal) && !empty($deal)) ? $deal[0]->address : 'Deal Address' ?></p>
      <a class="address_navigation" href="http://maps.google.com/?q=<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->address : 'USA' ?>" target="_blank"><img src="<?php echo base_url('assets/image/pointer.svg') ?>" alt=""></a>
    </div>
    <!-- <button type="button" onclick="navigate_slide(1)" class="btn btn-primary btn-rounded btn-icon" data-toggle="modal" data-target="#updateDeal" data-whatever="">
      <img src="<?php echo base_url('assets/image/plus.png') ?>" alt="">
    </button>
     -->
    <a href="javascript:void(0)" class="edit-deal-icon" onclick="getinvitedusers('<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>')" data-toggle="modal" data-target="#updateDeal" data-whatever=""><i class="fa fa-pencil"></i></a>
    <a href="javascript:void(0)" class="delete-deal-icon" onclick="delete_deal('<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>')"><i class="fa fa-trash-o ml-auto px-1 py-1 mdi-24px pointer"></i></a>
    <ul class="navbar-nav d-none">
      <li class="nav-item dropdown d-none align-items-center d-lg-flex d-none">

        <button class="btn p-0" type="button" id="pagesDropdown " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="mdi mdi-dots-vertical card-menu-btn"></i>
        </button>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" onclick="getinvitedusers('<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>')" data-toggle="modal" data-target="#updateDeal" data-whatever="">
            <i class="fa fa-pencil text-primary"></i>
            Edit Deal
          </a>
          <a class="dropdown-item" onclick="delete_deal('<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>')">
            <i class="fa fa-trash-o text-primary"></i>
            Delete Deal
          </a>
          <a class="dropdown-item" href="http://maps.google.com/?q=<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->address : 'USA' ?>" target="_blank">
            <i class="fa fa-location-arrow"></i>
            Navigate
          </a>

        </div>
      </li>

    </ul>
  </div>
</div>

<div class="container-fluid header-box-3">
  <img src="<?php echo base_url('assets/image/bg-line.png') ?>" alt="">
</div>

<div class="container-fluid header-box-2">
  <div class="col-md-12 mt-2 content-1">
    <ul class="nav nav-pills nav-pills-success" id="pills-tab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" id="pills-timeline-tab" data-toggle="pill" href="#pills-timeline" role="tab" aria-controls="pills-timeline" aria-selected="true">
          <img src="<?php echo base_url('assets/image/comment.svg') ?>" width="40" height="35" alt="">
          <span>Timeline</span>
        </a>

      </li>
      <li class="nav-item">
        <a class="nav-link" id="pills-chat-tab" data-toggle="pill" href="#pills-chat" role="tab" aria-controls="pills-chat" aria-selected="false">
          <img src="<?php echo base_url('assets/image/chat.svg') ?>" width="40" height="35" alt="">

          <span>Chat</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="pills-members-tab" data-toggle="pill" href="#pills-members" role="tab" aria-controls="pills-members" aria-selected="false">
          <img src="<?php echo base_url('assets/image/group.svg') ?>" id="mem-img" width="45" height="37" alt="">
          <span>Members</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="pills-notification-tab" data-toggle="pill" href="#pills-notification" role="tab" aria-controls="pills-notification" aria-selected="false">
          <img src="<?php echo base_url('assets/image/bell.svg') ?>" width="32" height="35" alt="">
          <span>Notifications</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-selected="false">
          <img src="<?php echo base_url('assets/image/contract.svg') ?>" width="32" height="35" alt="">
          <span>Description</span>
        </a>
      </li>
    </ul>
  </div>
</div>


<div class="content-wrapper">

  <div class="tab-content" id="pills-tabContent">

    <!-- timeline tab -->
    <div class="tab-pane fade active show" id="pills-timeline" role="tabpanel" aria-labelledby="pills-timeline-tab">
      <p>Timeline Screen</p>
    </div>


    <!-- chat tab -->
    <div class="tab-pane fade" id="pills-chat" role="tabpanel" aria-labelledby="pills-chat-tab">
      <!-- templates -->
      <?php $this->load->view('templates/admin/chat_members') ?>
    </div>


    <!-- members tab -->
    <div class="tab-pane fade" id="pills-members" role="tabpanel" aria-labelledby="pills-members-tab">
      <div class="row">
        <div class="col-md-3 mb-3" id="member-mobile-btn" style="display: none;">
          <div class="add-btn">
            <button type="button" class="btn btn-primary btn-rounded btn-icon" onclick="getinvitedusers('<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>')" data-toggle="modal" data-target="#updateDeal" data-whatever="">
              <img src="<?php echo base_url('assets/image/plus.png') ?>" alt="">
            </button>
          </div>

        </div>
        <div class="col-md-9">
          <?php if (isset($deal_members) && !empty($deal_members)) { ?>
            <div class="row">
              <?php foreach ($deal_members as $key => $value) { ?>
                <div class="col-lg-4 col-md-6 col-xs-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center member-box">
                        <?php if (CheckProfile($value->invited_user_id) != 'No Profile') { ?>
                          <img class="img-sm rounded-circle" src="<?php echo base_url(CheckProfile($value->invited_user_id)) ?>" width="62" height="62" alt="profile">
                        <?php } else { ?>
                          <?php echo NoProfile($value->invited_user_id) ?>
                        <?php } ?>
                        <div class="ml-3 mr-3" style="cursor: pointer;">
                          <?php if (GetUserStatus($value->invited_user_id) == 'active') { ?>
                            <h4 class="mb-1" title="<?php echo GetUserName($value->invited_user_id) ?>"><?php echo (strlen(GetUserName($value->invited_user_id)) >= 15) ? substr(GetUserName($value->invited_user_id), 0, 15) . '...' : GetUserName($value->invited_user_id) ?></h4>
                          <?php } else { ?>
                            <h4 class="mb-1" title="<?php echo GetUserEmail($value->invited_user_id) ?>"><?php echo (strlen(GetUserEmail($value->invited_user_id)) >= 15) ? substr(GetUserEmail($value->invited_user_id), 0, 15) . '...' : GetUserEmail($value->invited_user_id) ?></h4>

                          <?php } ?>
                          <small class="text-muted mb-0"><?php echo GetUserRolesById($value->invited_user_id) ?></small>
                        </div>
                        <i class="fa fa-trash-o ml-auto px-1 py-1 mdi-24px pointer" onclick="DeleteInvitedMember('<?php echo $value->invite_id ?>','<?php echo $value->invited_user_id ?>')"></i>
                      </div>
                    </div>
                  </div>
                </div>
              <?php } ?>
            </div>
          <?php  } ?>
        </div>
        <div class="col-md-3" id="member-window-btn">
          <div class="add-btn">
            <button type="button" class="btn btn-primary btn-rounded btn-icon" onclick="getinvitedusers('<?php echo (isset($deal) && !empty($deal)) ? $deal[0]->deal_id : '' ?>')" data-toggle="modal" data-target="#updateDeal" data-whatever="">
              <img src="<?php echo base_url('assets/image/plus.png') ?>" alt="">
            </button>
          </div>

        </div>
      </div>
    </div>

    <!-- notification tab -->
    <div class="tab-pane fade" id="pills-notification" role="tabpanel" aria-labelledby="pills-notification-tab">
      <p>Notification Screen</p>
    </div>


    <!-- description tab -->
    <div class="tab-pane fade" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
      <?php if (isset($deal) && !empty($deal)) { ?>
        <p><?php echo $deal[0]->description ?></p>
      <?php } else { ?>
        <p>No Description </p>
      <?php }  ?>
    </div>

  </div>


</div>


<!-- update deal model -->
<?php $this->load->view('templates/modals/update_deal') ?>

 



<!---Emoji Picker Library--->
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

<!---Autocomplete Jquery Api-->
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


        }
      },

    });
  }
</script>