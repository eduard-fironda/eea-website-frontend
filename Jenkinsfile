pipeline {
  environment {
    // RANCHER_STACKID = "1st2568"
    // RANCHER_ENVID = "1a140884"
    GIT_NAME = "eea-website-frontend"
    registry = "eduardvalentin/eea-website-frontend"
    // template = "templates/eea-website-frontend"
    dockerImage = ''
    tagName = ''
    // SONARQUBE_TAG = 'www.eea.europa.eu-en'
    // SONARQUBE_TAG_DEMO = 'demo-www.eea.europa.eu'
  }

  agent any

  stages {

    // stage('Integration tests') {
    //   parallel {
    //     stage('Run Cypress: @eeacms/volto-*') {
    //      when {
    //        allOf {
    //          environment name: 'CHANGE_ID', value: ''
    //          not { branch 'master' }
    //          not { changelog '.*^Automated release [0-9\\.]+$' }
    //          not { buildingTag() }
    //        }
    //      }
    //       steps {
    //         node(label: 'docker') {
    //           script {
    //             try {
    //               sh '''docker pull eeacms/eea-website-backend; docker run --rm -d --name="$BUILD_TAG-plone-eeacms" -e SITE="Plone" -e PROFILES="eea.kitkat:testing" eeacms/eea-website-backend'''
    //               sh '''docker pull eeacms/volto-project-ci; docker run -i --name="$BUILD_TAG-cypress-eeacms" --link $BUILD_TAG-plone-eeacms:plone -e GIT_NAME=$GIT_NAME -e GIT_BRANCH="$BRANCH_NAME" -e GIT_CHANGE_ID="$CHANGE_ID" -e DEPENDENCIES="$DEPENDENCIES" eeacms/volto-project-ci --config-file cypress.eeacms.json'''
    //             } finally {
    //               try {
    //                 sh '''rm -rf cypress-reports cypress-results'''
    //                 sh '''mkdir -p cypress-reports cypress-results'''
    //                 sh '''docker cp $BUILD_TAG-cypress-eeacms:/opt/frontend/my-volto-project/cypress/videos cypress-reports/'''
    //                 sh '''docker cp $BUILD_TAG-cypress-eeacms:/opt/frontend/my-volto-project/cypress/reports cypress-results/'''
    //                 sh '''touch empty_file; for ok_test in $(grep -E 'file=.*failures="0"' $(grep 'testsuites .*failures="0"' $(find cypress-results -name *.xml) empty_file | awk -F: '{print $1}') empty_file | sed 's/.* file="\\(.*\\)" time.*/\\1/' | sed 's#^node_modules/volto-slate/##g' | sed 's#^node_modules/@eeacms/##g'); do rm -f cypress-reports/videos/$ok_test.mp4; rm -f cypress-reports/$ok_test.mp4; done'''
    //                 archiveArtifacts artifacts: 'cypress-reports/**/*.mp4', fingerprint: true, allowEmptyArchive: true
    //               }
    //               finally {
    //                 catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
    //                     junit testResults: 'cypress-results/**/*.xml', allowEmptyResults: true
    //                 }
    //                 sh script: "docker stop $BUILD_TAG-plone-eeacms", returnStatus: true
    //                 sh script: "docker rm -v $BUILD_TAG-plone-eeacms", returnStatus: true
    //                 sh script: "docker rm -v $BUILD_TAG-cypress-eeacms", returnStatus: true
    //               }
    //             }
    //           }
    //         }
    //       }
    //     }

    //     stage('Run Cypress: volto-slate') {
    //      when {
    //        allOf {
    //          environment name: 'CHANGE_ID', value: ''
    //          not { branch 'master' }
    //          not { changelog '.*^Automated release [0-9\\.]+$' }
    //          not { buildingTag() }
    //        }
    //      }
    //       steps {
    //         node(label: 'docker') {
    //           script {
    //             try {
    //               sh '''docker pull eeacms/eea-website-backend; docker run --rm -d --name="$BUILD_TAG-plone-slate" -e SITE="Plone" -e PROFILES="eea.kitkat:testing" eeacms/eea-website-backend'''
    //               sh '''docker pull eeacms/volto-project-ci; docker run -i --name="$BUILD_TAG-cypress-slate" --link $BUILD_TAG-plone-slate:plone -e GIT_NAME=$GIT_NAME -e GIT_BRANCH="$BRANCH_NAME" -e GIT_CHANGE_ID="$CHANGE_ID" -e DEPENDENCIES="$DEPENDENCIES" eeacms/volto-project-ci --config-file cypress.slate.json'''
    //             } finally {
    //               try {
    //                 sh '''rm -rf cypress-reports cypress-results'''
    //                 sh '''mkdir -p cypress-reports cypress-results'''
    //                 sh '''docker cp $BUILD_TAG-cypress-slate:/opt/frontend/my-volto-project/cypress/videos cypress-reports/'''
    //                 sh '''docker cp $BUILD_TAG-cypress-slate:/opt/frontend/my-volto-project/cypress/reports cypress-results/'''
    //                 sh '''touch empty_file; for ok_test in $(grep -E 'file=.*failures="0"' $(grep 'testsuites .*failures="0"' $(find cypress-results -name *.xml) empty_file | awk -F: '{print $1}') empty_file | sed 's/.* file="\\(.*\\)" time.*/\\1/' | sed 's#^node_modules/volto-slate/##g' | sed 's#^node_modules/@eeacms/##g'); do rm -f cypress-reports/videos/$ok_test.mp4; rm -f cypress-reports/$ok_test.mp4; done'''
    //                 archiveArtifacts artifacts: 'cypress-reports/**/*.mp4', fingerprint: true, allowEmptyArchive: true
    //               }
    //               finally {
    //                 catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
    //                     junit testResults: 'cypress-results/**/*.xml', allowEmptyResults: true
    //                 }
    //                 sh script: "docker stop $BUILD_TAG-plone-slate", returnStatus: true
    //                 sh script: "docker rm -v $BUILD_TAG-plone-slate", returnStatus: true
    //                 sh script: "docker rm -v $BUILD_TAG-cypress-slate", returnStatus: true
    //               }
    //             }
    //           }
    //         }
    //       }
    //     }

    //     stage("Docker test build") {
    //        when {
    //           allOf {
    //             not { changelog '.*^Automated release [0-9\\.]+$' }
    //             not { environment name: 'CHANGE_ID', value: '' }
    //             environment name: 'CHANGE_TARGET', value: 'master'
    //           }
    //         }
    //          environment {
    //           IMAGE_NAME = BUILD_TAG.toLowerCase()
    //          }
    //          steps {
    //            node(label: 'docker-host') {
    //              script {
    //                checkout scm
    //                try {
    //                  dockerImage = docker.build("${IMAGE_NAME}", "--no-cache .")
    //                } finally {
    //                  sh script: "docker rmi ${IMAGE_NAME}", returnStatus: true
    //                }
    //              }
    //            }
    //          }
    //       }


    //   }
      // }

    // stage('Bundlewatch') {
    //   when {
    //     branch 'develop'
    //     not { changelog '.*^Automated release [0-9\\.]+$' }
    //   }
    //   steps {
    //     {
    //       script {
    //         checkout scm
    //         env.NODEJS_HOME = "${tool 'NodeJS'}"
    //         env.PATH="${env.NODEJS_HOME}/bin:${env.PATH}"
    //         env.CI=false
    //         sh "yarn config set -H enableImmutableInstalls false"
    //         sh "yarn"
    //         sh "make develop"
    //         sh "make install"
    //         sh "make build"
    //         sh "make bundlewatch"
    //       }
    //     }
    //   }
    // }

    // stage('Pull Request') {
    //   when {
    //     allOf {
    //         not { environment name: 'CHANGE_ID', value: '' }
    //         environment name: 'CHANGE_TARGET', value: 'master'
    //         not { changelog '.*^Automated release [0-9\\.]+$' }
    //     }
    //   }
    //   steps {
    //     {
    //       script {
    //         if ( env.CHANGE_BRANCH != "develop" &&  !( env.CHANGE_BRANCH.startsWith("hotfix")) ) {
    //             error "Pipeline aborted due to PR not made from develop or hotfix branch"
    //         }
    //        withCredentials([string(credentialsId: 'eddie-eea-jenkins-token', variable: 'GITHUB_TOKEN')]) {
    //         sh '''docker pull eeacms/gitflow'''
    //         sh '''docker run -i --rm --name="$BUILD_TAG-gitflow-pr" -e GIT_CHANGE_TARGET="$CHANGE_TARGET" -e GIT_CHANGE_BRANCH="$CHANGE_BRANCH" -e GIT_CHANGE_AUTHOR="$CHANGE_AUTHOR" -e GIT_CHANGE_TITLE="$CHANGE_TITLE" -e GIT_TOKEN="$GITHUB_TOKEN" -e GIT_BRANCH="$BRANCH_NAME" -e GIT_CHANGE_ID="$CHANGE_ID" -e GIT_ORG="$GIT_ORG" -e GIT_NAME="$GIT_NAME" -e LANGUAGE=javascript eeacms/gitflow'''
    //        }
    //       }
    //     }
    //   }
    // }


    // stage('Release') {
    //   when {
    //     allOf {
    //       environment name: 'CHANGE_ID', value: ''
    //       branch 'master'
    //     }
    //   }
    //   steps {
    //     node(label: 'docker') {
    //       withCredentials([string(credentialsId: 'eea-jenkins-token', variable: 'GITHUB_TOKEN')]) {
    //         sh '''docker pull eeacms/gitflow'''
    //         sh '''docker run -i --rm --name="$BUILD_TAG-gitflow-master" -e GIT_BRANCH="$BRANCH_NAME" -e GIT_NAME="$GIT_NAME" -e GIT_TOKEN="$GITHUB_TOKEN" -e LANGUAGE=javascript eeacms/gitflow'''
    //       }
    //     }
    //   }
    // }

    stage('Build & Push ( on tag )') {
      when {
        anyOf {
          buildingTag()
          branch 'volto-17'
        }
      }
      steps{
          script {
            checkout scm
            if (env.BRANCH_NAME == 'master') {
              tagName = 'latest'
            } else {
              tagName = "$BRANCH_NAME"
            }
            sh '''
              # Fetch the latest buildx release version from GitHub API
              LATEST_BUILDX_VERSION=$(curl -s https://api.github.com/repos/docker/buildx/releases/latest | grep '"tag_name":' | cut -d '"' -f4)
              echo "Latest Buildx version: $LATEST_BUILDX_VERSION"

              # Check if Buildx is installed
              if docker buildx version > /dev/null 2>&1; then
                INSTALLED_BUILDX_VERSION=$(docker buildx version | grep 'github.com/docker/buildx' | awk '{print $2}')
                echo "Installed Buildx version: $INSTALLED_BUILDX_VERSION"

                # Compare versions
                if [ "$INSTALLED_BUILDX_VERSION" = "$LATEST_BUILDX_VERSION" ]; then
                  echo "Docker Buildx is already up to date."
                else
                  echo "Docker Buildx is outdated. Updating to version $LATEST_BUILDX_VERSION..."
                  mkdir -p ~/.docker/cli-plugins
                  curl -SL https://github.com/docker/buildx/releases/download/$LATEST_BUILDX_VERSION/buildx-$LATEST_BUILDX_VERSION.linux-amd64 -o ~/.docker/cli-plugins/docker-buildx
                  chmod +x ~/.docker/cli-plugins/docker-buildx
                  echo "Docker Buildx updated to version $LATEST_BUILDX_VERSION."
                fi
              else
                echo "Docker Buildx not found. Installing version $LATEST_BUILDX_VERSION..."
                mkdir -p ~/.docker/cli-plugins
                curl -SL https://github.com/docker/buildx/releases/download/$LATEST_BUILDX_VERSION/buildx-$LATEST_BUILDX_VERSION.linux-amd64 -o ~/.docker/cli-plugins/docker-buildx
                chmod +x ~/.docker/cli-plugins/docker-buildx
                echo "Docker Buildx installed."
              fi
            '''
            // try {
            //   dockerImage = docker.build("$registry:$tagName", "--no-cache .")
            //   docker.withRegistry( '', 'eeajenkins' ) {
            //     dockerImage.push()
            //   }
            // } finally {
            //   sh "docker rmi $registry:$tagName"
            // }
      withCredentials([usernamePassword(credentialsId: 'eddie-jekinsdockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        // sh '''
        // echo "${env.DOCKER_PASSWORD}" | docker login -u "${env.DOCKER_USERNAME}" --password-stdin
        // docker buildx create --use
        // docker buildx build --platform linux/amd64,linux/arm64 \
        //   -t ${registry}:${tagName} \
        //   --push .
        // docker buildx rm
        // '''
def shellScript = """
echo "\$DOCKER_PASSWORD" | docker login -u "\$DOCKER_USERNAME" --password-stdin
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 \
  -t ${registry}:${tagName} \
  --push .
docker buildx rm
"""
sh shellScript
  
            }
          }
        }
      }

    // stage('Release catalog ( on tag )') {
    //   when {
    //     buildingTag()
    //   }
    //   steps{
    //     node(label: 'docker') {
    //       withCredentials([string(credentialsId: 'eea-jenkins-token', variable: 'GITHUB_TOKEN')]) {
    //        sh '''docker pull eeacms/gitflow; docker run -i --rm --name="${BUILD_TAG}-release" -e GIT_TOKEN="${GITHUB_TOKEN}" -e RANCHER_CATALOG_PATH="${template}" -e DOCKER_IMAGEVERSION="${BRANCH_NAME}" -e DOCKER_IMAGENAME="${registry}" --entrypoint /add_rancher_catalog_entry.sh eeacms/gitflow'''
    //      }
    //     }
    //   }
    // }

    // stage('Upgrade demo ( on tag )') {
    //   when {
    //     buildingTag()
    //   }
    //   steps {
    //     node(label: 'docker') {
    //       withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'Rancher_dev_token', usernameVariable: 'RANCHER_ACCESS', passwordVariable: 'RANCHER_SECRET'],string(credentialsId: 'Rancher_dev_url', variable: 'RANCHER_URL')]) {
    //         sh '''wget -O rancher_upgrade.sh https://raw.githubusercontent.com/eea/eea.docker.gitflow/master/src/rancher_upgrade.sh'''
    //         sh '''chmod 755 rancher_upgrade.sh'''
    //         sh '''./rancher_upgrade.sh'''
    //      }
    //     }
    //   }
    // }

    // stage('Update SonarQube Tags: Prod') {
    //   when {
    //     not {
    //       environment name: 'SONARQUBE_TAG', value: ''
    //     }
    //     buildingTag()
    //   }
    //   steps{
    //     node(label: 'docker') {
    //       withSonarQubeEnv('Sonarqube') {
    //         withCredentials([string(credentialsId: 'eea-jenkins-token', variable: 'GIT_TOKEN')]) {
    //           sh '''docker pull eeacms/gitflow'''
    //           sh '''docker run -i --rm --name="${BUILD_TAG}-sonar" -e GIT_NAME=${GIT_NAME} -e GIT_TOKEN="${GIT_TOKEN}" -e SONARQUBE_TAG=${SONARQUBE_TAG} -e SONARQUBE_TOKEN=${SONAR_AUTH_TOKEN} -e SONAR_HOST_URL=${SONAR_HOST_URL}  eeacms/gitflow /update_sonarqube_tags.sh'''
    //         }
    //       }
    //     }
    //   }
    // }

    // stage('Update SonarQube Tags: Demo') {
    //   when {
    //     not {
    //       environment name: 'SONARQUBE_TAG_DEMO', value: ''
    //     }
    //     buildingTag()
    //   }
    //   steps{
    //     node(label: 'docker') {
    //       withSonarQubeEnv('Sonarqube') {
    //         withCredentials([string(credentialsId: 'eea-jenkins-token', variable: 'GIT_TOKEN')]) {
    //           sh '''docker pull eeacms/gitflow'''
    //           sh '''docker run -i --rm --name="${BUILD_TAG}-sonar" -e GIT_NAME=${GIT_NAME} -e GIT_TOKEN="${GIT_TOKEN}" -e SONARQUBE_TAG=${SONARQUBE_TAG_DEMO} -e SONARQUBE_TOKEN=${SONAR_AUTH_TOKEN} -e SONAR_HOST_URL=${SONAR_HOST_URL}  eeacms/gitflow /update_sonarqube_tags.sh'''
    //         }
    //       }
    //     }
    //   }
    // }
  }

  // post {
  //   changed {
  //     script {
  //       def url = "${env.BUILD_URL}/display/redirect"
  //       def status = currentBuild.currentResult
  //       def subject = "${status}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  //       def details = """<h1>${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - ${status}</h1>
  //                        <p>Check console output at <a href="${url}">${env.JOB_BASE_NAME} - #${env.BUILD_NUMBER}</a></p>
  //                     """
  //       emailext (subject: '$DEFAULT_SUBJECT', to: '$DEFAULT_RECIPIENTS', body: details)
  //     }
  //   }
  // }
}
