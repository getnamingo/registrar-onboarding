<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;
use Pinga\Session\Session;

class ContractController
{
    private Twig $twig;

    public function __construct(Twig $twig)
    {
        $this->twig = $twig;
    }

    public function showContract(ServerRequestInterface $request, ResponseInterface $response): ResponseInterface
    {
        $c = require_once '/var/www/onboarding/config.php';

        // Check if session variables exist
        if (!Session::has('application_id') || !Session::has('clid')) {
            $response->getBody()->write('Unauthorized access.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(403);
        }

        // Load contract template
        $templatePath = '/var/www/onboarding/contract.tpl';
        if (!file_exists($templatePath)) {
            $response->getBody()->write('Contract template not found.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(500);
        }

        $originalContent = file_get_contents($templatePath);
        if ($originalContent === false) {
            $response->getBody()->write('Failed to load contract template.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(500);
        }

        // Replace placeholders in the template
        $now = new \DateTime();
        $formattedDate = $now->format('F d, Y') . ' at ' . $now->format('h:i:s A T');
        $currentDateTime = date('Y-m-d H:i:s');

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
            'APPLICATION_ID',
        ];

        $replace = [
            Session::get('name'),
            Session::get('regAddr'),
            Session::get('regSign'),
            Session::get('email'),
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
            Session::get('application_id'),
        ];

        $contractContent = str_replace($search, $replace, $originalContent);

        ob_start();
        eval("?>{$contractContent}");
        $processedContent = ob_get_clean();

        // Render contract
        return $this->twig->render($response, 'contract.twig', [
            'title' => 'Contract Agreement',
            'contractContent' => $processedContent,
        ]);
    }

    public function viewContract(ServerRequestInterface $request, ResponseInterface $response): ResponseInterface
    {
        if (!Session::has('application_id') || !Session::has('clid')) {
            $response->getBody()->write('Unauthorized access.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(403);
        }

        $applicationId = Session::get('application_id');
        $registrarUsername = Session::get('clid');

        // Define the path to the HTML file
        $filePath = "/var/www/onboarding/agreements/agreement-{$applicationId}.html";

        // Check if the file exists
        if (!file_exists($filePath)) {
            $response->getBody()->write('Contract file not found.');
            return $response
                ->withHeader('Content-Type', 'text/html')
                ->withStatus(404);
        }

        Session::set('contract_signed', 1);

        // Load the content of the HTML file
        $processedContent = file_get_contents($filePath);

        // Render contract in Twig template
        return $this->twig->render($response, 'contract_view.twig', [
            'title' => 'Contract Agreement',
            'contractContent' => $processedContent,
        ]);
    }
}
