<?php
declare(strict_types=1);

require __DIR__ . '/../vendor/autoload.php';

use DI\ContainerBuilder;
use Nyholm\Psr7\Factory\Psr17Factory;
use Nyholm\Psr7Server\ServerRequestCreator;
use Slim\Factory\AppFactory;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;
use Pinga\Session\Session;

// Initialize PSR-17 and ServerRequest Creator
$psr17Factory = new Psr17Factory();
$serverRequestCreator = new ServerRequestCreator(
    $psr17Factory, // ServerRequestFactory
    $psr17Factory, // UriFactory
    $psr17Factory, // UploadedFileFactory
    $psr17Factory  // StreamFactory
);

// Create a PHP-DI container
$containerBuilder = new ContainerBuilder();

// Add definitions to the container
$containerBuilder->addDefinitions([
    Twig::class => function () {
        return Twig::create(__DIR__ . '/../src/Views', ['cache' => false]);
    },
]);

// Build the container
$container = $containerBuilder->build();

// Create the Slim app with PHP-DI
AppFactory::setContainer($container);
$app = AppFactory::create();
$app->addErrorMiddleware(true, true, true);

// Add TwigMiddleware
$app->add(TwigMiddleware::createFromContainer($app, Twig::class));

$app->add(function ($request, $handler) {
    Session::start();
    return $handler->handle($request);
});

// Add Routes
(require __DIR__ . '/../src/routes.php')($app);

// Handle the Request
$request = $serverRequestCreator->fromGlobals();
$response = $app->handle($request);

// Emit the Response
http_response_code($response->getStatusCode());
foreach ($response->getHeaders() as $name => $values) {
    foreach ($values as $value) {
        header(sprintf('%s: %s', $name, $value), false);
    }
}
echo $response->getBody();
