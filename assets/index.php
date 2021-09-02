<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Current Deal</title>
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <link rel="shortcut icon" href="images/favicon.png" />
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">
</head>

<body class="sidebar-fixed">
  <!-- <div class="container-scroller"> -->
  <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item  dropdown d-none align-items-center d-lg-flex d-none">
          <a class="navbar-brand" href="javascript:void(0)">
            <img src="image/Logo.png" alt="">
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
        <li class="nav-item dropdown">
          <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
            <i class="mdi mdi-bell-outline mx-0"></i>
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
        </li>
        <!-- <li class="nav-item dropdown">
              <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
                <i class="mdi mdi-email-outline mx-0"></i>
                <p class="notification-ripple notification-ripple-bg">
                  <span class="ripple notification-ripple-bg"></span>
                  <span class="ripple notification-ripple-bg"></span>
                  <span class="ripple notification-ripple-bg"></span>
                </p>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="https://via.placeholder.com/36x36" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow">
                    <h6 class="preview-subject ellipsis font-weight-normal">David Grey
                    </h6>
                    <p class="font-weight-light small-text text-muted mb-0">
                      The meeting is cancelled
                    </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="https://via.placeholder.com/36x36" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow">
                    <h6 class="preview-subject ellipsis font-weight-normal">Tim Cook
                    </h6>
                    <p class="font-weight-light small-text text-muted mb-0">
                      New product launch
                    </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="https://via.placeholder.com/36x36" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content flex-grow">
                    <h6 class="preview-subject ellipsis font-weight-normal"> Johnson
                    </h6>
                    <p class="font-weight-light small-text text-muted mb-0">
                      Upcoming board meeting
                    </p>
                  </div>
                </a>
              </div>
            </li> -->
        <li class="nav-item nav-user-icon">
          <a class="nav-link" href="#">
            <img src="image/image.png" alt="profile" />
          </a>
        </li>
        <li class="nav-item nav-settings d-none d-lg-flex">
          <a class="nav-link" href="javascript:void(0)">
            <img src="image/Vector_59.png" alt="">
            <!-- <i class="mdi mdi-dots-horizontal"></i> -->
          </a>
        </li>
      </ul>
      <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas" id="toggale-btn">
        <span class="mdi mdi-menu"></span>
      </button>
    </div>
  </nav>

  <div class="container-fluid page-body-wrapper">

    <!-- partial:../../partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar" style="display: none;">
      <ul class="nav">
        <li class="nav-item nav-profile">
          <div class="nav-link d-flex">
            <div class="profile-image">
              <img src="https://via.placeholder.com/37x37" alt="image">
            </div>
            <div class="profile-name">
              <p class="name">
                Edwin Harring
              </p>
              <p class="designation">
                Manager
              </p>
            </div>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../index.html">
            <i class="mdi mdi-shield-check menu-icon"></i>
            <span class="menu-title">Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/widgets/widgets.html">
            <i class="mdi mdi-puzzle menu-icon"></i>
            <span class="menu-title">Widgets<span class="badge badge-danger">New</span></span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi mdi-view-array menu-icon"></i>
            <span class="menu-title">UI Elements</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/accordions.html">Accordions</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/buttons.html">Buttons</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/badges.html">Badges</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/breadcrumbs.html">Breadcrumbs</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/dropdowns.html">Dropdowns</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/modals.html">Modals</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/progress.html">Progress bar</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/pagination.html">Pagination</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/tabs.html">Tabs</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/typography.html">Typography</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/tooltips.html">Tooltips</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-advanced" aria-expanded="false" aria-controls="ui-advanced">
            <i class="mdi mdi-palette menu-icon"></i>
            <span class="menu-title">Advanced UI</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-advanced">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/dragula.html">Dragula</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/clipboard.html">Clipboard</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/context-menu.html">Context menu</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/slider.html">Sliders</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/carousel.html">Carousel</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/colcade.html">Colcade</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/ui-features/loaders.html">Loaders</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
            <i class="mdi mdi-view-headline menu-icon"></i>
            <span class="menu-title">Forms <span class="badge badge-pill badge-info">2</span></span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="form-elements">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"><a class="nav-link" href="../../pages/forms/basic_elements.html">Basic Elements</a></li>
              <li class="nav-item"><a class="nav-link" href="../../pages/forms/advanced_elements.html">Advanced Elements</a></li>
              <li class="nav-item"><a class="nav-link" href="../../pages/forms/validation.html">Validation</a></li>
              <li class="nav-item"><a class="nav-link" href="../../pages/forms/wizard.html">Wizard</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#editors" aria-expanded="false" aria-controls="editors">
            <i class="mdi mdi-pencil menu-icon"></i>
            <span class="menu-title">Editors</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="editors">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"><a class="nav-link" href="../../pages/forms/text_editor.html">Text editors</a></li>
              <li class="nav-item"><a class="nav-link" href="../../pages/forms/code_editor.html">Code editors</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
            <i class="mdi mdi-signal menu-icon"></i>
            <span class="menu-title">Charts</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="charts">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/chartjs.html">ChartJs</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/morris.html">Morris</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/flot-chart.html">Flot</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/google-charts.html">Google charts</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/sparkline.html">Sparkline js</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/c3.html">C3 charts</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/chartist.html">Chartists</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/charts/justGage.html">JustGage</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
            <i class="mdi mdi-format-list-bulleted-square menu-icon"></i>
            <span class="menu-title">Tables</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="tables">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/tables/basic-table.html">Basic table</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/tables/data-table.html">Data table</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/tables/js-grid.html">Js-grid</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/tables/sortable-table.html">Sortable table</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/ui-features/popups.html">
            <i class="mdi mdi-drawing-box menu-icon"></i>
            <span class="menu-title">Popups</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/ui-features/notifications.html">
            <i class="mdi mdi-bell menu-icon"></i>
            <span class="menu-title">Notifications</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
            <i class="mdi mdi-emoticon-excited-outline menu-icon"></i>
            <span class="menu-title">Icons</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="icons">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/icons/flag-icons.html">Flag icons</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/icons/mdi.html">Mdi icons</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/icons/font-awesome.html">Font Awesome</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/icons/simple-line-icon.html">Simple line icons</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/icons/themify.html">Themify icons</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#maps" aria-expanded="false" aria-controls="maps">
            <i class="mdi mdi-map menu-icon"></i>
            <span class="menu-title">Maps</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="maps">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/maps/mapael.html">Mapael</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/maps/vector-map.html">Vector Map</a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/maps/google-maps.html">Google Map</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
            <i class="mdi mdi-account-circle menu-icon"></i>
            <span class="menu-title">User Pages</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="auth">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/login.html"> Login </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/login-2.html"> Login 2 </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/register.html"> Register </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/register-2.html"> Register 2 </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/lock-screen.html"> Lockscreen </a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
            <i class="mdi mdi-alert-circle menu-icon"></i>
            <span class="menu-title">Error pages</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="error">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/error-404.html"> 404 </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/error-500.html"> 500 </a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
            <i class="mdi mdi-view-quilt menu-icon"></i>
            <span class="menu-title">General Pages</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="general-pages">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/blank-page.html"> Blank Page </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/profile.html"> Profile </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/faq.html"> FAQ </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/faq-2.html"> FAQ 2 </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/news-grid.html"> News grid </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/timeline.html"> Timeline </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/search-results.html"> Search Results </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/portfolio.html"> Portfolio </a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#e-commerce" aria-expanded="false" aria-controls="e-commerce">
            <i class="mdi mdi-cart-outline menu-icon"></i>
            <span class="menu-title">E-commerce</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="e-commerce">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/invoice.html"> Invoice </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/pricing-table.html"> Pricing Table </a></li>
              <li class="nav-item"> <a class="nav-link" href="../../pages/samples/orders.html"> Orders </a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/apps/email.html">
            <i class="mdi mdi-email-outline menu-icon"></i>
            <span class="menu-title">E-mail</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/apps/calendar.html">
            <i class="mdi mdi-calendar-blank menu-icon"></i>
            <span class="menu-title">Calendar</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/apps/todo.html">
            <i class="mdi mdi-checkbox-marked-outline menu-icon"></i>
            <span class="menu-title">Todo List</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/apps/gallery.html">
            <i class="mdi mdi-image-filter menu-icon"></i>
            <span class="menu-title">Gallery</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../../pages/documentation/documentation.html">
            <i class="mdi mdi-file-document menu-icon"></i>
            <span class="menu-title">Documentation</span>
          </a>
        </li>
      </ul>
    </nav>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
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
                <button type="button" class="btn btn-primary btn-rounded btn-icon">
                  <i class="mdi mdi-plus"></i>
                </button>
              </div>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-md-12 col-xl-12">
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <div class="row">
                  <div class="col-lg-4">
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="card"> 
                        <span class="count-activity">2</span>
                        <div class="card-header" role="tab" id="heading-1">
                          <div class="row">
                            <div class="col-sm-12 col-xs-12 card-heading">
                              <h5>John Smith</h5>
                              <span>101 N. Haven St. Ba...</span>
                              <div class="follow-image">
                                <img src="image/image_1.png" class="img1">
                                <img src="image/image_2.png" class="img2">
                                <img src="image/image_3.png" class="img2">
                              </div>
                              <h6>Current Task</h6>
                              <div class="current-task">
                                <img src="image/image_1.png">
                                <a href="javascript:void(0)"> David</a>
                              </div>

                            </div>


                          </div>
                          <hr>
                          <h6 class="mb-0">
                            <a data-toggle="collapse" class="recent-activity" href="#collapse-1" aria-expanded="false" aria-controls="collapse-1">
                              Recent Activity
                            </a>
                          </h6>
                        </div>

                        <div id="collapse-1" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12">
                                <div class="recent-label">
                                  <p class="mb-0"><span class="recent-label-span"> Sarah Musk </span> has added task </p>
                                  <p> “Client Begins Process</p>

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>


                  </div>
                  <div class="col-lg-4">
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="card">
                        <div class="card-header" role="tab" id="heading-1">
                          <div class="row">
                            <div class="col-sm-12 col-xs-12 card-heading">
                              <h5>John Smith</h5>
                              <span>101 N. Haven St. Ba...</span>
                              <div class="follow-image">
                                <img src="image/image_1.png" class="img1">
                                <img src="image/image_2.png" class="img2">
                                <img src="image/image_3.png" class="img2">
                              </div>
                              <h6>Current Task</h6>
                              <div class="current-task">
                                <img src="image/image_1.png">
                                <a href="javascript:void(0)"> David</a>
                              </div>

                            </div>


                          </div>
                          <hr>
                          <h6 class="mb-0">
                            <a data-toggle="collapse" class="recent-activity" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
                              Recent Activity
                            </a>
                          </h6>
                        </div>

                        <div id="collapse-2" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12">
                                <div class="recent-label">
                                  <p class="mb-0"><span class="recent-label-span"> Sarah Musk </span> has added task </p>
                                  <p> “Client Begins Process</p>

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>


                  </div>
                  <div class="col-lg-4">
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="card">
                        <div class="card-header" role="tab" id="heading-1">
                          <div class="row">
                            <div class="col-sm-12 col-xs-12 card-heading">
                              <h5>John Smith</h5>
                              <span>101 N. Haven St. Ba...</span>
                              <div class="follow-image">
                                <img src="image/image_1.png" class="img1">
                                <img src="image/image_2.png" class="img2">
                                <img src="image/image_3.png" class="img2">
                              </div>
                              <h6>Current Task</h6>
                              <div class="current-task">
                                <img src="image/image_1.png">
                                <a href="javascript:void(0)"> David</a>
                              </div>

                            </div>


                          </div>
                          <hr>
                          <h6 class="mb-0">
                            <a data-toggle="collapse" class="recent-activity" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
                              Recent Activity
                            </a>
                          </h6>
                        </div>

                        <div id="collapse-3" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12">
                                <div class="recent-label">
                                  <p class="mb-0"><span class="recent-label-span"> Sarah Musk </span> has added task </p>
                                  <p> “Client Begins Process</p>

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>


                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                <div class="row" id="complete">
                  <div class="col-lg-4">
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="card">
                        <div class="card-header" role="tab" id="heading-1">
                          <div class="row">
                            <div class="col-sm-12 col-xs-12 card-heading">
                              <h5>John Smith</h5>
                              <span>101 N. Haven St. Ba...</span>
                              <div class="follow-image">
                                <img src="image/image_1.png" class="img1">
                                <img src="image/image_2.png" class="img2">
                                <img src="image/image_3.png" class="img2">
                              </div>
                              <h6>Current Task</h6>
                              <div class="current-task">
                                <img src="image/image_1.png">
                                <a href="javascript:void(0)"> David</a>
                              </div>

                            </div>


                          </div>
                          <hr>
                          <h6 class="mb-0">
                            <a data-toggle="collapse" class="recent-activity" href="#collapse-1" aria-expanded="false" aria-controls="collapse-1">
                              Recent Activity
                            </a>
                          </h6>
                        </div>

                        <div id="collapse-1" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12">
                                <div class="recent-label">
                                  <p class="mb-0"><span class="recent-label-span"> Sarah Musk </span> has added task </p>
                                  <p> “Client Begins Process</p>

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>


                  </div>
                  <div class="col-lg-4">
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="card">
                        <div class="card-header" role="tab" id="heading-1">
                          <div class="row">
                            <div class="col-sm-12 col-xs-12 card-heading">
                              <h5>John Smith</h5>
                              <span>101 N. Haven St. Ba...</span>
                              <div class="follow-image">
                                <img src="image/image_1.png" class="img1">
                                <img src="image/image_2.png" class="img2">
                                <img src="image/image_3.png" class="img2">
                              </div>
                              <h6>Current Task</h6>
                              <div class="current-task">
                                <img src="image/image_1.png">
                                <a href="javascript:void(0)"> David</a>
                              </div>

                            </div>


                          </div>
                          <hr>
                          <h6 class="mb-0">
                            <a data-toggle="collapse" class="recent-activity" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
                              Recent Activity
                            </a>
                          </h6>
                        </div>

                        <div id="collapse-2" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12">
                                <div class="recent-label">
                                  <p class="mb-0"><span class="recent-label-span"> Sarah Musk </span> has added task </p>
                                  <p> “Client Begins Process</p>

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>


                  </div>
                  <div class="col-lg-4">
                    <div class="accordion" id="accordion" role="tablist">
                      <div class="card">
                        <div class="card-header" role="tab" id="heading-1">
                          <div class="row">
                            <div class="col-sm-12 col-xs-12 card-heading">
                              <h5>John Smith</h5>
                              <span>101 N. Haven St. Ba...</span>
                              <div class="follow-image">
                                <img src="image/image_1.png" class="img1">
                                <img src="image/image_2.png" class="img2">
                                <img src="image/image_3.png" class="img2">
                              </div>
                              <h6>Current Task</h6>
                              <div class="current-task">
                                <img src="image/image_1.png">
                                <a href="javascript:void(0)"> David</a>
                              </div>

                            </div>


                          </div>
                          <hr>
                          <h6 class="mb-0">
                            <a data-toggle="collapse" class="recent-activity" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
                              Recent Activity
                            </a>
                          </h6>
                        </div>

                        <div id="collapse-3" class="collapse" role="tabpanel" aria-labelledby="heading-1" data-parent="#accordion">
                          <div class="card-body">
                            <div class="row">
                              <div class="col-12">
                                <div class="recent-label">
                                  <p class="mb-0"><span class="recent-label-span"> Sarah Musk </span> has added task </p>
                                  <p> “Client Begins Process</p>

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>


                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
      <style>
        #complete .accordion .card {
          background: #D3D6DD !important;
        }
      </style>
      <div class="footer-wrapper">
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between text-center">
            <span class="text-center text-sm-left d-block d-sm-inline-block">© 2021 Reva - All Rights Reserved. </span>
          </div>
        </footer>
      </div>
    </div>
  </div>

  <!-- </div>  -->

  <script src="vendors/base/vendor.bundle.base.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <script src="js/tabs.js"></script>
  <script>
    $('#toggale-btn').click(function(e) {
      e.preventDefault();
      e.stopPropagation();
      $('#sidebar').css('display', 'block');

    })
  </script>
</body>

</html>