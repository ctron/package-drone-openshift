# Package Drone on OpenShift

This repository provides Package Drone Cartridge for OpenShift

## Instructions

First get an account at [OpenShift](https://openshift.redhat.com), a free one is ok.

Next you need to follow *one* of the following installation methods. Depending what you local system looks like,
you can use the `rhc` command line application if you have it installed, or even easier, use the way web page
on "OpenShift Hub". 

Be sure to configure the system afterwards (see below).

### Method 1: OpenShift Hub

Go the [Package Drone Quickstart](https://hub.openshift.com/quickstarts/90-package-drone) on OpenShift Hub and click the big "deploy" button.

### Method 2: Command Line

You need to have the `rhc` command installed and set up:

```
rhc create-app pdrone https://raw.githubusercontent.com/ctron/package-drone-openshift/master/metadata/manifest.yml
```

### Method 3: Web Console Manual

Create a new app from the OpenShift console with the cartridge. Do not select the DIY or any other app.

```
https://raw.githubusercontent.com/ctron/package-drone-openshift/master/metadata/manifest.yml
```

## Credentials

Package Drone always has an administrator user (called `admin`) with a generated password. Normally this password changes with each startup, but for
OpenShift there is new password created for each installation. This password is printed out in the result of the application creation:

```
…
  Package Drone Admin Token: 123456781234
…
```

Or you can read it out using `rhc show-app pdrone`:

```
…
  ctron-package-drone-server-0.2.4 (Package Drone)
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
4. Select `MANAGER` and optionally `ADMIN`
5. Save changes

## Using 'next'

The branch `next` contains a snapshot of the next version. You can use it using the URL:

```
http://cartreflect-claytondev.rhcloud.com/github/ctron/package-drone-openshift?commit=next
```


