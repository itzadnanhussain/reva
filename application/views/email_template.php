 <!DOCTYPE html>
 <html lang="en">

 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <style>
         .main-box {
             margin: 20px;
             padding: 50px;
             width: 550px;
             border-radius: 20px;
             position: relative; 
             /* background-image: repeating-linear-gradient(yellow 30%, green 40%); */
             background-image: url("https://reva.foundersapproach.org/assets/image/zdsgvs_4.png") , url("https://reva.foundersapproach.org/assets/image/zdsgvs_3.png");
             background-repeat: no-repeat, repeat;
             background-color: #cccccc;
         }

         .box {
             background: #FFFFFF;
             box-shadow: 0px 5px 36px 0px rgba(144, 164, 183, 0.22);
             border-radius: 40px;
             height: 492px;
             width: 510px;
             text-align: center;
             padding: 20px;
             
             /* border: 1px solid #005996; */
         }

         .box>.h3 {
             font-weight: bold;
             font-size: 20px;
             line-height: 24px;
             color: #005996;
             display: block;
             margin-top: 60px;
             margin-bottom: 5px;
         }

         .box>.p {
             font-weight: normal;
             font-size: 14px;
             line-height: 20px;
             /* or 143% */
             text-align: center;
             color: #576E7F;
         }

         .box>.btn {
             background: #005996;
             box-shadow: 0px 6px 36px rgba(0, 89, 150, 0.22);
             border-radius: 10px;
             color: white;
             text-decoration: none;
             padding: 10px 15px;
             margin: 60px auto;
             display: block;
             width: 150px;
             text-align: center;
         }

         .logo {
             margin-left: auto;
             margin-right: auto;
             margin-bottom: -50px;
             display: block;

         }

         .email {
             margin: 40px auto 20px auto;
             color: #D3D6DD;
             display: block;
         }
     </style>
 </head>

 <body class="body">
     <div class="main-box">

         <div class="box">
             <img src="https://reva.foundersapproach.org/assets/image/logo_large.png" class="logo" alt="">
             <!-- <img class="email" src="https://reva.foundersapproach.org/assets/image/email.png" alt=""> -->

             <h3 class="h3">Welcome to Reva</h3>
             <p class="p"><?php echo $_SESSION['name'] ?> has invited you to be a part of the deal for <q> <?php echo $deal ?> - <?php echo $address ?> </q> . Sign up to see more details about this deal
             </p>
             <a href="<?php echo $link ?>" class="btn">Register Now</a>
         </div>
     </div>

 </body>

 </html>