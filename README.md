# Package Drone on OpenShift

This repository provides Package Drone Cartridge for OpenShift

## Instructions

First get an account at [OpenShift](https://openshift.redhat.com), a free one is ok

### Command Line

You need to have the `rhc` command installed and set up:

```
rhc create-app pdrone https://raw.githubusercontent.com/ctron/package-drone-openshift/master/metadata/manifest.yml
```

### OpenShift Hub

Go the [Package Drone](https://hub.openshift.com/quickstarts/90-package-drone) on OpenShift Hub click the bug "deploy" button.

### Web Console Manual

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

After the application is set up you need to create one manager user.

Log on to the system using the user `admin` and the "admin token" (see above).

1. Go to System -> Users
2. Create a new user
3. Edit the user
4. Select MANAGER and optionally ADMIN
5. Save changes



