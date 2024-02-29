<?php
session_start();
require __DIR__ . '/vendor/autoload.php';
$generator = new \Delight\Ids\Id();
$c = require_once 'config.php';

// Check if user has provided credentials via HTTP Authentication
if (!isset($_SERVER['PHP_AUTH_USER'])) {
    header('WWW-Authenticate: Basic realm="My Protected Area"');
    header('HTTP/1.0 401 Unauthorized');
    echo 'Please enter valid username and password';
    exit;
} else {
    // Validate the credentials
    if ($_SERVER['PHP_AUTH_USER'] == $c['admin_username'] && $_SERVER['PHP_AUTH_PW'] == $c['admin_password']) {
    } else {
        // If credentials are invalid, prompt again
        header('WWW-Authenticate: Basic realm="My Protected Area"');
        header('HTTP/1.0 401 Unauthorized');
        echo 'Invalid credentials';
        exit;
    }
}
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
  <body class="d-flex flex-column">
    <div class="page page-center">
      <div class="container container-narrow py-4">
        <div class="text-center mb-4">
          <a href="." class="navbar-brand navbar-brand-autodark">
            <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image">
          </a>
        </div>
        <div class="card">
<?php
if ($_GET['action'] == 'approve') {
    $sqlite = new PDO('sqlite:/var/www/onboarding/registrar.db');
    $sqlite->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $dsn = "{$c['db_type']}:host={$c['db_host']};dbname={$c['db_database']}";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];

    try {
        $mariaDb = new PDO($dsn, $c['db_username'], $c['db_password'], $options);
    } catch (PDOException $e) {
        echo '<div class="card-body">Database error: ' . $e->getMessage() . '</div>';
    }

    $registrarId = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $registrarId = $generator->deobfuscate($registrarId);
    $registrarId = intval($registrarId);

    try {
        // Fetch the registrar from SQLite
        $sqliteQuery = $sqlite->prepare("SELECT * FROM registrar WHERE id = :id AND status = 'pendingAgreement'");
        $sqliteQuery->execute([':id' => $registrarId]);
        $registrar = $sqliteQuery->fetch(PDO::FETCH_ASSOC);

        if ($registrar) {
            $currentDateTime = new \DateTime();
            $crdate = $currentDateTime->format('Y-m-d H:i:s.v');
            $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $randomPrefix = '';
            for ($i = 0; $i < 2; $i++) {
                $randomPrefix .= $characters[rand(0, strlen($characters) - 1)];
            }
            $currency = $_SESSION['_currency'] ?? 'USD';
            $pass_source = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()'), 0, 12);
            $pwd = password_hash($pass_source, PASSWORD_ARGON2ID, ['memory_cost' => 1024 * 128, 'time_cost' => 6, 'threads' => 4]);
            
            if (empty($registrar['iana_id']) || !is_numeric($registrar['iana_id'])) {
                $registrar['iana_id'] = null;
            }
                
            // Insert the registrar into MariaDB
            $mariaDb->beginTransaction();

            $mariaDbQuery1 = $mariaDb->prepare('INSERT INTO registrar (name, iana_id, clid, pw, prefix, email, url, whois_server, rdap_server, abuse_email, abuse_phone, accountBalance, creditLimit, creditThreshold, thresholdType, currency, crdate, lastupdate) VALUES (:name, :iana_id, :clid, :pw, :prefix, :email, :url, :whois_server, :rdap_server, :abuse_email, :abuse_phone, :accountBalance, :creditLimit, :creditThreshold, :thresholdType, :currency, :crdate, :lastupdate)');
            $mariaDbQuery1->execute([
                ':name' => $registrar['name'],
                ':iana_id' => $registrar['iana_id'],
                ':clid' => $registrar['clid'],
                ':pw' => $pwd,
                ':prefix' => $randomPrefix,
                ':email' => $registrar['email'],
                ':url' => $registrar['url'],
                ':whois_server' => $registrar['whois_server'],
                ':rdap_server' => $registrar['rdap_server'],
                ':abuse_email' => $registrar['abuse_email'],
                ':abuse_phone' => $registrar['abuse_phone'],
                ':accountBalance' => 0,
                ':creditLimit' => 0,
                ':creditThreshold' => 100,
                ':thresholdType' => 'fixed',
                ':currency' => $currency,
                ':crdate' => $crdate,
                ':lastupdate' => $crdate
            ]);
            $registrarID = $mariaDb->lastInsertId();
            
            $stmt = $mariaDb->prepare('UPDATE registrar SET prefix = ? WHERE id = ?');
            $stmt->execute([
                'R'.$registrarID,
                $registrarID
            ]);
            
            $mariaDbQuery2 = $mariaDb->prepare('INSERT INTO registrar_contact (registrar_id, type, first_name, last_name, org, street1, city, sp, pc, cc, voice, email) VALUES (:registrar_id, :type, :first_name, :last_name, :org, :street1, :city, :sp, :pc, :cc, :voice, :email)');
            $mariaDbQuery2->execute([
                ':registrar_id' => $registrarID,
                ':type' => 'owner',
                ':first_name' => $registrar['first_name'],
                ':last_name' => $registrar['last_name'],
                ':org' => $registrar['org'],
                ':street1' => $registrar['street1'],
                ':city' => $registrar['city'],
                ':sp' => $registrar['sp'],
                ':pc' => $registrar['pc'],
                ':cc' => $registrar['cc'],
                ':voice' => $registrar['voice'],
                ':email' => $registrar['oemail']
            ]);
            
            $mariaDbQuery3 = $mariaDb->prepare('INSERT INTO registrar_contact (registrar_id, type, first_name, last_name, org, street1, city, sp, pc, cc, voice, email) VALUES (:registrar_id, :type, :first_name, :last_name, :org, :street1, :city, :sp, :pc, :cc, :voice, :email)');
            $mariaDbQuery3->execute([
                ':registrar_id' => $registrarID,
                ':type' => 'billing',
                ':first_name' => $registrar['first_name'],
                ':last_name' => $registrar['last_name'],
                ':org' => $registrar['org'],
                ':street1' => $registrar['street1'],
                ':city' => $registrar['city'],
                ':sp' => $registrar['sp'],
                ':pc' => $registrar['pc'],
                ':cc' => $registrar['cc'],
                ':voice' => $registrar['voice'],
                ':email' => $registrar['oemail']
            ]);
            
            $mariaDbQuery4 = $mariaDb->prepare('INSERT INTO registrar_contact (registrar_id, type, first_name, last_name, org, street1, city, sp, pc, cc, voice, email) VALUES (:registrar_id, :type, :first_name, :last_name, :org, :street1, :city, :sp, :pc, :cc, :voice, :email)');
            $mariaDbQuery4->execute([
                ':registrar_id' => $registrarID,
                ':type' => 'abuse',
                ':first_name' => $registrar['first_name'],
                ':last_name' => $registrar['last_name'],
                ':org' => $registrar['org'],
                ':street1' => $registrar['street1'],
                ':city' => $registrar['city'],
                ':sp' => $registrar['sp'],
                ':pc' => $registrar['pc'],
                ':cc' => $registrar['cc'],
                ':voice' => $registrar['voice'],
                ':email' => $registrar['oemail']
            ]);
            
            $mariaDbQuery5 = $mariaDb->prepare('INSERT INTO registrar_whitelist (registrar_id, addr) VALUES (:registrar_id, :addr)');
            $mariaDbQuery5->execute([
                ':registrar_id' => $registrarID,
                ':addr' => $registrar['ipAddress']
            ]);
            
            $mariaDbQuery6 = $mariaDb->prepare('INSERT INTO users (email, password, username, verified, roles_mask, registered) VALUES (:email, :password, :username, :verified, :roles_mask, :registered)');
            $mariaDbQuery6->execute([
                ':email' => $registrar['user_email'],
                ':password' => $pwd,
                ':username' => $registrar['clid'],
                ':verified' => 1,
                ':roles_mask' => 4,
                ':registered' => \time()
            ]);
            $userID = $mariaDb->lastInsertId();
            
            $mariaDbQuery7 = $mariaDb->prepare('INSERT INTO registrar_users (registrar_id, user_id) VALUES (:registrar_id, :user_id)');
            $mariaDbQuery7->execute([
                ':registrar_id' => $registrarID,
                ':user_id' => $userID
            ]);
            
            $eppCommands = [
                'login',
                'logout',
                'contact:create',
                'domain:check',
                'domain:info',
                'domain:renew',
                'domain:transfer',
                'host:create',
                'host:info',
                'contact:update',
                'domain:delete',
                'poll:request'
            ];

            foreach ($eppCommands as $command) {
                $mariaDbQueryX = $mariaDb->prepare('INSERT INTO registrar_ote (registrar_id, command, result) VALUES (:registrar_id, :command, :result)');
                $mariaDbQueryX->execute([
                    ':registrar_id' => $registrarID,
                    ':command' => $command,
                    ':result' => 9,
                ]);
            }
            
            $mariaDb->commit();

            $stmtA = $sqlite->prepare("UPDATE registrar SET status = 'Approved' WHERE id = :id");
            $stmtA->bindParam(':id', $registrar['id']);
            $stmtA->execute();

            echo '<div class="card-body">Registrar created successfully.</div>';
            
        } else {
            echo '<div class="card-body">Registrar not found.</div>';
        }
    } catch (PDOException $e) {
        // Handle SQL errors or connection problems
        $mariaDb->rollBack();
        echo '<div class="card-body">Database error: ' . $e->getMessage() . '</div>';
    } catch (Exception $e) {
        // Handle any other errors
        $mariaDb->rollBack();
        echo '<div class="card-body">General error: ' . $e->getMessage() . '</div>';
    }
} else {
    try {
        // PDO connection to SQLite database
        $pdo = new PDO('sqlite:/var/www/onboarding/registrar.db');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "SELECT * FROM registrar WHERE status = 'pendingAgreement'";
        $stmt = $pdo->query($sql);

        // Fetch all rows
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        // Handle SQL errors or connection problems
        echo '<div class="card-body">Database error: ' . $e->getMessage() . '</div>';
    } catch (Exception $e) {
        // Handle any other errors
        echo '<div class="card-body">General error: ' . $e->getMessage() . '</div>';
    }
?>
          <div class="table-responsive">
            <table class="table table-vcenter card-table">
                <thead>
                    <tr>
                        <th>Application ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($rows)): ?>
                        <tr>
                            <td colspan="4" class="text-center">There are no applications to approve.</td>
                        </tr>
                    <?php else: ?>
                        <?php foreach ($rows as $row): ?>
                            <tr>
                                <td><?php echo $generator->obfuscate($row['id']); ?></td>
                                <td><strong><?php echo htmlspecialchars($row['name']); ?></strong></td>
                                <td><?php echo htmlspecialchars($row['email']); ?></td>
                                <td>
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="popover" title="Application Details" data-bs-content="<?php echo 'Contact: ' . htmlspecialchars($row['first_name'].' '.$row['last_name']) . ' from ' . htmlspecialchars($row['city']) . ', ' . htmlspecialchars($row['cc']) . '. Created on: ' . htmlspecialchars($row['crdate']) . '. IANA ID: ';
                                    echo !empty($row['iana_id']) ? htmlspecialchars($row['iana_id']) : 'N/A'; ?>">Details</button>
                                    <a href="/contract-<?php echo htmlspecialchars($row['clid']); ?>.html" target="_blank" class="btn btn-outline-primary btn-sm">Agreement</a>
                                    <a href="/registry.php?action=approve&id=<?php echo $generator->obfuscate($row['id']); ?>" class="btn btn-primary btn-sm">Approve</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
          </div>
<?php
}
?>
        </div>
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <script src="./assets/js/tabler.min.js" defer></script>
  </body>
</html>