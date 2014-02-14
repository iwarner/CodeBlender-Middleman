<?php
/**
 * Stripe Charge PHP Script
 *
 * Usage
 * sudo php -S localhost:8080
 *
 * @author Ian Warner <ian.warner@drykiss.com>
 * @see    http://www.php.net/manual/en/features.commandline.webserver.php
 * @todo   Make sure the access headers are correct
 * @todo   Need to pass Quantity / Cost and
 * @todo   Return JSON onlye
 */

// stdClass Object
// (
//     [id] => tok_103SVI2pDAq0xyYQpTG4jLaD
//     [livemode] =>
//     [created] => 1391862781
//     [used] =>
//     [object] => token
//     [type] => card
//     [card] => stdClass Object
//         (
//             [id] => card_103SVI2pDAq0xyYQZ2yfCWiZ
//             [object] => card
//             [last4] => 4242
//             [type] => Visa
//             [exp_month] => 1
//             [exp_year] => 2017
//             [fingerprint] => pA8Co9n7kqGVRi3k
//             [customer] =>
//             [country] => US
//             [name] => ian.warner@drykiss.com
//             [address_line1] =>
//             [address_line2] =>
//             [address_city] =>
//             [address_state] =>
//             [address_zip] =>
//             [address_country] =>
//         )
//     [email] => ian.warner@drykiss.com
// )

// Access Control
header( 'Access-Control-Allow-Origin      : *' );
header( 'Access-Control-Allow-Methods     : GET, PUT, POST, DELETE, OPTIONS' );
header( 'Access-Control-Max-Age           : 1000' );
header( 'Access-Control-Allow-Credentials : true' );
header( 'Access-Control-Allow-Headers     : Content-Type, Content-Range, Content-Disposition, Content-Description' );

// Instantiate Stripe
require_once( '../vendor/stripe/stripe-php/lib/Stripe.php' );

// Request
$request = file_get_contents( 'php://input' );

// JSON Decode this
$json = json_decode( $request );

// Output
// echo '<pre>'; print_r( $json ); echo '</pre>';
// echo '<pre>'; print_r( $request ); echo '</pre>';
// echo '<pre>'; print_r( $json->token->id ); echo '</pre>';
// echo '<pre>'; print_r( $json->token->email ); echo '</pre>';

// Authenticate
$auth = Stripe::setApiKey( "sk_test_F9MRRsNJHZQcSY7TtQ4N7eOg" );

// Send Token to Stripe
try {

    $charge = Stripe_Charge::create( array(
        "amount"   => $json->details->amount,
        "currency" => strtolower( $json->details->currency ),
        "card"     => $json->token->id,
        "metadata" => array(
            "email" => $json->token->email
            )
        ));

} catch( Stripe_CardError $e ) {

    // The card has been declined
    // echo '<pre>'; print_r( $e ); echo '</pre>';
}

// echo '<pre>'; print_r( $charge ); echo '</pre>';

// List all Charges
$charges = Stripe_Charge::all( );
// echo '<pre>'; print_r( $charges ); echo '</pre>';

// List Customers
$customers = Stripe_Customer::all();
// echo '<pre>'; print_r( $customers ); echo '</pre>';

echo json_encode( "success" );