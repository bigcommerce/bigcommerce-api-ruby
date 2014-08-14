# Generating certs

The certs in the support directory are good for 10 years starting on
2014-08-13. They were generated on an Ubuntu machine running 14.04 using
openssl (not that it matters, but patched for heartbleed).

In case they need to be re-generated, follow the steps below.

This site may be useful: http://www.akadia.com/services/ssh_test_certificate.html

## Create public/private keypair

`ssh-keygen -t rsa`

When prompted, provide the absolute path to your spec/support directory. Don't enter any passwords! Call the key testkey.

## Create signing request and cert

`openssl req -new -key testkey -out test.csr` # generates new signing request

`openssl x509 -req -days 3650 -in test.csr -signkey testkey -out test.crt` # new cert
