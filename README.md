Keeweb for Cloudron
===================

Note: Currently single-user only.

# Install

    git clone https://github.com/mhingston/cloudron-keeweb.git
    cd cloudron-keeweb
    cloudron login
    cloudron build
    cloudron install

# Changing WebDAV password

    cloudron exec --app <location>
    # replace username/password below with your desired username/password
    echo 'password' | htpasswd -c -i /app/data/keeweb/htpasswd username

# Using WebDAV with Keeweb

1. Open your web browser to the location of your keeweb cloudron install.
2. Click 'More' then 'WebDAV'.
3. Enter the following for URL: `https://<location>.<your_domain>/dav/vault.kdbx` and the username/password you entered in the previous step.
