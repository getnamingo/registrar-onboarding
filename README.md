# Namingo Automated Registrar Onboarding

## Install

1. Namingo Registry must be already installed.

2. Install the Automated Registrar Onboarding component:

```bash
apt install sqlite3 php8.3-sqlite3
mkdir /var/www/onboarding
git clone https://github.com/getnamingo/registrar-onboarding /var/www/onboarding
chown -R www-data:www-data /var/www/onboarding/
cd /var/www/onboarding
composer install
mv config.php.dist config.php
```

3. Configure your details in `/var/www/onboarding/config.php` and customize the contents of the contract by editing the `$CONTRACT_HTML` variable in `/var/www/onboarding/contract.tpl`

4. Edit `/etc/caddy/Caddyfile` and add as new record the following, then replace the `YOUR_` values with your own.

```bash
onboarding.YOUR_DOMAIN {
    bind YOUR_IP
    root * /var/www/onboarding/public
    encode gzip
    php_fastcgi unix//run/php/php8.3-fpm.sock
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

5. Restart Caddy with `systemctl restart caddy`

## How to use

- Onboarding form: [https://onboarding.namingo.org/](https://onboarding.namingo.org/)

- Access to your application: [https://onboarding.namingo.org/onboarding?applicationId=APPLICATION_ID_HERE](https://onboarding.namingo.org/onboarding?applicationId=APPLICATION_ID_HERE)

- Admin interface: [https://onboarding.namingo.org/registry-admin](https://onboarding.namingo.org/registry-admin)

## TODO

- Integration with DocuSign, DocuSeal, Odoo Sign and EIDAS.

- Options to pay onboarding fee if registry needs it.

## Acknowledgements

We extend our gratitude to:
- **ChatGPT** for invaluable assistance with code and text writing.
- [Single File Contract](https://github.com/nonsalant/contract)

## Licensing

Namingo Automated Registrar Onboarding is licensed under the MIT License.