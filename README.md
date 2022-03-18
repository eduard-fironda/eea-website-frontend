# EEA Main Website frontend (Plone 6)
[![Release](https://img.shields.io/github/v/release/eea/eea-website-frontend?sort=semver)](https://github.com/eea/eea-website-frontend/releases)
[![Pipeline](https://ci.eionet.europa.eu/buildStatus/icon?job=volto/eea-website-frontend/master&subject=master)](https://ci.eionet.europa.eu/view/Github/job/volto/job/eea-website-frontend/job/master/display/redirect)
[![Pipeline develop](https://ci.eionet.europa.eu/buildStatus/icon?job=volto%2Feea-website-frontend%2Fdevelop&subject=develop)](https://ci.eionet.europa.eu/view/Github/job/volto/job/eea-website-frontend/job/develop/lastBuild/display/redirect)
[![Release pipeline](https://ci.eionet.europa.eu/buildStatus/icon?job=volto%2Feea-website-frontend%2F0.4.0&build=last&subject=release%20v0.4.0%20pipeline)](https://ci.eionet.europa.eu/view/Github/job/volto/job/eea-website-frontend/job/0.4.0/lastBuild/display/redirect/)

## Documentation

Trainings on how to create your own website using Plone 6 is available as part of the Plone training at [https://training.plone.org](https://training.plone.org).

## Getting started

1. Install `nvm`

        touch ~/.bash_profile
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

        source ~/.bash_profile
        nvm version

1. Install latest `NodeJS 16.x`:

        nvm install 16
        nvm use 16
        node -v
        v16.16.2

1. Install `yarn`

        curl -o- -L https://yarnpkg.com/install.sh | bash
        yarn -v

1. Clone:

        git clone https://github.com/eea/eea-website-frontend.git
        cd eea-website-frontend

1. Install

        yarn

1. Start backend

        docker-compose up -d
        docker-compose logs -f

1. Start frontend

        yarn start

1. See application at http://localhost:3000

## Development

### Frontend

1. Enable `develop` option for add-ons you want to develop within `mrs.developer.json` and run:

        yarn develop

1. Install

        yarn

1. Start frontend

        yarn start

### Backend

See [Plone 6 backend for EEA Main website](https://github.com/eea/eea-website-backend/tree/master/develop)

## Release
  
### Automatic release using Jenkins

#### Release flow

The release flow on Plone 6 projects is split in 2 Jenkins jobs:

* A job that runs on every commit on master and creates a production ready GitHub release and tag with the version from `package.json`
* A job that runs on every new tag ( including the one created in the first job): 
    * A new Docker image is built and released automatically on [DockerHub](https://hub.docker.com/r/eeacms/eea-website-frontend) with the release tag.
    * A new entry is automatically added to [EEA Main Website - frontend](https://github.com/eea/eea.rancher.catalog/tree/master/templates/eea-website-frontend) `EEA Rancher Catalog` with the release tag
    * If the project demo stack is configured in `RANCHER_STACKID`, the demo stack is automatically upgraded to the newly created template version
    * If the project url is configured in `SONARQUBE_TAG`, all frontend addon dependencies will be updated both in SonarQube and their `develop` Jenkinsfile with the project url

#### How to start a Production release

*  The automatic release is started by creating a [Pull Request](../../compare/master...develop) from `develop` to `master`. The pull request status checks correlated to the branch and PR Jenkins jobs need to be processed successfully. 1 review from a github user with rights is mandatory.
* It runs on every commit on `master` branch, which is protected from direct commits, only allowing pull request merge commits.
* The automatic release is done by [Jenkins](https://ci.eionet.europa.eu). The status of the release job can be seen both in the `README.md` badges and the green check/red cross/yellow circle near the last commit information. If you click on the icon, you will have the list of checks that were run. The `continuous-integration/jenkins/branch` link goes to the Jenkins job execution webpage.
* Automated release scripts are located in the `eeacms/gitflow` docker image, specifically [frontend-release.sh](https://github.com/eea/eea.docker.gitflow/blob/master/src/frontend-release.sh) script. It  uses the `release-it` tool.
* As long as a PR request is open from develop to master, the PR Jenkins job will automatically re-create the CHANGELOG.md and package.json files to be production-ready.
* The version format must be MAJOR.MINOR.PATCH. By default, next release is set to next minor version (with patch 0).
* You can manually change the version in `package.json`.  The new version must not be already present in the tags/releases of the repository, otherwise it will be automatically increased by the script. Any changes to the version will trigger a `CHANGELOG.md` re-generation.
* Automated commits and commits with [JENKINS] or [YARN] in the commit log are excluded from `CHANGELOG.md` file.


> The release job that runs on the `master` branch only creates the release in GitHub. The release job that runs on the new tag is the one that does the rest. 


### Manual release from the develop branch (beta release)

#### Installation and configuration of release-it

You need to first install the [release-it](https://github.com/release-it/release-it)  client.

   ```
   npm install -g release-it
   ```

Release-it uses the configuration written in the [`.release-it.json`](./.release-it.json) file located in the root of the repository.

Release-it is a tool that automates 4 important steps in the release process:

1. Version increase in `package.json` ( increased from the current version in `package.json`)
2. `CHANGELOG.md` automatic generation from commit messages ( grouped by releases )
3. GitHub release on the commit with the changelog and package.json modification on the develop branch

To configure the authentification, you need to export GITHUB_TOKEN for [GitHub](https://github.com/settings/tokens)

   ```
   export GITHUB_TOKEN=XXX-XXXXXXXXXXXXXXXXXXXXXX
   ```

 To configure npm, you can use the `npm login` command or use a configuration file with a TOKEN :

   ```
   echo "//registry.npmjs.org/:_authToken=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY" > .npmrc
   ```

#### Using release-it tool

There are 3 yarn scripts that can be run to do the release

##### yarn release-beta

Automatically calculates and presents 3 beta versions - patch, minor and major for you to choose ( or Other for manual input).

```
? Select increment (next version):
❯ prepatch (0.1.1-beta.0)
  preminor (0.2.0-beta.0)
  premajor (1.0.0-beta.0)
  Other, please specify...
```

##### yarn release-major-beta

Same as `yarn release-beta`, but with pre-major version pre-selected.

##### yarn release

Generic command, does not automatically add the `beta` to version, but you can still manually write it if you choose Other.

#### Important notes

> The release can be triggered by creating a new tag in the GitHub repository. It is not recommended to do this, because both the version from `package.json` and the `CHANGELOG.md` files will be desynchronized.

> Do not use release-it tool on master branch, the commit on CHANGELOG.md file and the version increase in the package.json file can't be done without a PULL REQUEST.

> Do not keep Pull Requests from develop to master branches open when you are doing beta releases from the develop branch. As long as a PR to master is open, an automatic script will run on every commit and will update both the version and the changelog to a production-ready state - ( MAJOR.MINOR.PATCH mandatory format for version).



## Production

We use [Docker](https://www.docker.com/), [Rancher](https://rancher.com/) and [Jenkins](https://jenkins.io/) to deploy this application in production.

### Deploy

* Within `Rancher > Catalog > EEA` deploy [EEA Main Website - frontend](https://github.com/eea/eea.rancher.catalog/tree/master/templates/eea-website-frontend)

### Upgrade

* Within your Rancher environment click on the `Upgrade available` yellow button next to your stack.

* Confirm the upgrade

* Or roll-back if something went wrong and abort the upgrade procedure.

## Copyright and license

The Initial Owner of the Original Code is European Environment Agency (EEA).
All Rights Reserved.

See [LICENSE.md](https://github.com/eea/eea-website-backend/blob/master/LICENSE.md) for details.

## Funding

[European Environment Agency (EU)](http://eea.europa.eu)
