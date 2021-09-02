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

<script src="<?php echo base_url('assets/') ?>js/off-canvas.js"></script>
<script src="<?php echo base_url('assets/') ?>js/hoverable-collapse.js"></script>
<script src="<?php echo base_url('assets/') ?>js/template.js"></script>
<script src="<?php echo base_url('assets/') ?>js/settings.js"></script>
<script src="<?php echo base_url('assets/') ?>js/todolist.js"></script>
<script src="<?php echo base_url('assets/') ?>js/tabs.js"></script>
 <script>
  $('#toggale-btn').click(function(e) {
    e.preventDefault();
    e.stopPropagation();
    $('#sidebar').css('display', 'block');

  })
</script>

<div class="loader">
  <!-- Place at bottom of page -->
</div>
<!-- <script>
  $body = $("body");
  $(document).on({
    ajaxStart: function() {
      $body.addClass("loading");
    },
    ajaxStop: function() {
      $body.removeClass("loading");
    }
  });
</script> -->

<script>
  
  ///script 2
  $('form input').on('keypress', function(e) {
    return e.which !== 13;
  });

  $(document).ready(function() {
    try {
      $("input[type='text']").each(function() {
        $(this).attr("autocomplete", "off");
      });
    } catch (e) {}
  });


 
</script>

<!-- ///socket -->
<?php $this->load->view('socket') ?>



</body>



</html>