wp db reset --yes
wp @prod db export --allow-root - > sql-dump-production.sql
wp db import sql-dump-production.sql
wp search-replace http://domain.com http://domain.dev
