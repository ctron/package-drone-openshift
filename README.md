# Package Drone on OpenShift

This repository provides Package Drone Cartridge for OpenShift

## Instructions

1.) Get an account at [OpenShift](https://openshift.redhat.com), a free one is ok
2.) Follow one of the following methods

### Command Line

You need to have the `rhc` command installed and set up:

```
rhc create-app pdrone https://raw.githubusercontent.com/ctron/package-drone-openshift/master/metadata/manifest.yml
```

### Web UI Manual

Create app with the cartridge

```
https://raw.githubusercontent.com/ctron/package-drone-openshift/master/metadata/manifest.yml
```

## Credentials

Package Drone always has an adminstrator user (called `admin`) with a generated password. Normally this password changes with each startup, but for
OpenShift there is new password created for each installation. This password is printed out in the result of the application creation:

```
…
  Package Drone Admin Token: 123456781234
…
```

Or you can read it out using `rhc show-app pdrone`:

```
…
  ctron-package-drone-server-0.2.3 (Package Drone)
  ------------------------------------------------
    From:       https://raw.githubusercontent.com/ctron/package-drone-openshift/master/metadata/manifest.yml
    Website:    http://packagedrone.org
    Gears:      Located with mysql-5.5
    Admintoken: i5d1ZMikl3KE

…
```

## Configure system

After the application is set up you need to create the database schema and create one manager user.

Log on to the system using the user `admin` and the "admin token" (see above).

1.) Click on the task marker in the upper right
2.) Follow the link to for "install schema"
3.) Install the database schema

Create the manager user:

1.) Go to System -> Users
2.) Create a new user
3.) Edit the user
4.) Select MANAGER and optionally ADMIN
5.) Save changes



