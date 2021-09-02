<!DOCTYPE html>
<html lang="en">

<head>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Current Deal</title>
  <!-- base:css -->
  <link rel="stylesheet" href="<?php echo base_url('assets/') ?>vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="<?php echo base_url('assets/') ?>vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="<?php echo base_url('assets/') ?>vendors/font-awesome/css/font-awesome.min.css">
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="<?php echo base_url('assets/') ?>vendors/jquery-toast-plugin/jquery.toast.min.css">

  <link rel="stylesheet" href="<?php echo base_url('assets/') ?>css/style.css">
  <link rel="stylesheet" href="<?php echo base_url('assets/') ?>css/responsive.css">
  <link rel="shortcut icon" href="<?php echo base_url('assets/') ?>image/favicon.png" />
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">
  <!-- css file for all pages -->
  <style>
    <?php require_once(APPPATH . 'views/admin/css/common.css') ?>
  </style>
  <style>
    .loader {
      display: none;
      position: absolute;
      z-index: 999999;
      top: 0;
      left: 0;
      opacity: 0.85;
      height: 100%;
      width: 100%;
      background: url('<?php echo base_url('assets/loader.gif') ?>') 50% 50% no-repeat;
    }



    body.loading .loader {
      overflow: hidden;
    }

    body.loading .loader {
      display: block;
    }
  </style>


  <!-- base:js -->
  <script src="<?php echo base_url() ?>assets/vendors/base/vendor.bundle.base.js"></script>
  <script src="<?php echo base_url() ?>assets/js/jquery.form.js"></script>
  <script src="<?php echo base_url('assets/') ?>vendors/jquery-toast-plugin/jquery.toast.min.js"></script>
  <script src="<?php echo base_url('assets/') ?>js/toastDemo.js"></script>

  <!-- autocomplete Google api -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC-RwQuqZ9AyZMcs7aVKdIBoVlLqo4zcrY&libraries=places&language=en"></script>
  <script>
    function initializeMap() {
      // var LatLng = {lat: 20.23, lng: -8.28460};
      // var mapOptions = {
      //     center: LatLng,
      //     zoom: 6,
      //     scrollwheel:false,
      //     noClear: true
      // }

      // var map = new google.maps.Map(document.getElementById('map'), mapOptions);

      // var marker = new google.maps.Marker({
      //         position: LatLng,
      //         map: map,
      //         draggable: true,
      //         title: "Binko"
      // });

      var input = document.getElementById('location');
      var autocomplete = new google.maps.places.Autocomplete(input);
      // autocomplete.bindTo('bounds',map);

      // google.maps.event.addListener(autocomplete, 'place_changed',function(){
      //     var place=autocomplete.getPlace();
      //     if (!place.geometry){
      //         return;
      //     }
      //     if (place.geometry.viewport) {
      //         map.fitBounds(place.geometry.viewport);
      //     } else {
      //         map.setCenter(place.geometry.location);
      //         map.setZoom(17);
      //     }

      //     marker.setPlace( ({
      //         placeId: place.place_id,
      //         location: place.geometry.location
      //     }));
      // });
    };

    google.maps.event.addDomListener(window, 'load', initializeMap);
  </script>





</head>

