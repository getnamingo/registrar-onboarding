<?php

use Slim\App;
use App\Controllers\HomeController;
use App\Controllers\OnboardingController;
use App\Controllers\ContractController;
use App\Controllers\AdminController;

return function (App $app) {
    $app->get('/', [HomeController::class, 'index']);
    $app->map(['GET', 'POST'], '/onboarding', [OnboardingController::class, 'submitForm']);
    $app->map(['GET', 'POST'], '/contract', [ContractController::class, 'showContract']);
    $app->get('/contract/view', [ContractController::class, 'viewContract']);
    $app->get('/registry-admin', [AdminController::class, 'index']);
    $app->get('/registry-admin/approve/{application_id}', [AdminController::class, 'approveAgreement']);
    $app->get('/registry-admin/view/{application_id}', [AdminController::class, 'viewContract']);
    $app->get('/registry-admin/reject/{application_id}', [AdminController::class, 'rejectApplication']);
    
    $app->any('/{routes:.+}', function ($request, $response) {
        return $response
            ->withHeader('Location', '/')
            ->withStatus(302); // Temporary redirect to root
    });
};