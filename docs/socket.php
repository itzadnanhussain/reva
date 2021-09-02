<script src="http://147.182.133.75:3000/socket.io/socket.io.js"></script>
<!-- <script src="https://cdn.socket.io/4.1.2/socket.io.min.js"></script> -->

<script>
    //Connection
    const socket = io("http://147.182.133.75:3000/", {
        query: {
            user_id: "<?php echo $_SESSION['user_id'] ?>",
            user_name: "<?php echo $_SESSION['user_name'] ?>",
            email: "<?php echo $_SESSION['email'] ?>",
            email_encrypt: "<?php echo $_SESSION['email_encrypt'] ?>",
        },
    });

    // Emitters 
    // send_group_message
    /*socket.emit("send_group_message", "", (response) => {
        //   console.log("Callback function(Ack)");
        console.log(response);
    })*/

    // Listeners 
    socket.on("connect", (data) => {

        ///1: check connection
        console.log("socket connected");

        ///2: get access token
        // socket.on("on_access_token", (data) => {
        //     var access_token = data.socket_access_token;

        //     ///3: register room 
        //     // var room_json = {
        //     //     rooms: ["cd74bddc-d4f2-11eb-8eef-2a611a1df0d8"],
        //     //     socket_access_token: access_token
        //     // };

        //     // var myJSON = JSON.stringify(room_json);
        //     // socket.emit("register_rooms", room_json, (response) => {
        //     //     console.log(response);

        //     //     ///4: send group message
        //     //     var group_json = {
        //     //         "type": "group",
        //     //         "deal_id": "60df594c0a872e0c8a58c86e74",
        //     //         "room": "cd74bddc-d4f2-11eb-8eef-2a611a1df0d8",
        //     //         "socket_access_token": access_token,
        //     //         "message_content": "Shaoor send message",
        //     //         "message_type": "text"
        //     //     };

        //     //     // register_room
        //     //     socket.emit("send_group_message", group_json, (response) => {
        //     //         console.log(response);
        //     //     });
        //     // });


        // });
    });



    ///register room code
    function register_room(room_id) { 

        const socket = io("http://147.182.133.75:3000/", {
            query: {
                user_id: "<?php echo $_SESSION['user_id'] ?>",
                user_name: "<?php echo $_SESSION['user_name'] ?>",
                email: "<?php echo $_SESSION['email'] ?>",
                email_encrypt: "<?php echo $_SESSION['email_encrypt'] ?>",
            },
        });
        // Listeners 
        socket.on("connect", (data) => {
            ///1: check connection
            console.log("socket connected");
            ///2: get access token
            socket.on("on_access_token", (data) => {
                var access_token = data.socket_access_token;
                ///3: register room 
                var room_json = {
                    rooms: [room_id],
                    socket_access_token: access_token
                };
                console.log(room_json);

                var myJSON = JSON.stringify(room_json);
                socket.emit("register_rooms", room_json, (response) => {
                    console.log(response);
                });


            });
        });
    }


    function send_group_message(deal_id,room_id,message_content,message_type = "text")
    {
        const socket = io("http://147.182.133.75:3000/", {
            query: {
                user_id: "<?php echo $_SESSION['user_id'] ?>",
                user_name: "<?php echo $_SESSION['user_name'] ?>",
                email: "<?php echo $_SESSION['email'] ?>",
                email_encrypt: "<?php echo $_SESSION['email_encrypt'] ?>",
            },
        });
        // Listeners 
        socket.on("connect", (data) => {
            ///1: check connection
            console.log("socket connected");
            ///2: get access token
            socket.on("on_access_token", (data) => {
                var access_token = data.socket_access_token;  
                ///4: send group message
                var group_json = {
                    "type": "group",
                    "deal_id": deal_id,
                    "room": room_id,
                    "socket_access_token": access_token,
                    "message_content": message_content,
                    "message_type": message_type,
                };

                // send_group_message
                socket.emit("send_group_message", group_json, (response) => {
                    $html = '';
                    $html += '<div class="container-fluid chat-recieve">'+
                    '<div class="row content-1">'+
                    ' <div class="col-lg-4 col-md-4 col-xs-12 offset-md-8 offset-lg-8 content-1-1">' +
                    '<p>' + message_content + '</p>' +
                    '<span>' + new Date().toLocaleTimeString() + '</span>' +
                    '</div> </div>  </div>';
                    $('#messages').append($html);
                    $('#message_content').val(''); 
                            
                });
                


            });
        });

    }


    socket.on("disconnect", () => {
        console.log("socket disconnected");
        $(".chat-disconnect").attr("disabled", true);
    });
</script>