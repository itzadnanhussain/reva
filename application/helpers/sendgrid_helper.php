<?php defined('BASEPATH') or exit('No direct script access allowed');


///Hello Mail
if (!function_exists('HelloMail')) {
    function HelloMail()
    {
        require_once APPPATH . "libraries/sendgrid-php/sendgrid-php.php";
        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("test@example.com", "Example User");
        $email->setSubject("Sending with Twilio SendGrid is Fun");
        $email->addTo("test@example.com", "Example User");
        $email->addContent("text/plain", "and easy to do anywhere, even with PHP");
        $email->addContent(
            "text/html",
            "<strong>and easy to do anywhere, even with PHP</strong>"
        );
        $sendgrid = new \SendGrid(getenv('SENDGRID_API_KEY'));
        ///new code
        // $response = $sendgrid->send($email); 
        // if ($response->statusCode() == 200) {
        //     return 1;
        // } else {
        //     return 0;
        // }
        // ///
        try {
            $response = $sendgrid->send($email);  
            print $response->statusCode() . "\n";
            print_r($response->headers());
            print $response->body() . "\n";
        } catch (Exception $e) { 
            echo 'Caught exception: ' . $e->getMessage() . "\n";
        }

    }
}
