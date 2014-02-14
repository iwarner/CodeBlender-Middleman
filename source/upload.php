<?php
/**
 * Dropzone Upload Files
 *
 * Usage
 * sudo php -S localhost:8080
 *
 * @author Ian Warner <ian.warner@drykiss.com>
 * @see    http://www.w3schools.com/PHP/php_file_upload.asp
 */

// Access Control
header( 'Access-Control-Allow-Origin      : *' );
header( 'Access-Control-Allow-Methods     : GET, PUT, POST, DELETE, OPTIONS' );
header( 'Access-Control-Max-Age           : 1000' );
header( 'Access-Control-Allow-Credentials : true' );
header( 'Access-Control-Allow-Headers     : X-Requested-With, Cache-Control, Content-Type, Content-Range, Content-Disposition, Content-Description' );

$ds          = DIRECTORY_SEPARATOR;
$storeFolder = '/uploads';

// Set Max File Size allowed
ini_set( 'post_max_size',       '10M' );
ini_set( 'upload_max_filesize', '10M' );

// Check that FILES exist
if ( ! empty( $_FILES ) ) {

    $tempFile   = $_FILES[ 'file' ][ 'tmp_name' ];
    $targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds;
    $targetFile = $targetPath . $_FILES[ 'file' ][ 'name' ];

    // Move file to the Uploads folder
    move_uploaded_file( $tempFile, $targetFile );

}