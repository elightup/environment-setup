:: Creating development WordPress site with XAMPP on Windows
:: http://www.deluxeblogtips.com/creating-development-wordpress-site-with-xampp-on-windows/

@echo OFF

:: Variales.

:: Apache vhost configuration file.
SET ApacheConf=C:\xampp\apache\conf\extra\httpd-vhosts.conf

:: Install path of the site.
SET InstallPath=%USERPROFILE%\Sites\%1.dev

:: MySQL account.
SET MysqlUsername=root
SET MysqlPassword=

:: WordPress.
SET SiteTitle=%1
SET AdminUsername=admin
SET AdminPassword=admin
SET AdminEmail=admin@%1.dev

echo Adding domain to hosts file...
echo.127.0.0.1	%1.dev>> %SYSTEMROOT%\System32\drivers\etc\hosts

echo Adding vhost configuration to Apache...
echo.^<VirtualHost *:80^>>> %ApacheConf%
echo.    DocumentRoot "%InstallPath%">> %ApacheConf%
echo.    ServerName %1.dev>> %ApacheConf%
echo.^</VirtualHost^>>> %ApacheConf%

echo Creating database...
mysqladmin -u %MysqlUsername% --password="%MysqlPassword%" create %1

echo Installing WordPress...
if not exist "%InstallPath%" mkdir %InstallPath%
cd /d %InstallPath%
wp core download && wp core config --dbname=%1 --dbuser=%MysqlUsername% --dbpass=%MysqlPassword% && wp core install --url=%1.dev --title=%SiteTitle% --admin_user=%AdminUsername% --admin_password=%AdminPassword% --admin_email=%AdminEmail%

echo Done