<body class="sidebar-fixed">

  <!-- <div class="container-scroller"> -->
  <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
      <ul class="navbar-nav mobile-manu-logo">
        <li class="nav-item  dropdown align-items-center d-lg-flex">
          <a class="navbar-brand logo-text" href="<?php echo base_url('deals') ?>">
            <!-- <img src="<?php echo base_url("assets/") ?>image/Logo.png" alt=""> -->
            <h1>REVA</h1>
            <span>Real Estate Virtual Assistant</span>
          </a>

        </li>

      </ul>
      <ul class="navbar-nav navbar-nav-right">
        <!-- <li class="nav-item nav-search d-none d-lg-flex">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="search">
                  <i class="mdi mdi-magnify"></i>
                  </span>
                </div>
                <input type="text" class="form-control" placeholder="Type to search..." aria-label="search" aria-describedby="search">
              </div>
            </li> -->
        <!-- <li class="nav-item dropdown">
          <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
            <i class="fa fa-bell-o mx-0"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
            <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-success">
                  <i class="mdi mdi-information mx-0"></i>
                </div>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject font-weight-normal">Application Error</h6>
                <p class="font-weight-light small-text mb-0 text-muted">
                  Just now
                </p>
              </div>
            </a>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-warning">
                  <i class="mdi mdi-settings mx-0"></i>
                </div>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject font-weight-normal">Settings</h6>
                <p class="font-weight-light small-text mb-0 text-muted">
                  Private message
                </p>
              </div>
            </a>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-info">
                  <i class="mdi mdi-account-box mx-0"></i>
                </div>
              </div>
              <div class="preview-item-content">
                <h6 class="preview-subject font-weight-normal">New user registration</h6>
                <p class="font-weight-light small-text mb-0 text-muted">
                  2 days ago
                </p>
              </div>
            </a>
          </div>
        </li> -->


        <li class="nav-item nav-search d-none d-lg-flex">
          <div class="input-group" style="height: 40px; padding:0px">
            <div class="input-group-prepend" style="padding-left: 10px;font-size: 11px;">
              <span class="input-group-text" id="search">
                <i class="mdi mdi-magnify" style="font-size: 20px;"></i>
              </span>
            </div>
            <style>
              .highlight {
                background-color: yellow;
              }
            </style>
            <input type="text" id="filter-input" name="keyword" class="form-control" onkeyup="filter_content()" placeholder="Type to search..." aria-label="search" aria-describedby="search" autocomplete="off" style="font-size: 15px;padding-left: 7px;">

          </div>
        </li>

        <li class="nav-item dropdown">


          <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="pagesDropdown" href="#" data-toggle="dropdown">
            <?php if (isset($_SESSION['profile']) && ($_SESSION['profile'] != 'No Profile')) { ?>
              <img src="<?php echo base_url($_SESSION['profile']) ?>" class="nav-user-icon" alt="profile" />
            <?php } else { ?>
              <?php echo NoProfile($_SESSION['user_id']) ?>
            <?php } ?>
            <i class="fa fa-angle-down"></i>
          </a>


          <div class="dropdown-menu dropdown-menu-right navbar-dropdown " aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="<?php echo base_url('profile') ?>">
              <i class="fa fa-user-circle-o text-primary"></i>
              My Profile
            </a>

            <a class="dropdown-item" href="javascript:void(0)">
              <i class="fa fa-info-circle text-primary"></i>
              About Us
            </a>

            <a class="dropdown-item" href="<?php echo base_url('change_password') ?>">
              <i class="fa fa-key text-primary"></i>
              Change Password
            </a>

            <a class="dropdown-item" href="javascript:void(0)">
              <i class="fa fa-file-text-o text-primary"></i>
              Terms & Conditions
            </a>


            <a class="dropdown-item" href="<?php echo base_url('logout') ?>">
              <i class="fa fa-sign-out text-primary"></i>
              Logout
            </a>
          </div>
        </li>
      </ul>

      <!-- <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas" id="toggale-btn">
        <span class="mdi mdi-menu"></span>
      </button> -->
    </div>
  </nav>

  <div class="container-fluid page-body-wrapper">

    <!-- partial:partials/_sidebar.html -->
    <!-- <nav class="sidebar sidebar-offcanvas" id="sidebar" style="display: none;">
      <ul class="nav">
        <li class="nav-item nav-profile">
          <div class="nav-link d-flex">
            <div class="profile-image">
              <img src="<?php echo base_url('assets/image/admin.jpg') ?>" alt="image">
            </div>
            <div class="profile-name">
              <p class="name">
                <?php echo (isset($_SESSION['username'])) ? $_SESSION['username'] : 'AdminTest' ?>
              </p>
              <p class="designation">
                Admin
              </p>
            </div>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<?php echo base_url('dashboard') ?>">
            <i class="mdi mdi-shield-check menu-icon"></i>
            <span class="menu-title">Dashboard</span>
          </a>
        </li> 
      </ul>
    </nav> -->
    <!-- partial -->
    <div class="main-panel">