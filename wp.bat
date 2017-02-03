:: Running WP CLI from the Command Line on Windows

@ECHO OFF
SET BIN_TARGET=%~dp0/./wp-cli.phar
php "%BIN_TARGET%" %*
