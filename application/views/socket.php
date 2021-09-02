<script src="http://147.182.133.75:3000/socket.io/socket.io.js"></script>
<!-- <script src="https://cdn.socket.io/4.1.2/socket.io.min.js"></script> -->

<script>
    //Connection
    let socket = io("http://147.182.133.75:3000/", {
        query: {
            user_id: "<?php echo $_SESSION['user_id'] ?>",
            user_name: "<?php echo $_SESSION['user_name'] ?>",
            email: "<?php echo $_SESSION['email'] ?>",
            email_encrypt: "<?php echo $_SESSION['email_encrypt'] ?>",
        },
    });
    let access_token = '';


    // Listeners 
    socket.on("connect", (data) => {

        ///1: check connection
        console.log("socket connected");

        ///2: get access token
        socket.on("on_access_token", (data) => {
            access_token = data.socket_access_token;
        });



    });


    //receive any event 
    socket.on("on_any_event", (response) => {
        console.log('sms received');
    })






    ///register room code
    function register_room(room_id) {
        if (access_token) {
            var room_json = {
                rooms: [room_id],
                socket_access_token: access_token
            };
            var myJSON = JSON.stringify(room_json);

            socket.emit("register_rooms", room_json, (response) => {
                console.log(response);
            });
        }

    }

    ///send group message
    function send_group_message(deal_id, room_id, message_content, message_type = "text") {

        if (access_token) {
            var group_json = {
                "type": "group",
                "deal_id": deal_id,
                "room": room_id,
                "socket_access_token": access_token,
                "message_content": message_content,
                "message_type": message_type,
            };

            socket.emit("send_group_message", group_json, (response) => {

                ///code date
                const d = new Date();
                let month = d.getMonth()+1;
                let day = d.getDate();
                let year = d.getFullYear();
                if(month < 10)
                {
                    month = '0' + month;
                }

                if(day < 10)
                {
                    day = '0' + day;
                }
                let date = month + '/' + day + '/' + year ;

                $html = '';
                $html += '<div class="container-fluid chat-recieve">' +
                    '<div class="row content-1">' +
                    ' <div class="col-lg-4 col-md-4 col-xs-12 offset-md-8 offset-lg-8 content-1-1">' +
                    '<p>' + message_content + '</p>' +
                    '<span>' + date + ' at ' + d.toLocaleTimeString().replace(/:\d+ /, ' ') + '</span>' +
                    '</div> </div>  </div>';
                $('#messages').append($html);
                $('#message_content').val('');
                $('#sbmit-btn').attr('disabled', true);
                $('.chat-typing .content-1 .content-1-2').css('background', '#3a8bc1');

            });
        }


    }


    socket.on("disconnect", () => {
        console.log("socket disconnected");
        $(".chat-disconnect").attr("disabled", true);
    });
</script>