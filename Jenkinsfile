pipeline {
    agent any
    tools {
        oc "oc3.11.0"
        maven "Maven 3.3.9"
    }

    stages {
        stage("Build mvn project") {
            steps {
               bat 'mvn package -Dresume=false -DskipTests=true -Darguments="-Dmaven.deploy.skip.true"'
             }
        }
        stage("Build container image") {
            steps {
                script {
                    //Читаем параметры версии из pom.xml
                    pom = readMavenPom file: 'pom.xml'
                    version = pom.version
                    ochost = pom.properties.openshifthost
                    octoken = pom.properties.openshifttoken
                    gitUrl = "'" + pom.properties.gitUrl + "'"
                    gitBranch = pom.properties.gitBranch
                    gitBranch = pom.properties.gitBranch
                    echo "${ochost}"
                    echo "${octoken}"
                    echo "${version}"
                    echo "${gitUrl}"
                    bat """
                        oc login -u developer -p developer
                        oc apply -f target/tmp/resources/buildconfig.yaml
                        oc start-build demo-jenkins --follow
                     """
                }
            }
        }
    }

}
