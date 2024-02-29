<?php
session_start();
$c = require_once 'config.php';
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Automated Registrar Onboarding | Namingo</title>
    <meta name="msapplication-TileColor" content="#0054a6"/>
    <meta name="theme-color" content="#0054a6"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="mobile-web-app-capable" content="yes"/>
    <meta name="HandheldFriendly" content="True"/>
    <meta name="MobileOptimized" content="320"/>
    <link rel="icon" href="./favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon"/>
    <meta name="description" content="Automated Registrar Onboarding @ Namingo"/>
    <meta name="canonical" content="/">
    <meta name="twitter:image:src" content="https://tabler.io/demo/static/og.png">
    <meta name="twitter:site" content="@tabler_ui">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="Automated Registrar Onboarding | Namingo">
    <meta name="twitter:description" content="Automated Registrar Onboarding @ Namingo">
    <meta property="og:image" content="https://tabler.io/demo/static/og.png">
    <meta property="og:image:width" content="1280">
    <meta property="og:image:height" content="640">
    <meta property="og:site_name" content="Tabler">
    <meta property="og:type" content="object">
    <meta property="og:title" content="Automated Registrar Onboarding | Namingo">
    <meta property="og:url" content="https://tabler.io/demo/static/og.png">
    <meta property="og:description" content="Automated Registrar Onboarding @ Namingo">
    <!-- CSS files -->
    <link href="./assets/css/tabler.min.css" rel="stylesheet"/>
    <link href="./assets/css/tabler-flags.min.css" rel="stylesheet"/>
    <link href="./assets/css/tabler-payments.min.css" rel="stylesheet"/>
    <link href="./assets/css/tabler-vendors.min.css" rel="stylesheet"/>
    <style>
      @import url('https://rsms.me/inter/inter.css');
      :root {
          --tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
      }
      body {
          font-feature-settings: "cv03", "cv04", "cv11";
      }
    </style>
  </head>
  <body  class=" d-flex flex-column">
