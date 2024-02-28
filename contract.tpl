<?php /* ##########################
registrar@registrar.com
registry@registry.com
data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA3EAAAETCAYAAACY1480AAAAAXNSR0IArs4c6QAAIABJREFUeF7t3V2IZOeZGOD31DjggJdowQEZZCSBA3ZysTLshQwSGkECG3IhQ2wsswRpWHdVD2GxDBLrmyCJYFhhXUgXwV3VaySRCzvYsDZLWC8kaIQFNoTEysWyBi94TAQSRCCBBatgTZ3odE3N1M+p7vqv833nKTCW1afO+d7n/bpdb31/RXgRIECAAAECBAgQIECAQDICRTIt1VACBAgQIECAAAECBAgQCEWcTkCAAAECBAgQIECAAIGEBBRxCSVLUwkQIECAAAECBAgQIKCI0wcIECBAgAABAgQIECCQkIAiLqFkaSoBAgQIECBAgAABAgQUcfoAAQIECBAgQIAAAQIEEhJQxCWULE0lQIAAAQIECBAgQICAIk4fIECAAAECBAgQIECAQEICiriEkqWpBAgQIECAAAECBAgQUMTpAwQIECBAgAABAgQIEEhIQBGXULI0lQABAgQIECBAgAABAoo4fYAAAQIECBAgQIAAAQIJCSjiEkqWphIgQIAAAQIECBAgQEARpw8QIECAAAECBAgQIEAgIQFFXELJ0lQCBAgQIECAAAECBAgo4vQBAgQIECBAgAABAgQIJCSgiEsoWZpKgAABAgQIECBAgAABRZw+QIAAAQIECBAgQIAAgYQEFHEJJUtTCRAgQIAAAQIECBAgoIjTBwgQIECAAAECBAgQIJCQgCIuoWRpKgECBAgQIECAAAECBBRx+gABAgQIECBAgAABAgQSElDEJZQsTSVAgAABAgQIECBAgIAiTh8gQIAAAQIECBAgQIBAQgKKuISSpakECBAgQIAAAQIECBBQxOkDBAgQIECAAAECBAgQSEhAEZdQsjSVAAECBAgQIECAAAECijh9gAABAgQIECBAgAABAgkJKOISSpamEiBAgAABAgQIECBAQBGnDxAgQIAAAQIECBAgQCAhAUVcQsnSVAIECBAgQIAAAQIECCji9AECBAgQIECAAAECBAgkJKCISyhZmkqAAAECBAgQIECAAAFFnD5AgAABAgQIECBAgACBhAQUcQklS1MJECBAgAABAgQIECCgiNMHCBAgQIAAAQIECBAgkJCAIi6hZGkqAQIECBAgQIAAAQIEFHH6AAECBAgQIECAAAECBBISUMQl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EwIECDReQBHX+BRpIAECBAgQ2KHA6NDvV29NqVTE7RDbrQkQILAdAUXcdhzdhQABAgQIpCtQ7VJZFo9FUb5iKmW6adRyAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYCirgMkigEAgQIECBAgAABAgTaI6CIa0+uRUqAAAECBAgQIECAQAYC/x+ilZjI2aiHbgAAAABJRU5ErkJggg==
1.2.3.4
February 28, 2024 at 12:19:30 PM GMT+2
-120
Registry Sign
Registrar Sign
###################################

1. The 2nd and 3rd lines above are the emails read by this PHP script from itself (used below as $lines[1] and $lines[2] respectively). 

2. The 4th line ($lines[3] below) is the data for $DEV_SIGNATURE.

3. The $CLIENT_SIGNATURE is received by this script from itself when second person signs the contract.
*/

$phpName  = basename($_SERVER['PHP_SELF']) ? basename($_SERVER['PHP_SELF']) : 'index.php';
$fileName = substr($phpName , 0, -4);
$htmlName = $fileName.'.html';

// If the filename is (or starts with) "test" or "demo" the PHP file won't delete itself, nor will it redirect to the HTML contract (when one exists)
if ( substr($fileName,0,4) == 'test' || substr($fileName,0,4) == 'demo' ) { 
  $selfDelete = 0; 
}
else { 
  $selfDelete = 1; 
}

$lines = file(__FILE__);

$clientEmail   = format($lines[1]);
$devEmail      = format($lines[2]);
$DEV_SIGNATURE = format($lines[3]);
$devIP         = format($lines[4]);
$devTimestamp  = format($lines[5]);
$devTimeOffset = format($lines[6]);
$devName       = format($lines[7]);
$clientName    = format($lines[8]);

// Trim and ignore [placeholders]
function format($text) {
  $text = trim($text);
  $firstChar = substr($text, 0, 1);
  $lastChar = substr($text, -1, 1);
  if ($firstChar == '[' && $lastChar == ']')
    return '';
  else
    return $text;
}

// Gets the current file URL and replaces the .php extension with .html
function getHtmlUrl() {
  $url  = @( $_SERVER["HTTPS"] != 'on' ) ? 'http://'.$_SERVER["SERVER_NAME"] :  'https://'.$_SERVER["SERVER_NAME"];
  $url .= ( $_SERVER["SERVER_PORT"] !== 80 ) ? ":".$_SERVER["SERVER_PORT"] : "";
  $url .= $_SERVER["REQUEST_URI"];
  $url = substr($url,0,-4) . '.html';
  return $url;
}

/**
The HTML code (and some PHP) is kept in PHP variables like $CONTRACT_HTML, $FOOTER, $CONTRACT_SIGNED_PHP, and $CLIENT_DATE_IP_COMPILED.
**/

// This gets executed when Client signs; 
// the functions are used in $CLIENT_DATE_IP_PHP
$CONTRACT_SIGNED_PHP = '
  $phpName  = basename($_SERVER["PHP_SELF"]) ? basename($_SERVER["PHP_SELF"]) : "index.php";
  $fileName = substr($phpName , 0, -4);
  $htmlName = $fileName.".html";
  $pdfName = $fileName.".pdf";

  // Function to get the client IP address
  function get_client_ip_env() {
    $ipaddress = "";
    if (getenv("HTTP_CLIENT_IP"))
      $ipaddress = getenv("HTTP_CLIENT_IP");
    else if(getenv("HTTP_X_FORWARDED_FOR"))
      $ipaddress = getenv("HTTP_X_FORWARDED_FOR");
    else if(getenv("HTTP_X_FORWARDED"))
      $ipaddress = getenv("HTTP_X_FORWARDED");
    else if(getenv("HTTP_FORWARDED_FOR"))
      $ipaddress = getenv("HTTP_FORWARDED_FOR");
    else if(getenv("HTTP_FORWARDED"))
      $ipaddress = getenv("HTTP_FORWARDED");
    else if(getenv("REMOTE_ADDR"))
      $ipaddress = getenv("REMOTE_ADDR");
    else
      $ipaddress = "UNKNOWN";
    return $ipaddress;
  } 
  // Function to get the client date converted to the same GMT as the dev date
  function get_client_date($receivedOffset) {
      //$receivedOffset comes negative and in minutes, eg: -120 for GMT+2
      $offset = -1 * $receivedOffset / 60; // GMT offset
      $is_DST = FALSE; // observing daylight savings?
      $timezone_name = timezone_name_from_abbr("", $offset * 3600, $is_DST);
      date_default_timezone_set($timezone_name);

      return date("F j, Y") ." at ". date("g:i:s A") ." GMT" . sprintf("%+d", $offset);
  }
  ?>';


