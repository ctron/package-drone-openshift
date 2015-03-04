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


