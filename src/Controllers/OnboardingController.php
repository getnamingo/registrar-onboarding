<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;
use Pinga\Session\Session;
use League\Flysystem\Local\LocalFilesystemAdapter;
use League\Flysystem\Filesystem;
use MatthiasMullie\Scrapbook\Adapters\Flysystem as ScrapbookFlysystem;
use MatthiasMullie\Scrapbook\Psr6\Pool;

class OnboardingController
{
    private Twig $twig;

    public function __construct(Twig $twig)
    {
        $this->twig = $twig;
    }

    public function submitForm(ServerRequestInterface $request, ResponseInterface $response): ResponseInterface
    {
        if ($request->getMethod() === 'POST') {
            $data = $request->getParsedBody();
            $c = require_once '/var/www/onboarding/config.php';
            $errors = [];

            $name = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['name']);
            $ianaId = preg_replace("/\D/", "", $data['ianaId']) ?? null;
            $email = filter_var($data['email'], FILTER_SANITIZE_EMAIL);
            $url = filter_var($data['url'], FILTER_SANITIZE_URL);
            $whoisServer = filter_var($data['whoisServer'], FILTER_SANITIZE_URL);
            $rdapServer = filter_var($data['rdapServer'], FILTER_SANITIZE_URL);
            $abuseEmail = filter_var($data['abuseEmail'], FILTER_SANITIZE_EMAIL);
            $abusePhone = filter_var($data['abusePhone'], FILTER_SANITIZE_NUMBER_INT);
            $ownerFirstName = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerFirstName']);
            $ownerLastName = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerLastName']);
            $ownerOrg = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerOrg']) ?? null;
            $ownerStreet1 = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerStreet1']) ?? null;
            $ownerCity = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerCity']);
            $ownerSp = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerSp']) ?? null;
            $ownerPc = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerPc']) ?? null;
            $ownerCc = preg_replace("/[^a-zA-Z0-9\s\.,-]/", "", $data['ownerCc']);
            $ownerVoice = filter_var($data['ownerVoice'], FILTER_SANITIZE_NUMBER_INT) ?? null;
            $ownerEmail = filter_var($data['ownerEmail'], FILTER_SANITIZE_EMAIL);
            $user_email = filter_var($data['user_email'], FILTER_SANITIZE_EMAIL);
            $user_name = preg_replace("/[^a-zA-Z0-9]/", "", $data['user_name']);
            $ipAddress = filter_var($data['ipAddress'], FILTER_VALIDATE_IP);
            if ($ipAddress === false) {
                $ipAddress = '1.2.3.4';
            }

            try {
                // Create (connect to) SQLite database in file
                $pdo = new \PDO('sqlite:/var/www/onboarding/registrar.db');
                // Set errormode to exceptions
                $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

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
                $stmt->bindParam(':iana_id', $ianaId, \PDO::PARAM_INT);
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
                 $errors[] = 'Database error.';
            }
        
            $regAddr = $ownerStreet1 . ', ' . $ownerCity . ', ' . $ownerSp . ', ' . $ownerPc . ', ' . $ownerCc;
            $regSign = $ownerFirstName . ' ' . $ownerLastName;
            
            $generator = new \Delight\Ids\Id();
            $application_id = $generator->obfuscate($lastId);
            
            Session::set('regAddr', $regAddr);
            Session::set('regSign', $regSign);
            Session::set('name', $name);
            Session::set('email', $email);
            Session::set('application_id', $application_id);
            Session::set('clid', $user_name);
            
            // Gather session data
            $sessionData = [
                'regAddr' => $regAddr,
                'regSign' => $regSign,
                'name' => $name,
                'email' => $email,
                'application_id' => $application_id,
                'clid' => $user_name,
            ];

            // Get the application ID
            $applicationId = $sessionData['application_id'];

            // Validate application ID
            if (empty($applicationId)) {
                $errors[] = 'Application ID is missing. Cannot cache data.';
            }

            // Setup Flysystem and Scrapbook
            $cacheDirectory = '/var/www/onboarding/cache';

            // Ensure the directory exists
            if (!is_dir($cacheDirectory)) {
                mkdir($cacheDirectory, 0777, true);
            }

            $adapter = new LocalFilesystemAdapter($cacheDirectory);
            $filesystem = new Filesystem($adapter);
            $cacheAdapter = new ScrapbookFlysystem($filesystem);

            // Initialize Scrapbook PSR-6 cache pool
            $cachePool = new Pool($cacheAdapter);

            // Cache the session data
            $cacheItem = $cachePool->getItem($applicationId);
            $cacheItem->set($sessionData);
            $cachePool->save($cacheItem);

            // Check for errors
            if (!empty($errors)) {
                // Re-render the form with error messages
                return $this->twig->render($response, 'onboarding_form_error.twig', [
                    'title' => 'Onboarding Form',
                    'errors' => $errors,
                    'formData' => $data, // Pass back form data for repopulation
                ]);
            }
            
            return $this->twig->render($response, 'onboarding_form.twig', [
                'title' => 'Thank You!',
                'application_id' => $application_id,
            ]);
        } else {
            $applicationId = Session::get('application_id');

            if (empty($applicationId)) {
                // Attempt to retrieve applicationId from the query parameter
                $queryParams = $request->getQueryParams();
                $applicationId = $queryParams['applicationId'] ?? null;

                // Check again if applicationId is still missing
                if (empty($applicationId)) {
                    return $this->twig->render($response, 'onboarding_form_error.twig', [
                        'title' => 'Error',
                        'errors' => ['There is an issue with your application. Please restart the process.'],
                        'restartLink' => '/', // Link to restart the process
                    ]);
                }

                // Setup Flysystem and Scrapbook
                $cacheDirectory = '/var/www/onboarding/cache';

                // Ensure the directory exists
                if (!is_dir($cacheDirectory)) {
                    mkdir($cacheDirectory, 0777, true);
                }

                $adapter = new LocalFilesystemAdapter($cacheDirectory);
                $filesystem = new Filesystem($adapter);
                $cacheAdapter = new ScrapbookFlysystem($filesystem);

                // Initialize Scrapbook PSR-6 cache pool
                $cachePool = new Pool($cacheAdapter);

                // Retrieve cached data
                $cacheItem = $cachePool->getItem($applicationId);

                if ($cacheItem->isHit()) {
                    // Extract cached data
                    $cachedData = $cacheItem->get();

                    // Populate session values with cached data
                    Session::set('regAddr', $cachedData['regAddr'] ?? null);
                    Session::set('regSign', $cachedData['regSign'] ?? null);
                    Session::set('name', $cachedData['name'] ?? null);
                    Session::set('email', $cachedData['email'] ?? null);
                    Session::set('application_id', $cachedData['application_id'] ?? null);
                    Session::set('clid', $cachedData['clid'] ?? null);
                } else {
                    return $this->twig->render($response, 'onboarding_form_error.twig', [
                        'title' => 'Error',
                        'errors' => ['Could not retrieve application data from cache. Please restart the process.'],
                        'restartLink' => '/', // Link to restart the process
                    ]);
                }
            }

            // Continue with rendering the form
            $contract_signed = Session::get('contract_signed');

            return $this->twig->render($response, 'onboarding_form.twig', [
                'title' => 'Thank You!',
                'application_id' => $applicationId,
                'contract_signed' => $contract_signed,
            ]);
        }
    }
}