<?php
if (!isset($_POST['name'])) {
    header('Location: /');
    exit;
} else {
    $name = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['name']);
    $ianaId = preg_replace("/\D/", "", $_POST['ianaId']) ?? null;
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $url = filter_var($_POST['url'], FILTER_SANITIZE_URL);
    $whoisServer = filter_var($_POST['whoisServer'], FILTER_SANITIZE_URL);
    $rdapServer = filter_var($_POST['rdapServer'], FILTER_SANITIZE_URL);
    $abuseEmail = filter_var($_POST['abuseEmail'], FILTER_SANITIZE_EMAIL);
    $abusePhone = filter_var($_POST['abusePhone'], FILTER_SANITIZE_NUMBER_INT);
    $ownerFirstName = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerFirstName']);
    $ownerLastName = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerLastName']);
    $ownerOrg = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerOrg']) ?? null;
    $ownerStreet1 = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerStreet1']) ?? null;
    $ownerCity = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerCity']);
    $ownerSp = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerSp']) ?? null;
    $ownerPc = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerPc']) ?? null;
    $ownerCc = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $_POST['ownerCc']);
    $ownerVoice = filter_var($_POST['ownerVoice'], FILTER_SANITIZE_NUMBER_INT) ?? null;
    $ownerEmail = filter_var($_POST['ownerEmail'], FILTER_SANITIZE_EMAIL);
    $user_email = filter_var($_POST['user_email'], FILTER_SANITIZE_EMAIL);
    $user_name = preg_replace("/[^a-zA-Z0-9]/", "", $_POST['user_name']);
    $ipAddress = filter_var($_POST['ipAddress'], FILTER_VALIDATE_IP);
    if ($ipAddress === false) {
        $ipAddress = '1.2.3.4';
    }

    try {
        // Create (connect to) SQLite database in file
        $pdo = new PDO('sqlite:/var/www/onboarding/registrar.db');
        // Set errormode to exceptions
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Define the CREATE TABLE query
        $createQuery = "CREATE TABLE IF NOT EXISTS registrar (
                            id INTEGER PRIMARY KEY AUTOINCREMENT,
                            name TEXT NOT NULL,
                            iana_id INTEGER DEFAULT NULL,
                            clid TEXT NOT NULL,
                            email TEXT NOT NULL,
                            whois_server TEXT NOT NULL,
                            rdap_server TEXT NOT NULL,
                            url TEXT NOT NULL,
                            abuse_email TEXT NOT NULL,
                            abuse_phone TEXT NOT NULL,
                            first_name TEXT NOT NULL,
                            last_name TEXT NOT NULL,
                            org TEXT DEFAULT NULL,
                            street1 TEXT DEFAULT NULL,
                            city TEXT NOT NULL,
                            sp TEXT DEFAULT NULL,
                            pc TEXT DEFAULT NULL,
                            cc TEXT NOT NULL,
                            voice TEXT DEFAULT NULL,
                            oemail TEXT NOT NULL,
                            user_email TEXT NOT NULL,
                            ipAddress TEXT NOT NULL,
                            crdate DATETIME NOT NULL,
                            status TEXT DEFAULT NULL,
                            lastupdate DATETIME DEFAULT NULL,
                            UNIQUE (clid),
                            UNIQUE (user_email)
                        );";

        // Execute the query to create the table
        $pdo->exec($createQuery);

        // Prepare the INSERT statement with placeholders
        $stmt = $pdo->prepare("INSERT INTO registrar (
                                name, iana_id, clid, email, url, whois_server, rdap_server, 
                                abuse_email, abuse_phone, first_name, last_name, org, 
                                street1, city, sp, pc, cc, voice, oemail, user_email, ipAddress, crdate, status
                              ) VALUES (
                                :name, :iana_id, :clid, :email, :url, :whois_server, :rdap_server, 
                                :abuse_email, :abuse_phone, :ownerFirstName, :ownerLastName, :ownerOrg, 
                                :ownerStreet1, :ownerCity, :ownerSp, :ownerPc, :ownerCc, :ownerVoice, :ownerEmail, :user_email, :ipAddress, :crdate, :status
                              )");
                              
        $currentDateTime = date('Y-m-d H:i:s');
        $status = 'pendingAgreement';

        // Bind parameters to the prepared statement
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':iana_id', $ianaId, PDO::PARAM_INT);
        $stmt->bindParam(':clid', $user_name);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':url', $url);
        $stmt->bindParam(':whois_server', $whoisServer);
        $stmt->bindParam(':rdap_server', $rdapServer);
        $stmt->bindParam(':abuse_email', $abuseEmail);
        $stmt->bindParam(':abuse_phone', $abusePhone);
        $stmt->bindParam(':ownerFirstName', $ownerFirstName);
        $stmt->bindParam(':ownerLastName', $ownerLastName);
        $stmt->bindParam(':ownerOrg', $ownerOrg);
        $stmt->bindParam(':ownerStreet1', $ownerStreet1);
        $stmt->bindParam(':ownerCity', $ownerCity);
        $stmt->bindParam(':ownerSp', $ownerSp);
        $stmt->bindParam(':ownerPc', $ownerPc);
        $stmt->bindParam(':ownerCc', $ownerCc);
        $stmt->bindParam(':ownerVoice', $ownerVoice);
        $stmt->bindParam(':ownerEmail', $ownerEmail);
        $stmt->bindParam(':user_email', $user_email);
        $stmt->bindParam(':ipAddress', $ipAddress);
        $stmt->bindParam(':crdate', $currentDateTime);
        $stmt->bindParam(':status', $status);
        
        // Execute the prepared statement
        $stmt->execute();

        // Get the last inserted ID
        $lastId = $pdo->lastInsertId();

    } catch (PDOException $e) {
?>
    <div class="page page-center">
      <div class="container-tight py-4">
        <div class="empty">
          <div class="empty-header">500</div>
          <p class="empty-title">Oops… You just found an error</p>
          <p class="empty-subtitle text-secondary">
            <?php echo "Database error: " . $e->getMessage(); ?>
          </p>
          <div class="empty-action">
            <a href="./." class="btn btn-primary">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l14 0" /><path d="M5 12l6 6" /><path d="M5 12l6 -6" /></svg>
              Take me home
            </a>
          </div>
        </div>
      </div>
    </div>
<?php
        exit;
    }
    
$originalContent = file_get_contents('/var/www/onboarding/contract.tpl');

