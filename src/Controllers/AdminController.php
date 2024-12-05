<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;
use Twig\TwigFilter;

class AdminController
{
    private Twig $twig;

    public function __construct(Twig $twig)
    {
        $this->twig = $twig;
        
        $this->twig->getEnvironment()->addFilter(new TwigFilter('obfuscate', function ($value) use ($generator) {
            $generator = new \Delight\Ids\Id();
            return $generator->obfuscate($value);
        }));
    }

    public function index(ServerRequestInterface $request, ResponseInterface $response): ResponseInterface
    {
        $c = require_once '/var/www/onboarding/config.php';

        // Check if user has provided credentials via HTTP Authentication
        if (!isset($_SERVER['PHP_AUTH_USER'])) {
            // Set the headers for HTTP Basic Authentication
            $response = $response
                ->withHeader('WWW-Authenticate', 'Basic realm="My Protected Area"')
                ->withStatus(401);

            $response->getBody()->write('Please enter valid username and password.');
            return $response;
        }

        // Validate the credentials
        $username = $_SERVER['PHP_AUTH_USER'];
        $password = $_SERVER['PHP_AUTH_PW'];

        if ($username !== $c['admin_username'] || $password !== $c['admin_password']) {
            // If credentials are invalid, prompt again
            $response = $response
                ->withHeader('WWW-Authenticate', 'Basic realm="My Protected Area"')
                ->withStatus(401);

            $response->getBody()->write('Invalid credentials.');
            return $response;
        }

        $data = $request->getParsedBody();

        try {
            // PDO connection to SQLite database
            $pdo = new \PDO('sqlite:/var/www/onboarding/registrar.db');
            $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

            // Query the registrar table
            $sql = "SELECT * FROM registrar WHERE status = 'pendingAgreement'";
            $stmt = $pdo->query($sql);

            // Fetch all rows
            $rows = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            // Handle the exception if the table doesn't exist
            if (strpos($e->getMessage(), 'no such table') !== false) {
                $rows = null; // Set rows to null if table is missing
            } else {
                // Re-throw the exception for other PDO errors
                throw $e;
            }
        }

        return $this->twig->render($response, 'admin.twig', [
            'title' => 'Home',
            'rows' => $rows,
        ]);
    }

    public function approveAgreement(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        // Retrieve the application ID from the route parameters
        $applicationId = $args['application_id'];
        $c = require_once '/var/www/onboarding/config.php';
        $errors = [];
        
        // Validate the application ID (e.g., check if it's numeric)
        if (!is_numeric($applicationId)) {
            $response->getBody()->write('Invalid application ID.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(400);
        }

        // Simulate approving the agreement (replace with actual logic)
        $agreementFile = "/var/www/onboarding/agreements/agreement-{$applicationId}.html";

        // Check if the agreement file exists
        if (!file_exists($agreementFile)) {
            $response->getBody()->write('Agreement not found.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(404);
        }

        // Approve the agreement
        $sqlite = new \PDO('sqlite:/var/www/onboarding/registrar.db');
        $sqlite->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        $dsn = "{$c['db_type']}:host={$c['db_host']};dbname={$c['db_database']}";
        $options = [
            \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES   => false,
        ];

        try {
            $mariaDb = new \PDO($dsn, $c['db_username'], $c['db_password'], $options);
        } catch (PDOException $e) {
            $errors[] = 'Database error: ' . $e->getMessage();
        }

        $generator = new \Delight\Ids\Id();
        $registrarId = $generator->deobfuscate($applicationId);
        $registrarId = intval($registrarId);

        try {
            // Fetch the registrar from SQLite
            $sqliteQuery = $sqlite->prepare("SELECT * FROM registrar WHERE id = :id AND status = 'pendingAgreement'");
            $sqliteQuery->execute([':id' => $registrarId]);
            $registrar = $sqliteQuery->fetch(\PDO::FETCH_ASSOC);

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

                $result = "Agreement for application ID {$applicationId} has been approved.";
                
            } else {
                $errors[] = 'Registrar not found.';
            }
        } catch (PDOException $e) {
            // Handle SQL errors or connection problems
            $mariaDb->rollBack();
            $errors[] = 'Database error: ' . $e->getMessage();
        } catch (Exception $e) {
            // Handle any other errors
            $mariaDb->rollBack();
            $errors[] = 'Database error: ' . $e->getMessage();
        }
        
        // Check for errors
        if (!empty($errors)) {
            // Re-render the form with error messages
            return $this->twig->render($response, 'onboarding_form_error.twig', [
                'title' => 'Onboarding Form',
                'errors' => $errors,
            ]);
        }
        
        return $this->twig->render($response, 'admin_form.twig', [
            'title' => 'Thank You!',
            'result' => $result,
        ]);
    }
    
    public function viewContract(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $applicationId = $args['application_id'];

        // Validate application ID
        if (!is_numeric($applicationId)) {
            $response->getBody()->write('Invalid application ID.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(400);
        }

        // Path to the agreement file
        $agreementFile = "/var/www/onboarding/agreements/agreement-{$applicationId}.html";

        // Check if the agreement file exists
        if (!file_exists($agreementFile)) {
            $response->getBody()->write('Agreement not found.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(404);
        }

        // Load the HTML content from the file
        $contractContent = file_get_contents($agreementFile);

        // Render the contract with the Twig template
        return $this->twig->render($response, 'contract_view.twig', [
            'title' => 'Contract View',
            'contractContent' => $contractContent,
        ]);
    }
    
    public function rejectApplication(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $applicationId = $args['application_id'];
        $errors = [];

        // Validate application ID
        if (!is_numeric($applicationId)) {
            $response->getBody()->write('Invalid application ID.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(400);
        }

        // Check if the agreement file exists
        $agreementFile = "/var/www/onboarding/agreements/agreement-{$applicationId}.html";
        if (file_exists($agreementFile)) {
            // Optionally delete the agreement file
            unlink($agreementFile);
        }
        
        $generator = new \Delight\Ids\Id();
        $registrarId = $generator->deobfuscate($applicationId);
        $registrarId = intval($registrarId);

        // Reject the application
        $sqlite = new \PDO('sqlite:/var/www/onboarding/registrar.db');
        $sqlite->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        $dsn = "{$c['db_type']}:host={$c['db_host']};dbname={$c['db_database']}";
        $options = [
            \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES   => false,
        ];

        try {
            // Prepare the delete query
            $sqliteQuery = $sqlite->prepare("DELETE FROM registrar WHERE id = :id AND status = 'pendingAgreement'");

            // Execute the query with the provided registrar ID
            $sqliteQuery->execute([':id' => $registrarId]);

            if ($sqliteQuery->rowCount() > 0) {
                $result = "Application ID {$applicationId} has been rejected.";
            } else {
                $errors[] = 'No matching registrar found to delete.';
            }
        } catch (\PDOException $e) {
            $errors[] = 'Database error: '. $e->getMessage();
        }
        
        // Check for errors
        if (!empty($errors)) {
            // Re-render the form with error messages
            return $this->twig->render($response, 'onboarding_form_error.twig', [
                'title' => 'Onboarding Form',
                'errors' => $errors,
            ]);
        }
        
        return $this->twig->render($response, 'admin_form.twig', [
            'title' => 'Thank You!',
            'result' => $result,
        ]);
    }

}