$CONTRACT_HTML='
  <h1>Contract for Domain Registrar Accreditation</h1><p>This Agreement is entered into on [Date] by and between <strong>[Registry Name]</strong>, herein referred to as "Registry," whose principal place of business is [Registry Address], and <strong>[Registrar Name]</strong>, herein referred to as "Registrar," whose principal place of business is [Registrar Address].</p><h2>Recitals</h2><p>The Registry is the authorized entity managing the top-level domain (TLD) [.TLD] and is responsible for maintaining the domain name registry for said TLD.</p><p>The Registrar wishes to be accredited by the Registry to register domain names within the TLD managed by the Registry for third parties.</p><p>The parties desire to set forth the terms and conditions under which the Registrar will be accredited to register domain names in the TLD.</p><h2>I. ACCREDITATION</h2><p>Subject to the terms and conditions of this Agreement, the Registry hereby accredits the Registrar to act as an official registrar for the TLD.</p><h2>II. REGISTRAR OBLIGATIONS</h2><p><strong style="color: rgb(13, 13, 13);">2.1 Compliance:</strong><span style="color: rgb(13, 13, 13);"> The Registrar shall comply with all applicable laws, regulations, and policies set forth by ICANN and the Registry, including data protection and privacy laws.</span></p><p><strong style="color: rgb(13, 13, 13);">2.2 Technical Requirements:</strong><span style="color: rgb(13, 13, 13);"> The Registrar shall maintain the technical capability to interface with the Registry\'s systems for the registration and management of domain names, including the implementation of any required security measures.</span></p><p><strong style="color: rgb(13, 13, 13);">2.3 Customer Service:</strong><span style="color: rgb(13, 13, 13);"> The Registrar commits to providing high-quality customer service to domain name holders, including timely response to inquiries and efficient resolution of disputes.</span></p><h2>III. REGISTRY OBLIGATIONS</h2><p><strong style="color: rgb(13, 13, 13);">3.1 Access to Registry System:</strong><span style="color: rgb(13, 13, 13);"> The Registry shall provide the Registrar with access to its domain name registration systems, including necessary APIs and protocols.</span></p><p><strong style="color: rgb(13, 13, 13);">3.2 Support:</strong><span style="color: rgb(13, 13, 13);"> The Registry shall offer technical and administrative support to the Registrar to facilitate the registration and management of domain names.</span></p><p><strong style="color: rgb(13, 13, 13);">3.3 Updates:</strong><span style="color: rgb(13, 13, 13);"> The Registry will inform the Registrar of any changes to policies, systems, or fees with reasonable notice.</span></p><h2>IV. FINANCIAL TERMS</h2><p><strong style="color: rgb(13, 13, 13);">4.1 Fees:</strong><span style="color: rgb(13, 13, 13);"> The Registrar shall pay the Registry specified fees for domain name registrations, renewals, and transfers. These fees may be subject to change upon notice from the Registry.</span></p><p><strong style="color: rgb(13, 13, 13);">4.2 Payment Terms:</strong><span style="color: rgb(13, 13, 13);"> Payments shall be made according to the schedule and methods agreed upon by both parties. Late payments may incur penalties or interest charges.</span></p><h2>V. INTELLECTUAL PROPERTY RIGHTS</h2><p><span style="color: rgb(13, 13, 13);">The Registrar acknowledges the Registry\'s ownership of all rights, title, and interest in and to the TLD and the Registry database. The Registrar is granted a non-exclusive, non-transferable right to use the TLD in accordance with the terms of this Agreement.</span></p><h2>VI. TERMS AND TERMINATION</h2><p><strong style="color: rgb(13, 13, 13);">6.1 Effective Date and Term:</strong><span style="color: rgb(13, 13, 13);"> This Agreement shall commence on [Start Date] and continue for a period of [Term], unless terminated earlier as per this Agreement\'s provisions.</span></p><p><strong style="color: rgb(13, 13, 13);">6.2 Termination for Cause:</strong><span style="color: rgb(13, 13, 13);"> Either party may terminate this Agreement if the other party materially breaches any term or condition and fails to cure such breach within [Number of Days] days after receiving written notice.</span></p><p><strong style="color: rgb(13, 13, 13);">6.3 Effects of Termination:</strong><span style="color: rgb(13, 13, 13);"> Upon termination, the Registrar shall cease to use any materials or access provided by the Registry and return any confidential information.</span></p><h2><span style="color: rgb(13, 13, 13);">VII. LIMITATION OF LIABILITY</span></h2><p><span style="color: rgb(13, 13, 13);">Neither party shall be liable for any indirect, special, incidental, or consequential damages arising out of or related to this Agreement.</span></p><h2>VIII. CONFIDENTIALITY</h2><p><span style="color: rgb(13, 13, 13);">Both parties agree to maintain the confidentiality of any proprietary or confidential information shared during the term of this Agreement and for [Number of Years] years thereafter.</span></p><h2>IX. DISPUTE RESOLUTION</h2><p><span style="color: rgb(13, 13, 13);">Any disputes arising out of or related to this Agreement shall be resolved through arbitration in accordance with the Rules of Arbitration of [Arbitration Association], by one or more arbitrators appointed in accordance with said rules.</span></p><h2>X. GENERAL PROVISIONS</h2><p><strong>10.1 </strong><strong style="color: var(--tw-prose-bold);">Governing Law</strong><strong>:</strong> This Agreement shall be governed by and construed in accordance with the laws of [Jurisdiction].</p><p><strong>10.2 </strong><strong style="color: var(--tw-prose-bold);">Amendments</strong><strong>:</strong> No amendment, change, or modification of this Agreement shall be valid unless in writing signed by both parties.</p><p><strong>10.3 </strong><strong style="color: var(--tw-prose-bold);">Entire Agreement</strong><strong>:</strong> This Agreement constitutes the entire agreement between the parties with respect to the subject matter hereof and supersedes all prior agreements or understandings, whether written or oral.</p><p>IN WITNESS WHEREOF, the parties hereto have executed this Agreement as of the Effective Date first above written.</p>
';


$DEV_SIGNATURE = '<img id="dev_signature" src="' . $DEV_SIGNATURE . '" >';

$CLIENT_SIGNATURE = isset($_POST['client_signature']) ? $_POST['client_signature'] : null;
if (substr( $CLIENT_SIGNATURE, 0, 22 ) === 'data:image/png;base64,') {
    $CLIENT_SIGNATURE = '<img id="hk" src="' . htmlspecialchars($CLIENT_SIGNATURE) . '" >';
} else {
  $CLIENT_SIGNATURE = null;
}

/**
The HTML code (and some PHP) is kept in PHP variables like $CONTRACT_HTML, $FOOTER, $CONTRACT_SIGNED_PHP, and $CLIENT_DATE_IP_COMPILED.
**/