if ($originalContent === false) {
?>
    <div class="page page-center">
      <div class="container-tight py-4">
        <div class="empty">
          <div class="empty-header">500</div>
          <p class="empty-title">Oops… You just found an error</p>
          <p class="empty-subtitle text-secondary">
            Failed to prepare contract.
          </p>
          <div class="empty-action">
            <a href="./." class="btn btn-primary">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l14 0" /><path d="M5 12l6 6" /><path d="M5 12l6 -6" /></svg>
              Take me home
            </a>
          </div>
        </div>
      </div>
    </div>
<?php
    exit;
}

$regAddr = $ownerStreet1 . ', ' . $ownerCity . ', ' . $ownerSp . ', ' . $ownerPc . ', ' . $ownerCc;
$regSign = $ownerFirstName . ' ' . $ownerLastName;

$now = new DateTime();
$formattedDate = $now->format('F d, Y') . ' at ' . $now->format('h:i:s A T');

$search = [
    '[Registrar Name]',
    '[Registrar Address]',
    'Registrar Sign',
    'registrar@registrar.com',
    '[Date]',
    '[Start Date]',
    'Registry Sign',
    '[Jurisdiction]',
    '[Arbitration Association]',
    '[Number of Years]',
    '[Term]',
    '[Number of Days]',
    '[Registry Name]',
    '[Registry Address]',
    '[.TLD]',
    '1.2.3.4',
    'February 28, 2024 at 12:19:30 PM GMT+2',
];

$replace = [
    $name,
    $regAddr,
    $regSign,
    $email,
    $currentDateTime,
    $currentDateTime,
    $c['registry_manager'],
    $c['jurisdiction'],
    $c['arbitration'],
    $c['number_years'],
    $c['term'],
    $c['days'],
    $c['registry_name'],
    $c['registry_address'],
    $c['tld'],
    $_SERVER['REMOTE_ADDR'],
    $formattedDate,
];

$replacedContent = str_replace($search, $replace, $originalContent);

$newFileName = 'contract-' . preg_replace('/[^a-zA-Z0-9_-]/', '', $user_name) . '.php';

$newFilePath = '/var/www/onboarding/' . $newFileName; // Adjust the path as necessary

$result = file_put_contents($newFilePath, $replacedContent);

if ($result === false) {
?>
    <div class="page page-center">
      <div class="container-tight py-4">
        <div class="empty">
          <div class="empty-header">500</div>
          <p class="empty-title">Oops… You just found an error</p>
          <p class="empty-subtitle text-secondary">
            Failed to write the modified content to a new file.
          </p>
          <div class="empty-action">
            <a href="./." class="btn btn-primary">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l14 0" /><path d="M5 12l6 6" /><path d="M5 12l6 -6" /></svg>
              Take me home
            </a>
          </div>
        </div>
      </div>
    </div>
<?php
    exit;
}
?>
    <div class="page page-center">
      <div class="container container-tight py-4">
        <div class="text-center mb-4">
          <a href="." class="navbar-brand navbar-brand-autodark">
            <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image">
          </a>
        </div>
        <div class="card card-md">
          <div class="card-body">
            <h2 class="mb-3">Sign the Registry-Registrar Agreement</h2>
            <p class="text-secondary mb-4">
              To proceed with your registrar account setup, you need to sign the Registry-Registrar Agreement. This agreement outlines the terms and conditions of your partnership with us. Please review and sign the document to continue. Then, after approval by our team, your registrar account will be created, and you will receive an email confirmation.
            </p>
            <ul class="list-unstyled space-y">
              <li class="row g-2">
                <span class="col-auto">
                  <svg xmlns="http://www.w3.org/2000/svg" class="icon text-success" width="24" height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2" /><path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z" /><path d="M9 17v-4" /><path d="M12 17v-1" /><path d="M15 17v-2" /><path d="M12 17v-1" /></svg>
                </span>
                <span class="col">
                  <strong class="d-block">Application ID: <?php echo $lastId; ?></strong>
                </span>
              </li>
            </ul>
            <div class="my-4">
              <a href="<?php echo $newFileName; ?>" target="_blank" class="btn btn-primary w-100">
                Sign Agreement
              </a>
            </div>
            <p class="text-secondary">
              If you need to help, please <a href="#">contact us</a>.
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <script src="./assets/js/tabler.min.js" defer></script>
  </body>
</html>
<?php
}
?>