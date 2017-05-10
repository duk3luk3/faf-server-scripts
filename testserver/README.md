# Test-Server

## DB Upgrade / Migration from Prod Server

* sanitize login table:

    UPDATE login SET email = concat(login, '@example.com'), ip = '127.0.0.1', password = sha2('foo', 256);

* Reenable mysql login config:

    docker exec -it stable_faf-db_1 mysql_config_editor set --login-path=faf_lobby --host=localhost --user=root --password

(You need the root pw for that)

* Reset id and password on `oauth_clients`:

    UPDATE oauth_client SET id=uuid(), client_secret=uuid() where client_type = 'confidential';