function headerWithTitle($title) {
  return '<!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8">
    <title>' . $title . '</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="robots" content="noindex">
    <link rel="preconnect" href="https://cdn.skypack.dev">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <style>@import url(https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700,400italic) layer(fonts);@import url(https://fonts.googleapis.com/css?family=Arapey) layer(fonts);@import url(https://fonts.googleapis.com/css2?family=Open+Sans:wdth,wght@75,600;100,400;100,600;100,700;100,800) layer(fonts);@layer reset, accessibility, animated-entrances, forms;@layer from-quill-editor, from-quill-editor-overrides;@layer utility;@layer signatures, buttons;@layer modal;@layer contract-typography;@layer reset{@media print{.noprint{display:none!important}}}@layer reset{*,:after,:before{box-sizing:border-box}body,figure,h1,h2,h3,h4,h5,p,picture{margin:0}h1,h2,h3,h4,h5,h6{font-weight:400}img,picture{display:block;height:auto;max-width:100%}button,input,select,textarea{font:inherit}}@layer colors{:root{--clr-light-hsl:20 80% 98%;--clr-dark-hsl:200 20% 25%;--clr-darker-hsl:200 59% 22%;--clr-primary-hsl:200 75% 30%;--clr-danger-hsl:20 100% 30%;--clr-success-hsl:165 75% 30%;--clr-warning-hsl:36 100% 30%;--clr-blue-500:#136086;--clr-blue-600:#105070;--clr-blue-700:#0d4059;--clr-red-500:#863913;--clr-red-600:#703010;--clr-red-700:#59260d;--clr-green-500:#138669;--clr-green-600:#107058;--clr-green-700:#0d5946;--clr-brown-500:#865813;--clr-brown-600:#704910;--clr-brown-700:#593b0d;--clr-blue-desaturated-500:#395360;--clr-blue-desaturated-600:#263740;--clr-blue-desaturated-700:#131c20;--clr-red-desaturated-500:#604639;--clr-red-desaturated-600:#402f26;--clr-red-desaturated-700:#201713;--clr-green-desaturated-500:#396056;--clr-green-desaturated-600:#264039;--clr-green-desaturated-700:#13201d;--clr-brown-desaturated-500:#605039;--clr-brown-desaturated-600:#403626;--clr-brown-desaturated-700:#201b13}}@layer from-quill-editor{.ql-editor blockquote,.ql-editor h1,.ql-editor h2,.ql-editor h3,.ql-editor h4,.ql-editor h5,.ql-editor h6,.ql-editor ol,.ql-editor p,.ql-editor pre,.ql-editor ul{counter-reset:list-1 list-2 list-3 list-4 list-5 list-6 list-7 list-8 list-9}.ql-editor ol,.ql-editor ul{padding-left:1.5em}.ql-editor ol>li,.ql-editor ul>li{list-style-type:none}.ql-editor ul>li:before{content:"\2022"}.ql-editor li:before{display:inline-block;white-space:nowrap;width:1.2em}.ql-editor li:not(.ql-direction-rtl):before{margin-left:-1.5em;margin-right:.3em;text-align:right}.ql-editor li.ql-direction-rtl:before{margin-left:.3em;margin-right:-1.5em}.ql-editor ol li:not(.ql-direction-rtl),.ql-editor ul li:not(.ql-direction-rtl){padding-left:1.5em}.ql-editor ol li.ql-direction-rtl,.ql-editor ul li.ql-direction-rtl{padding-right:1.5em}.ql-editor ol li{counter-increment:list-0;counter-reset:list-1 list-2 list-3 list-4 list-5 list-6 list-7 list-8 list-9}.ql-editor ol li:before{content:counter(list-0,decimal) ". "}.ql-editor ol li.ql-indent-1{counter-increment:list-1}.ql-editor ol li.ql-indent-1:before{content:counter(list-1,lower-alpha) ". "}.ql-editor ol li.ql-indent-1{counter-reset:list-2 list-3 list-4 list-5 list-6 list-7 list-8 list-9}.ql-editor ol li.ql-indent-2{counter-increment:list-2}.ql-editor ol li.ql-indent-2:before{content:counter(list-2,lower-roman) ". "}.ql-editor ol li.ql-indent-2{counter-reset:list-3 list-4 list-5 list-6 list-7 list-8 list-9}.ql-editor ol li.ql-indent-3{counter-increment:list-3}.ql-editor ol li.ql-indent-3:before{content:counter(list-3,decimal) ". "}.ql-editor ol li.ql-indent-3{counter-reset:list-4 list-5 list-6 list-7 list-8 list-9}.ql-editor ol li.ql-indent-4{counter-increment:list-4}.ql-editor ol li.ql-indent-4:before{content:counter(list-4,lower-alpha) ". "}.ql-editor ol li.ql-indent-4{counter-reset:list-5 list-6 list-7 list-8 list-9}.ql-editor ol li.ql-indent-5{counter-increment:list-5}.ql-editor ol li.ql-indent-5:before{content:counter(list-5,lower-roman) ". "}.ql-editor ol li.ql-indent-5{counter-reset:list-6 list-7 list-8 list-9}.ql-editor ol li.ql-indent-6{counter-increment:list-6}.ql-editor ol li.ql-indent-6:before{content:counter(list-6,decimal) ". "}.ql-editor ol li.ql-indent-6{counter-reset:list-7 list-8 list-9}.ql-editor ol li.ql-indent-7{counter-increment:list-7}.ql-editor ol li.ql-indent-7:before{content:counter(list-7,lower-alpha) ". "}.ql-editor ol li.ql-indent-7{counter-reset:list-8 list-9}.ql-editor ol li.ql-indent-8{counter-increment:list-8}.ql-editor ol li.ql-indent-8:before{content:counter(list-8,lower-roman) ". "}.ql-editor ol li.ql-indent-8{counter-reset:list-9}.ql-editor ol li.ql-indent-9{counter-increment:list-9}.ql-editor ol li.ql-indent-9:before{content:counter(list-9,decimal) ". "}.ql-editor .ql-indent-1:not(.ql-direction-rtl){padding-left:3em}.ql-editor li.ql-indent-1:not(.ql-direction-rtl){padding-left:4.5em}.ql-editor .ql-indent-1.ql-direction-rtl.ql-align-right{padding-right:3em}.ql-editor li.ql-indent-1.ql-direction-rtl.ql-align-right{padding-right:4.5em}.ql-editor .ql-indent-2:not(.ql-direction-rtl){padding-left:6em}.ql-editor li.ql-indent-2:not(.ql-direction-rtl){padding-left:7.5em}.ql-editor .ql-indent-2.ql-direction-rtl.ql-align-right{padding-right:6em}.ql-editor li.ql-indent-2.ql-direction-rtl.ql-align-right{padding-right:7.5em}.ql-editor .ql-indent-3:not(.ql-direction-rtl){padding-left:9em}.ql-editor li.ql-indent-3:not(.ql-direction-rtl){padding-left:10.5em}.ql-editor .ql-indent-3.ql-direction-rtl.ql-align-right{padding-right:9em}.ql-editor li.ql-indent-3.ql-direction-rtl.ql-align-right{padding-right:10.5em}.ql-editor .ql-indent-4:not(.ql-direction-rtl){padding-left:12em}.ql-editor li.ql-indent-4:not(.ql-direction-rtl){padding-left:13.5em}.ql-editor .ql-indent-4.ql-direction-rtl.ql-align-right{padding-right:12em}.ql-editor li.ql-indent-4.ql-direction-rtl.ql-align-right{padding-right:13.5em}.ql-editor .ql-indent-5:not(.ql-direction-rtl){padding-left:15em}.ql-editor li.ql-indent-5:not(.ql-direction-rtl){padding-left:16.5em}.ql-editor .ql-indent-5.ql-direction-rtl.ql-align-right{padding-right:15em}.ql-editor li.ql-indent-5.ql-direction-rtl.ql-align-right{padding-right:16.5em}.ql-editor .ql-indent-6:not(.ql-direction-rtl){padding-left:18em}.ql-editor li.ql-indent-6:not(.ql-direction-rtl){padding-left:19.5em}.ql-editor .ql-indent-6.ql-direction-rtl.ql-align-right{padding-right:18em}.ql-editor li.ql-indent-6.ql-direction-rtl.ql-align-right{padding-right:19.5em}.ql-editor .ql-indent-7:not(.ql-direction-rtl){padding-left:21em}.ql-editor li.ql-indent-7:not(.ql-direction-rtl){padding-left:22.5em}.ql-editor .ql-indent-7.ql-direction-rtl.ql-align-right{padding-right:21em}.ql-editor li.ql-indent-7.ql-direction-rtl.ql-align-right{padding-right:22.5em}.ql-editor .ql-indent-8:not(.ql-direction-rtl){padding-left:24em}.ql-editor li.ql-indent-8:not(.ql-direction-rtl){padding-left:25.5em}.ql-editor .ql-indent-8.ql-direction-rtl.ql-align-right{padding-right:24em}.ql-editor li.ql-indent-8.ql-direction-rtl.ql-align-right{padding-right:25.5em}.ql-editor .ql-indent-9:not(.ql-direction-rtl){padding-left:27em}.ql-editor li.ql-indent-9:not(.ql-direction-rtl){padding-left:28.5em}.ql-editor .ql-indent-9.ql-direction-rtl.ql-align-right{padding-right:27em}.ql-editor li.ql-indent-9.ql-direction-rtl.ql-align-right{padding-right:28.5em}.ql-editor .ql-align-center{text-align:center}.ql-editor .ql-align-justify{text-align:justify}.ql-editor .ql-align-right{text-align:right}}@layer from-quill-editor-overrides{.ql-editor{padding-block:1.5rem;padding-inline:2rem;padding-inline:clamp(.5rem,2.5vw,3rem);padding-inline:clamp(20px,5vw,35px)}.ql-editor>:where(:not(:first-child)){margin-block-start:var(--flow-space,1.5rem)}.ql-editor :where(ul,ol)>:where(:not(:first-child)){margin-block-start:.25rem}.ql-editor :is(ol,ul){padding:0}.ql-editor>p+:is(ul,ol){margin-block-start:.25rem}}@layer accessibility{:where(:focus-visible){outline:3px solid #000;outline-offset:3px}.sr-only{clip:rect(0,0,0,0);border:0;height:1px;margin:-1px;overflow:hidden;padding:0;position:absolute;white-space:nowrap;width:1px}.skip-to-content{background-color:hsl(var(--clr-darker-hsl));border-radius:8px;color:hsl(var(--clr-light-hsl));display:block;left:0;margin-inline:auto;margin:0 auto!important;max-width:max-content;opacity:0;outline-offset:1px;padding:.5em 1em;position:fixed;right:0;text-decoration:none;top:1.5rem;transform:translateY(calc(-100% - 5rem - 1px));transition:transform .25s ease-in;z-index:9999}.skip-to-content:hover{background-color:hsl(var(--clr-light-hsl));color:hsl(var(--clr-darker-hsl))}.skip-to-content:focus{opacity:1;transform:translateY(0)}}@layer accessibility{@media (prefers-reduced-motion:reduce){*,:after,:before{animation-duration:.1ms!important;animation-iteration-count:1!important;scroll-behavior:auto!important;transition-duration:auto!important}.animate{animation:none!important}}}@layer buttons{.button,.ql-html-buttonCancel,.ql-html-buttonOk{align-items:center;appearance:none;-webkit-appearance:none;-moz-appearance:none;background:var(--clr-500);border:none;border-radius:8px;color:#fff;cursor:pointer;display:flex;font-family:Open Sans,sans-serif;font-size:16px;font-weight:400;gap:0;justify-content:center;letter-spacing:.025em;line-height:26px;margin:0;max-width:max-content;overflow:hidden;padding:10px 35px;padding-inline:clamp(20px,5vw,35px);padding-inline:clamp(20px,2vw,35px);text-decoration:none;transition:outline .4s cubic-bezier(.22,1,.36,1);-webkit-user-select:none;user-select:none}.button:hover:not([disabled]),.ql-html-buttonCancel:hover:not([disabled]),.ql-html-buttonOk:hover:not([disabled]){background:var(--clr-600)}.button:active:not([disabled]),.ql-html-buttonCancel:active:not([disabled]),.ql-html-buttonOk:active:not([disabled]){background:var(--clr-700);transform:translate(2px 3px);transform:scale(.975);transition:transform .3s cubic-bezier(.22,1,.36,1),outline .4s cubic-bezier(.22,1,.36,1),background-color .2s linear}.button[disabled],.ql-html-buttonCancel[disabled],.ql-html-buttonOk[disabled]{cursor:default;filter:grayscale(.75) contrast(.75) brightness(.96);transition:all .4s cubic-bezier(.22,1,.36,1)}.button:has(.icon){gap:0;padding:0;place-self:center}.button:has(.icon)>*{align-items:center;align-items:space-evenly;display:inline-flex;display:flex;gap:.5ex;height:100%;justify-content:center;padding:10px 35px;padding-inline:clamp(20px,2.5vw,35px);padding-inline:clamp(20px,min(2.5vw,1.5em),35px)}.button:has(.icon) .icon{background-color:transparent;background-color:rgba(0,0,0,.16);font-size:1.5em;padding-inline:clamp(20px,min(2.5vw,1.5em),24px)}.button:has(.icon) .icon.small-padding{padding-inline:10px}.button,.ql-html-buttonCancel,.ql-html-buttonOk{--clr-500:var(--clr-blue-desaturated-500);--clr-600:var(--clr-blue-desaturated-600);--clr-700:var(--clr-blue-desaturated-700)}.button.primary,.ql-html-buttonOk{--clr-500:var(--clr-blue-500);--clr-600:var(--clr-blue-600);--clr-700:var(--clr-blue-700)}.button.danger{--clr-500:var(--clr-red-500);--clr-600:var(--clr-red-600);--clr-700:var(--clr-red-700)}.button.success{--clr-500:var(--clr-green-desaturated-500);--clr-600:var(--clr-green-desaturated-600);--clr-700:var(--clr-green-desaturated-700)}.button.warning,.ql-html-buttonCancel{--clr-500:var(--clr-red-desaturated-500);--clr-600:var(--clr-red-desaturated-600);--clr-700:var(--clr-red-desaturated-700)}.invert-colors .button{background:var(--clr-600);border:1px solid hsla(0,0%,100%,.1);filter:invert(1) hue-rotate(180deg);outline-color:#fff}.invert-colors .button:hover:not([disabled]){background:var(--clr-700)}.invert-colors .button:active:not([disabled]){background:var(--clr-500)}.invert-colors .button[disabled]{cursor:default;filter:grayscale(.75) contrast(.75) brightness(.96) invert(1) hue-rotate(180deg)}.invert-colors .button>*{background-color:rgba(0,0,0,.16)}.invert-colors .button .icon{background-color:transparent;border-inline-start:1px solid hsla(0,0%,100%,.05)}.size-300.button{border-radius:4px;border-radius:6px;padding:5px 18px}.size-300.button:has(.icon){padding:0}.size-300.button:has(.icon)>*{padding:5px 175px;padding-inline:clamp(10px,min(1.25vw,.75em),17.5px)}.size-300.button:has(.icon) .icon{font-size:1.25rem;padding-block:8px;padding-inline:clamp(10px,min(1.25vw,.75em),12px)}}@layer buttons{@media (width<535px){.button{padding:5px 18px}.button:has(.icon){padding:0}.button:has(.icon)>*{padding:5px 175px;padding-inline:clamp(10px,min(1.25vw,.75em),17.5px)}.button:has(.icon) .icon{font-size:1.25rem;padding-block:8px;padding-inline:clamp(10px,min(1.25vw,.75em),12px)}}}@layer utility{.flexi{align-items:center;display:flex;flex-wrap:wrap;gap:clamp(20px,5vw,35px);justify-content:flex-start}.flow>:where(:not(:first-child)){margin-block-start:var(--flow-space,1em)}.hidden{display:none!important}@media (max-width:30em){.hide-small{display:none!important}}@media (max-width:50em){.hide-medium{display:none!important}}.sr-only{clip:rect(0,0,0,0);border:0;height:1px;margin:-1px;overflow:hidden;padding:0;position:absolute;white-space:nowrap;width:1px}.border-top{border-top:1px solid hsl(var(--clr-primary-hsl)/.25);margin-block-start:2rem;margin-block-start:6rem;padding-block-start:2.5rem}.margin-top{margin-block-start:3rem}.d-block{display:blok}}@layer forms{:where(input:is([type=text],[type=email],[type=password]),textarea){appearance:none;background-color:hsl(var(--clr-light-hsl)/.6);background-color:hsl(var(--clr-light-hsl)/1);border:1.5px solid hsl(var(--clr-dark-hsl)/.5);border-radius:.25rem;box-shadow:0 1px 3px 0 rgba(0,0,0,.1),0 1px 2px 0 rgba(0,0,0,.06);color:hsl(var(--clr-dark-hsl)/1);font-size:1rem;font-weight:400;mix-blend-mode:luminosity;outline-offset:0;outline-width:1.5px;padding-block:.35rem;padding-inline:.75rem;position:relative;transition:all .3s cubic-bezier(.22,1,.36,1)}:where(input:is([type=text],[type=email],[type=password]),textarea):focus{background-color:hsl(var(--clr-light-hsl)/1);border:1.5px solid hsl(var(--clr-darker-hsl)/.8);color:hsl(var(--clr-darker-hsl)/1)}:where(input:is([type=text],[type=email],[type=password]),textarea)::placeholder{color:hsl(var(--clr-dark-hsl)/.75)}:where(input:is([type=text],[type=email],[type=password]),textarea):focus::placeholder{color:hsl(var(--clr-dark-hsl)/.75)}label{color:var(--clr-blue-desaturated-700);font-weight:600;letter-spacing:-.0175em}label:has(svg){align-items:center;column-gap:.25em;display:flex;justify-content:center}label:has(svg) svg{color:var(--clr-blue-700);height:1.5rem;width:1.5rem}}@layer contract-typography{:root{--step--2:clamp(0.56rem,calc(0.8rem - 0.51vw),0.69rem);--step--1:clamp(0.75rem,calc(0.9rem - 0.32vw),0.83rem);--step-0:clamp(1.00rem,1rem,1.00rem);--step-1:clamp(1.20rem,calc(1.1rem + 0.51vw),1.33rem);--step-2:clamp(1.44rem,calc(1.18rem + 1.3vw),1.78rem);--step-3:clamp(1.73rem,calc(1.23rem + 2.47vw),2.37rem);--step-4:clamp(2.07rem,calc(1.24rem + 4.18vw),3.16rem);--step-5:clamp(2.49rem,calc(1.16rem + 6.63vw),4.21rem)}#content{background:#fff;margin:2rem 2rem 6rem;margin-inline:0;margin-inline:auto;max-width:calc(100% - 2rem);max-width:100%;padding:0 2em;padding-inline:2rem;width:clamp(10rem,60rem,80rem);width:52em;width:210mm}#content,#main{font-family:Libre Baskerville,serif;font-size:var(--step-0);line-height:1.5;line-height:1.75}h2,h3,h4,h5,h6{margin-block-start:1.75em}h1{border-style:solid;border-width:3px 0 1px;font-family:Arapey,serif;font-size:var(--step-2);font-weight:400;letter-spacing:.15em;margin-block-end:2.5rem;margin-block-start:1rem;padding:.5em 0;position:relative;text-align:center}h1,h2{line-height:1.2em;text-transform:uppercase}h2{font-family:Open Sans Condensed,sans-serif;font-family:Open Sans,sans-serif;font-size:var(--step-1);font-variation-settings:"wdth" 75;font-weight:600;letter-spacing:.025em}h3,h4,h5,h6{font-weight:700}}@layer signatures{.compiled-signatures{display:flex;flex-wrap:wrap;gap:2rem;justify-content:space-around}.compiled-signature{align-items:start;display:grid;font-size:.75em;max-width:min(50%,330px);max-width:clamp(50% - 2rem,348px,100%);min-width:300px;min-width:200px}.compiled-signature img{background:#fff;border:1px solid rgba(3,33,48,.25);margin-block:.15rem}#dev_signature,#hk{display:block;max-width:min(333px,100%);max-width:min(370px,100%)}#dev_signature[src=null]{display:none}.date-ip{font-family:Open Sans Condensed,sans-serif;font-family:Open Sans,sans-serif;font-size:1.2em;font-variation-settings:"wdth" 75;font-weight:400;letter-spacing:.025em;line-height:1.2em}#ui-unsigned{margin:0;margin-block-start:var(--flow-space,1.5rem)}#ui-signed{clear:both}#content>:not(#ui-unsigned,#dev_signature){transition:opacity .3s ease-out}#signature-container{display:grid;gap:1.5rem;place-items:start}@media (min-width:40rem){#signature-container{place-items:end}}#canvas-container{aspect-ratio:188/58.66;background:#fff;isolation:isolate;max-width:100%;position:relative;transition:max-width .4s cubic-bezier(.22,1,.36,1),margin .6s ease-in-out;-webkit-user-select:none;user-select:none;width:100%}#canvas-container:before{border-bottom:2px solid #61594f;content:"";display:block;height:0;inset:70% 7.5% 0 7.5%;opacity:.95;pointer-events:none;position:absolute;z-index:-1}}@layer signatures{@media (max-width:40em){#canvas-container{aspect-ratio:200/80}}}@layer signatures{#generator-signature-pad,#signature-pad{border:2px dashed rgba(3,33,48,.75);box-shadow:inset 0 0 5px 1px #ddd;height:100%;left:0;position:absolute;top:0;width:100%}#signature-controls{align-items:flex-start;display:flex;flex-direction:row;gap:1.5rem;justify-content:center;width:100%}.loading-signed{align-items:center;justify-content:center}@media (min-width:40rem){.loading-signed{justify-content:center}}.loading-signed:not(.hidden){display:flex}.to-go{opacity:1;transform:none;transition:all .2s cubic-bezier(.26,.53,.74,1.48),scale 1s ease-out}.to-go.gone{opacity:0;transform:translateY(-20px)}#canvas-container.just-signed{max-width:333px}@media (min-width:40rem){#canvas-container.just-signed{margin-top:calc(-330px - 2rem)}}#canvas-container.just-signed #signature-pad{border:1px dashed rgba(3,33,48,.25);box-shadow:inset 0 0 2px 1px hsla(0,0%,87%,.25)}#canvas-container.just-signed:before{opacity:0}}@layer modal{.modal{--shadow-color:200 3% 15%;--shadow-strength:5%;--shadow-6:0 -1px 2px 0 hsl(var(--shadow-color)/calc(var(--shadow-strength) + 2%)),0 3px 2px -2px hsl(var(--shadow-color)/calc(var(--shadow-strength) + 3%)),0 7px 5px -2px hsl(var(--shadow-color)/calc(var(--shadow-strength) + 3%)),0 12px 10px -2px hsl(var(--shadow-color)/calc(var(--shadow-strength) + 4%)),0 22px 18px -2px hsl(var(--shadow-color)/calc(var(--shadow-strength) + 5%)),0 41px 33px -2px hsl(var(--shadow-color)/calc(var(--shadow-strength) + 6%)),0 100px 80px -2px hsl(var(--shadow-color)/calc(var(--shadow-strength) + 7%));border:3px solid hsl(var(--shadow-color));border-radius:1.5rem;box-shadow:var(--shadow-6);margin-block-start:auto;max-width:calc(100% - 1rem);padding:0;position:fixed;z-index:999}.modal::backdrop{-webkit-backdrop-filter:blur(4px);backdrop-filter:blur(4px);background-image:linear-gradient(132deg,rgba(31,39,41,.6),rgba(35,41,47,.6));cursor:pointer}.close-button{border-radius:50%;height:32px;margin:1rem 0 0;max-width:32px;padding:0;position:relative;vertical-align:top;width:32px}.close-button:active{background-color:#000;transition:none}.close-button:before{height:2px;width:50%}.close-button:after{height:50%;width:2px}.close-button:after,.close-button:before{background-color:currentColor;content:"";display:block;left:50%;position:absolute;top:50%;transform:translateX(-50%) translateY(-50%) rotate(45deg);transform-origin:center center}.qr-code-container{display:grid;gap:1rem;justify-items:end;margin-block-end:3.5rem;margin-inline:1rem}#generator-qr-code,#qr-code{display:block;image-rendering:pixelated;margin:auto;max-width:90%;width:min(500px,90vw)}}@layer animated-entrances{@media (prefers-reduced-motion:reduce){.animate{animation:none!important}}}@layer animated-entrances{.delay-1{animation-delay:.6s}.delay-2{animation-delay:.7s}.delay-3{animation-delay:.8s}.delay-4{animation-delay:.9s}.delay-5{animation-delay:1s}.delay-6{animation-delay:1.1s}.delay-7{animation-delay:1.2s}.delay-8{animation-delay:1.3s}.delay-9{animation-delay:1.4s}.delay-10{animation-delay:1.5s}.delay-11{animation-delay:1.6s}.delay-12{animation-delay:1.7s}.delay-13{animation-delay:1.8s}.delay-14{animation-delay:1.9s}.delay-15{animation-delay:2s}.delay-16{animation-delay:2.1s}:where(.animate){animation-delay:.5s;animation-duration:.75s;animation-fill-mode:backwards;animation-name:animate-fade;animation-timing-function:cubic-bezier(.26,.53,.74,1.48)}:where(.animate).fade{animation-name:animate-fade;animation-timing-function:ease}:where(.animate).pop{animation-name:animate-pop}:where(.animate).blur{animation-name:animate-blur;animation-timing-function:ease}:where(.animate).glow{animation-name:animate-glow;animation-timing-function:ease}:where(.animate).grow{animation-name:animate-grow}:where(.animate).splat{animation-name:animate-splat}:where(.animate).roll{animation-name:animate-roll}:where(.animate).flip{animation-name:animate-flip;perspective:1000px;transform-style:preserve-3d}:where(.animate).spin{animation-name:animate-spin;perspective:1000px;transform-style:preserve-3d}:where(.animate).slide{animation-name:animate-slide}:where(.animate).drop{animation-name:animate-drop;animation-timing-function:cubic-bezier(.77,.14,.91,1.25)}:where(.animate).drop-up{animation-name:animate-drop-up;animation-timing-function:cubic-bezier(.77,.14,.91,1.25)}}@layer animated-entrances{@media screen{@keyframes animate-fade{0%{opacity:0}to{opacity:1}}@keyframes animate-pop{0%{opacity:0;transform:scale(.5)}to{opacity:1;transform:scale(1)}}@keyframes animate-blur{0%{filter:blur(15px);opacity:0}to{filter:blur(0);opacity:1}}@keyframes animate-glow{0%{filter:brightness(3) saturate(3);opacity:0;transform:scale(.8)}to{filter:brightness(1) saturate(1);opacity:1;transform:scale(1)}}@keyframes animate-grow{0%{opacity:0;transform:scaleY(0);visibility:hidden}to{opacity:1;transform:scale(1)}}@keyframes animate-splat{0%{opacity:0;transform:scale(0) rotate(20deg) translateY(-30px)}70%{opacity:1;transform:scale(1.1) rotate(15deg)}85%{opacity:1;transform:scale(1.1) rotate(15deg) translateY(-10px)}to{opacity:1;transform:scale(1) rotate(0) translate(0)}}@keyframes animate-roll{0%{opacity:0;transform:scale(0) rotate(1turn)}to{opacity:1;transform:scale(1) rotate(0deg)}}@keyframes animate-flip{0%{opacity:0;transform:rotateX(-120deg) scale(.9)}to{opacity:1;transform:rotateX(0deg) scale(1)}}@keyframes animate-spin{0%{opacity:0;transform:rotateY(-120deg) scale(.9)}to{opacity:1;transform:rotateY(0deg) scale(1)}}@keyframes animate-slide{0%{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translate(0)}}@keyframes animate-drop{0%{opacity:0;transform:translateY(-300px) scale(.9,1.1)}95%{opacity:1;transform:translate(0) scale(.9,1.1)}96%{opacity:1;transform:translate(10px) scale(1.2,.9)}97%{opacity:1;transform:translate(-10px) scale(1.2,.9)}98%{opacity:1;transform:translate(5px) scale(1.1,.9)}99%{opacity:1;transform:translate(-5px) scale(1.1,.9)}to{opacity:1;transform:translate(0) scale(1)}}@keyframes animate-drop-up{0%{opacity:0;transform:translateY(300px) scale(.9,1.1)}95%{opacity:1;transform:translate(0) scale(.9,1.1)}96%{opacity:1;transform:translate(-10px) scale(1.2,.9)}97%{opacity:1;transform:translate(10px) scale(1.2,.9)}98%{opacity:1;transform:translate(-5px) scale(1.1,.9)}99%{opacity:1;transform:translate(5px) scale(1.1,.9)}to{opacity:1;transform:translate(0) scale(1)}}}}details{--clr-500:var(--clr-blue-500);--clr-600:var(--clr-blue-600);--clr-700:var(--clr-blue-700);--clr-500-desaturated:var(--clr-blue-desaturated-500);--clr-600-desaturated:var(--clr-blue-desaturated-600);--clr-700-desaturated:var(--clr-blue-desaturated-700);margin-inline-start:-.75rem;margin-inline-start:-.81rem;max-height:1.5em;overflow:hidden;transition:all .4s ease-in-out}@media (width < 535px){details>:not(summary){margin-inline-start:.75rem}}details details{margin-inline-start:0}details[open]{max-height:90vh}details[open] summary{padding-block-end:.5em}@media (width > 360px){details:has(.repeater-item:nth-child(4)){max-height:unset}}@media (width <= 360px){details:has(.repeater-item:nth-child(2)){max-height:unset}}details.danger{--clr-primary-hsl:var(--clr-danger-hsl);--clr-500:var(--clr-red-500);--clr-600:var(--clr-red-600);--clr-700:var(--clr-red-700);--clr-500-desaturated:var(--clr-red-desaturated-500);--clr-600-desaturated:var(--clr-red-desaturated-600);--clr-700-desaturated:var(--clr-red-desaturated-700)}details.success{--clr-primary-hsl:var(--clr-success-hsl);--clr-500:var(--clr-green-500);--clr-600:var(--clr-green-600);--clr-700:var(--clr-green-700);--clr-500-desaturated:var(--clr-green-desaturated-500);--clr-600-desaturated:var(--clr-green-desaturated-600);--clr-700-desaturated:var(--clr-green-desaturated-700)}details.warning{--clr-primary-hsl:var(--clr-warning-hsl);--clr-500:var(--clr-brown-500);--clr-600:var(--clr-brown-600);--clr-700:var(--clr-brown-700);--clr-500-desaturated:var(--clr-brown-desaturated-500);--clr-600-desaturated:var(--clr-brown-desaturated-600);--clr-700-desaturated:var(--clr-brown-desaturated-700)}details>summary{color:var(--clr-500);color:var(--clr-600);cursor:pointer;font-family:inherit;font-size:16px;font-weight:700;letter-spacing:-.025em;line-height:26px;max-width:min-content;transition:outline .4s cubic-bezier(.22,1,.36,1),padding .2s ease-in;-webkit-user-select:auto;user-select:auto;white-space:nowrap}details>summary:hover{background:none;color:var(--clr-700)}details>summary:focus-visible{border-radius:8px;color:#000;outline:none;text-decoration:underline;text-decoration-thickness:2;text-underline-position:under}details>summary:focus-visible::marker{color:inherit}details>summary::marker{color:var(--clr-600-desaturated);color:hsl(var(--clr-primary-hsl)/.8)}details>summary:hover::marker{color:inherit}details>summary:active{transform:scale(.975);transition:transform .3s cubic-bezier(.22,1,.36,1),outline .4s cubic-bezier(.22,1,.36,1),background-color .2s linear}details>.panel{background:hsl(var(--clr-primary-hsl)/.1);border:1.5px solid hsl(var(--clr-primary-hsl)/.075);border-radius:8px;gap:1rem;justify-content:flex-start;padding:.75rem 1rem 1rem;position:relative}details>.panel label{color:var(--clr-700-desaturated);font-weight:600;letter-spacing:-.0175em}details>.panel>p:last-child:not([class]){color:var(--clr-500-desaturated)}.panel>small{text-wrap:balance;display:block;display:grid;font-weight:600;gap:1em;line-height:1.75;opacity:75%}</style>
  </head>
  <body>
  <div id="content" class="ql-editor">
  ';
}

if($CLIENT_SIGNATURE==null) {
  /** 
  ⌛ Waiting for Client to sign: include signature elements and javascript 
  **/

  $HEADER = headerWithTitle('Unsigned Contract');

  $FOOTER = '
  <div id="ui-unsigned">  
    <form method="post" class="noprint" id="signature_form">
        <div id="signature-container">
            <div id="canvas-container">
                <canvas id="signature-pad" class="signature-pad" width="188" height="58.66"></canvas>
            </div>
        </div>
    
        <div class="animate slide">
            <div class="no-print margin-top invert-colors flexi | to-go | animate slide">
                <button id="reset" title="Clear Signature" type="button" class="icon-button button warning">
                    <span class="hide-medium">Clear</span>
                    <span class="icon">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em"
                            width="1em" xmlns="http://www.w3.org/2000/svg">
                                <path d="M20.454,19.028h-7.01l6.62-6.63a2.935,2.935,0,0,0,.87-2.09,2.844,2.844,0,0,0-.87-2.05l-3.42-3.44a2.93,2.93,0,0,0-4.13.01L3.934,13.4a2.946,2.946,0,0,0,0,4.14l1.48,1.49H3.554a.5.5,0,0,0,0,1h16.9A.5.5,0,0,0,20.454,19.028Zm-7.24-13.5a1.956,1.956,0,0,1,2.73,0l3.42,3.44a1.868,1.868,0,0,1,.57,1.35,1.93,1.93,0,0,1-.57,1.37l-5.64,5.64-6.15-6.16Zm-1.19,13.5h-5.2l-2.18-2.2a1.931,1.931,0,0,1,0-2.72l2.23-2.23,6.15,6.15Z"></path>
                        </svg>
                    </span>
                </button>
    
                <button id="show-modal-qr" type="button" class="open-button | icon-button button">
                    <span class="hide-small">Sign on mobile</span>
                    <span class="icon">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" version="1.1" viewBox="0 0 16 16" height="1em"
                            width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5 1h-4v4h4v-4zM6 0v0 6h-6v-6h6zM2 2h2v2h-2zM15 1h-4v4h4v-4zM16 0v0 6h-6v-6h6zM12 2h2v2h-2zM5 11h-4v4h4v-4zM6 10v0 6h-6v-6h6zM2 12h2v2h-2zM7 0h1v1h-1zM8 1h1v1h-1zM7 2h1v1h-1zM8 3h1v1h-1zM7 4h1v1h-1zM8 5h1v1h-1zM7 6h1v1h-1zM7 8h1v1h-1zM8 9h1v1h-1zM7 10h1v1h-1zM8 11h1v1h-1zM7 12h1v1h-1zM8 13h1v1h-1zM7 14h1v1h-1zM8 15h1v1h-1zM15 8h1v1h-1zM1 8h1v1h-1zM2 7h1v1h-1zM0 7h1v1h-1zM4 7h1v1h-1zM5 8h1v1h-1zM6 7h1v1h-1zM9 8h1v1h-1zM10 7h1v1h-1zM11 8h1v1h-1zM12 7h1v1h-1zM13 8h1v1h-1zM14 7h1v1h-1zM15 10h1v1h-1zM9 10h1v1h-1zM10 9h1v1h-1zM11 10h1v1h-1zM13 10h1v1h-1zM14 9h1v1h-1zM15 12h1v1h-1zM9 12h1v1h-1zM10 11h1v1h-1zM12 11h1v1h-1zM13 12h1v1h-1zM14 11h1v1h-1zM15 14h1v1h-1zM10 13h1v1h-1zM11 14h1v1h-1zM12 13h1v1h-1zM13 14h1v1h-1zM10 15h1v1h-1zM12 15h1v1h-1zM14 15h1v1h-1z">
                            </path>
                        </svg>
                    </span>
                </button>
    
                <button id="submit-btn" disabled 
                    style="margin-inline-start: auto;"
                    type="submit" class="icon-button button success">
                    <span>Sign</span>
                    <span class="icon">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em"
                            width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" stroke-width="2" d="M2,12 L22,12 M13,3 L22,12 L13,21"></path>
                        </svg>
                    </span>
                </button>
            </div>
        </div>
    
        <div class="flow" style="max-width: 330px; margin-inline-start: auto;">
            <h2 class="margin-top loading-signed hidden | animate slide" style="color: var(--clr-green-500); font-weight: 700;">Saving contract…</h2>
            <small class="loading-signed hidden | animate slide delay-16"
                style="font-family: \'Open Sans\'; font-weight: 600; color: var(--clr-blue-700);">
                This shouldn\'t take more than a minute.
            </small>
        </div>
    
        <input type="hidden" id="client_signature" name="client_signature" />
    </form>
    
    
    <dialog class="modal flow" id="modal-qr">
        <div class="qr-code-container">
            <button id="close-modal-qr" class="close-button button" aria-label="close" type="button"></button>
            <canvas id="qr-code"></canvas>
        </div>
    </dialog>
  </div><!--.ui-unsigned-->
  </div> <!-- #content -->
  <script id="contract_script_unsigned" type="module">
  import SignaturePad from "https://cdn.skypack.dev/pin/signature_pad@v4.1.3-nYxPKR50YjQN4V2vbxta/mode=imports,min/optimized/signature_pad.js"
  // 📙 Package Documentation: https://www.skypack.dev/view/signature_pad
  
  signature("#signature-pad")
  
  function signature(selector) {
  
      if (!document.querySelector(selector)) return
  
      const canvas = document.querySelector(selector)
  
      // https://github.com/szimek/signature_pad#options
      const clientSignaturePad = new SignaturePad(canvas, {
          penColor: "hsl(200, 100%, 30%)",
          minDistance: 2,
      })
  
      resizeCanvas()
  
      if (localStorage.getItem("client_signature")) {
          document.querySelector("#submit-btn").disabled = false
          // document.querySelector("#reset").disabled = false
      }
  
  
      // event listeners
  
      // save signature to localStorage on change
      clientSignaturePad.addEventListener("afterUpdateStroke", () => {
          let data = clientSignaturePad.toDataURL("image/png")
  
          document.querySelector("#client_signature").value = data
          localStorage.setItem("client_signature", data)
  
          // ! probably remove these:
          document.querySelector("#submit-btn").disabled = false
          // document.querySelector("#reset").disabled = false
      })
  
      // button to reset signature
      document.querySelector("#reset")?.addEventListener("click", (e) => {
          clientSignaturePad.clear()
          localStorage.removeItem("client_signature")
          document.querySelector("#client_signature").value = null
          document.querySelector("#submit-btn").disabled = true
          // document.querySelector("#reset").disabled = true
      })
  
      // form submit
      document.querySelector("#signature_form").addEventListener("submit", (e) => {
          // e.preventDefault();
          e.target.querySelector(".to-go").classList.add("gone")
  
          e.target.querySelectorAll(".loading-signed").forEach((el) => {
              el.classList.remove("hidden")
          })
  
          e.target.querySelector("#canvas-container").classList.add("just-signed")
  
          e.target.querySelector(".to-go").addEventListener(\'transitionend\', (e) => {
              e.target.classList.add("hidden")
          })
  
          let otherElements = document.querySelectorAll("#content > *:not(#ui-unsigned, #dev_signature)")
          otherElements.forEach(element => {
              // element.style.cssText = `opacity: .5;`
              element.style.opacity = "0.5"
          })
  
      })
      
      window.onresize = resizeCanvas
  
  
      // needed for retina displays
      function resizeCanvas() {
          const ratio = Math.max(window.devicePixelRatio || 1, 1)
          canvas.width = canvas.offsetWidth * ratio
          canvas.height = canvas.offsetHeight * ratio
          canvas.getContext("2d").scale(ratio, ratio)
  
          let data = localStorage.getItem("client_signature");
          if (data) {
              // console.log(data)
              clientSignaturePad.fromDataURL(data)
              // disableResetButtonIfSignatureIsEmpty(data)
              document.querySelector("#client_signature").value = data
          }
      }
  
  }
  </script>
  <script id="qr_code_script" type="module">
  import QRious from "https://cdn.skypack.dev/pin/qrious@v4.0.2-vbPhILY2CQRjQ1N29BGh/mode=imports,min/optimized/qrious.js";
  // 📙 Package Documentation:  https://www.skypack.dev/view/qrious
  
  qrCode("#qr-code")
  
  export default function qrCode(selector) {
      
      if (!document.querySelector(selector)) return
      
      const canvas = document.querySelector(selector)
  
      let qr = new QRious({
          element: canvas,
          value: window.location.href,
          foreground: "hsl(200, 30%, 20%)",
          padding: 0,
          size: 500,
      })
  
      // event listeners
  
      const modal = document.querySelector("#modal-qr")
      const openModal = document.querySelector("#show-modal-qr")
      const closeModal = document.querySelector("#close-modal-qr")
  
      openModal?.addEventListener("click", (e) => {
          if (modal?.open === false)
              modal.showModal()
      })
  
      closeModal?.addEventListener("click", (e) => {
          modal?.close()
      })
  
      // close modal when click events happen outside of it
      modal?.addEventListener("click", (e) => {
          const rect = modal.getBoundingClientRect()
          if (
              e.clientY < rect.top ||
              e.clientY > rect.bottom ||
              e.clientX < rect.left ||
              e.clientX > rect.right
          ) {
              modal.close()
          }
      })
  }
  
  </script>
  </body>
  </html>';
  
  if ( $selfDelete && file_exists($htmlName) ) {
    header('Location: '.$htmlName.'#hk');
    die();
  }

  echo $HEADER;
  echo $CONTRACT_HTML;
  echo $DEV_SIGNATURE;
  eval (' ?>'. $FOOTER .'<?php '); // php variables can be used inside
}
else {
  /** 
  ✅ Contract was just signed: put $CLIENT_SIGNATURE and the other parts in the .html file 
  **/

  $HEADER = headerWithTitle('Signed Contract');

  $DEV_DATE_IP = '
    <div class="date-ip">
      <strong>Signed on:</strong> ' . $devTimestamp . '
      <br><strong>IP address:</strong> '  . $devIP . ' <br>
    </div>';
  $DEV_SIGNATURE .= $DEV_DATE_IP;

  /**
  $CLIENT_DATE_IP_PHP is a string of php code,
  that gets compiled below, in $CLIENT_DATE_IP_COMPILED
  **/
 
  $CLIENT_DATE_IP_PHP = $CONTRACT_SIGNED_PHP. '
    <div id="date-ip" class="date-ip">
      <strong>Signed on:</strong> <?php echo get_client_date($devTimeOffset); ?>
      <br><strong>IP address:</strong> <?php echo get_client_ip_env(); ?><br>
    </div>
  ';

  /** 
  $CLIENT_DATE_IP_COMPILED executes the php code above
  **/
  ob_start(); // https://cgd.io/2008/how-to-execute-php-code-in-a-php-string/
  eval($CLIENT_DATE_IP_PHP);
  $CLIENT_DATE_IP_COMPILED = ob_get_contents();
  ob_end_clean();

  $CLIENT_SIGNATURE .= $CLIENT_DATE_IP_COMPILED;

  // Add names above signatures
  $DEV_SIGNATURE = '<strong>'.$devName.'</strong>' . $DEV_SIGNATURE;
  $CLIENT_SIGNATURE = '<strong>'.$clientName.'</strong>' . $CLIENT_SIGNATURE;

  $FOOTER = '
    <div class="compiled-signatures">
      <div class="compiled-signature">'.$DEV_SIGNATURE. '</div><!--.compiled-signature-->
      <div class="compiled-signature">'.$CLIENT_SIGNATURE.'</div><!--.compiled-signature-->
    </div><!--.compiled-signatures-->
    <div id="ui-signed">  
      <div class="noprint margin-top invert-colors flexi | animate slide delay-3"
           style="justify-content: center;">
          <button class="icon-button button" type="button" onclick="printContract()">
              <span>Print</span>
              <span class="icon">
                  <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 1024 1024" height="1em"
                      width="1em" xmlns="http://www.w3.org/2000/svg">
                      <path d="M820 436h-40c-4.4 0-8 3.6-8 8v40c0 4.4 3.6 8 8 8h40c4.4 0 8-3.6 8-8v-40c0-4.4-3.6-8-8-8zm32-104H732V120c0-4.4-3.6-8-8-8H300c-4.4 0-8 3.6-8 8v212H172c-44.2 0-80 35.8-80 80v328c0 17.7 14.3 32 32 32h168v132c0 4.4 3.6 8 8 8h424c4.4 0 8-3.6 8-8V772h168c17.7 0 32-14.3 32-32V412c0-44.2-35.8-80-80-80zM360 180h304v152H360V180zm304 664H360V568h304v276zm200-140H732V500H292v204H160V412c0-6.6 5.4-12 12-12h680c6.6 0 12 5.4 12 12v292z">
                      </path>
                  </svg>
              </span>
          </button>
      </div>
    </div><!--.ui-signed-->
  </div> <!--#content-->
  <script id="contract_script_signed">
  function printContract() {
      window.print();
  }
  </script>
  </body>
  </html>';

  $output = $HEADER . $CONTRACT_HTML . $FOOTER;
  file_put_contents($htmlName, $output);

  /** 
  ✉ Email client & dev
  **/
  sendEmails($clientEmail, $devEmail);


  /** 
  ➡ Delete php, redirect to html
  **/
  if ($selfDelete) unlink(__FILE__);
  header('Location: '.$htmlName.'#hk');
  die();
}


// Function to email notifications; gets called when Client signs
function sendEmails($clientEmail, $devEmail)
{
  if ($clientEmail) {
    $headers = "From: " . $devEmail . "\r\nMIME-Version: 1.0\r\nContent-Type: text/html; charset=ISO-8859-1\r\n";
    $msg = 'The contract was signed. You can <a href="' . getHtmlUrl() . '">view or download this contract from here</a>.';
    mail($clientEmail, 'Contract signed', $msg, $headers);
  }
  if ($devEmail) {
    $headers = "From: " . $clientEmail . "\r\nMIME-Version: 1.0\r\nContent-Type: text/html; charset=ISO-8859-1\r\n";
    $msg = '<p>A new contract was signed. You can <a href="' . getHtmlUrl() . '">view or download this contract from here</a>.</p>';
    $msg .= 'The contract was signed by: ' . $clientEmail;
    mail($devEmail, 'Contract signed!', $msg, $headers);
  }
}
?>