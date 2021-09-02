<!-- include summernote css/js -->

<script src="<?php echo base_url('assets/js/tinymce.min.js') ?>"></script>
<style>
  .tox-tinymce {
    border: none !important;
    border-radius: 10px !important;
    color: red !important;
  }

  .tox-edit-area iframe .mce-content-body {
    color: #495057 !important;
  }

  .tox-tinymce:not(.tox-tinymce-inline) .tox-editor-header:not(:first-child) .tox-toolbar-overlord:first-child .tox-toolbar__primary {
    border-top: none !important;
  }
</style>

<!-- ////textarea -->
<!-- <textarea id="mytextarea" name="description"><?php echo (isset($deal) && !empty($deal)) ? br2nl($deal[0]->description) : '' ?></textarea> -->
<textarea id="mytextarea" name="description"><?php echo (isset($deal) && !empty($deal)) ? $deal[0]->description : '' ?></textarea>

<script>
  tinymce.init({
    selector: "#mytextarea",
    plugins: "emoticons",
    toolbar: "emoticons",
    toolbar_location: "bottom",
    placeholder: "Enter Description",
    menubar: false,
    height: 130,
    statusbar: false,
    // remove_linebreaks : false,
  });
</script>