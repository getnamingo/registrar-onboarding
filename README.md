# Automated Registrar Onboarding
Beta version of the automated registrar onboarding tool for Namingo Registry

## Install

1. Namingo Registry must be already installed

```bash
apt install sqlite3 php8.2-sqlite3
mkdir /var/www/Onboarding
git clone https://github.com/getnamingo/registrar-onboarding-beta /var/www/onboarding
chown -R www-data:www-data /var/www/onboarding/
```

2. Edit `/etc/caddy/Caddyfile` and add as new record the following, then replace the values with your own.

```bash
onboarding.YOUR_DOMAIN {
    bind YOUR_IP
    root * /var/www/onboarding
    encode gzip
    php_fastcgi unix//run/php/php8.2-fpm.sock
    file_server

    # Redirect /contract.tpl to /
    @blockedFiles path /contract.tpl
    redir @blockedFiles /

    # Try to serve file directly, fallback to index.php if not found
    try_files {path} {path}/ /index.php?{query}

    tls YOUR_EMAIL
    header -Server
    header * {
        Referrer-Policy "no-referrer"
        Strict-Transport-Security max-age=31536000;
        X-Content-Type-Options nosniff
        X-Frame-Options DENY
        X-XSS-Protection "1; mode=block"
        Content-Security-Policy: default-src 'none'; object-src 'none'; base-uri 'self'; frame-ancestors 'none'; img-src https:; font-src 'self'; style-src 'self' 'unsafe-inline' https://cdnjs.cloudflare.com; script-src 'none'; form-action 'self'; worker-src 'none'; frame-src 'none';
        Feature-Policy "accelerometer 'none'; ambient-light-sensor 'none'; autoplay 'none'; camera 'none'; encrypted-media 'none'; fullscreen 'self'; geolocation 'none'; gyroscope 'none'; magnetometer 'none'; microphone 'none'; midi 'none'; payment 'none'; picture-in-picture 'self'; speaker 'none'; usb 'none'; vr 'none';"
        Permissions-Policy: accelerometer=(), ambient-light-sensor=(), autoplay=(), camera=(), encrypted-media=(), fullscreen=(self), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), midi=(), payment=(), picture-in-picture=(self), speaker=(), usb=(), vr=();
    }
}
```

## How to use

- Onboarding form: [https://onboarding.namingo.org/](https://onboarding.namingo.org/)

- Admin interface: [https://onboarding.namingo.org/registry.php](https://onboarding.namingo.org/registry.php)

- Move config.php.dist to config.php and add your details. Also, customize the contract at contract.tpl

- Put your secure username and password in registry.php

## TODO

- Better protection for admin interface.

- Docusign and other options like EIDAS.

- Mailing notifications.

- Way to delete or protect contracts from public eye.

- Once registrar is approved, to be marked as Approved in SQLite.

- Registry staff to view all data for registrar.

- Options to pay onboarding fee if registry needs it.

- Replace registry IP on timestamp.

## Acknowledgements

We extend our gratitude to:
- **ChatGPT** for invaluable assistance with code and text writing.
- [Single File Contract](https://github.com/nonsalant/contract)