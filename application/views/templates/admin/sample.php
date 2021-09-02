<script>
    function change_pagination() {
        if ( $('.et_pb_gallery_pagination .page .page-1').hasClass('active')) {
            $('.et_pb_gallery_pagination .next').hide();
            $('.et_pb_gallery_pagination .prev').show();

            ////step 2
            $('.et_pb_gallery_pagination .page .page-1').removeClass('active');
            $('.et_pb_gallery_pagination .page .page-2').addClass('active');

            ///step 3
            $('.et_pb_gallery_item_0_0').hide();
            $('.et_pb_gallery_item_0_0').removeClass('first_in_row');
            $('.et_pb_gallery_item_0_1').hide();
            $('.et_pb_gallery_item_0_1').removeClass('last_in_row');

            ///step 4
            $('.et_pb_gallery_item_0_2').show();
            $('.et_pb_gallery_item_0_2').addClass('first_in_row');
            $('.et_pb_gallery_item_0_3').show();
            $('.et_pb_gallery_item_0_3').addClass('last_in_row');
        } else {
            $('.et_pb_gallery_pagination .prev').hide();
            $('.et_pb_gallery_pagination .next').show();

            ////step 2
            $('.et_pb_gallery_pagination .page .page-2').removeClass('active');
            $('.et_pb_gallery_pagination .page .page-1').addClass('active');

            ///step 3
            $('.et_pb_gallery_item_0_2').hide();
            $('.et_pb_gallery_item_0_2').removeClass('first_in_row');
            $('.et_pb_gallery_item_0_3').hide();
            $('.et_pb_gallery_item_0_3').removeClass('last_in_row');

            ///step 4
            $('.et_pb_gallery_item_0_0').show();
            $('.et_pb_gallery_item_0_0').addClass('first_in_row');
            $('.et_pb_gallery_item_0_1').show();
            $('.et_pb_gallery_item_0_1').addClass('last_in_row');

        }
    }
</script>