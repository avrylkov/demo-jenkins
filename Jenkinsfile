pipeline {
    agent any
    tools {
        oc "oc3.11.0"
        maven "Maven 3.3.9"
    }

    stages {
        stage("Build mvn project") {
            steps {
              script {
                mvn -s "C:/Program Files/JetBrains/IntelliJ IDEA 2018.1.6/plugins/maven/lib/maven3/conf/settings.xml" release:prepare -Dresume=false -Darguments="-Dmaven.deploy.skip.true"
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
                    #sh """
                        # Переодпределяем расположение файла конфигурации куда будет записан токен, чтобы потом его удалить
                        # и не светить в основном файле
                        export KUBECONFIG=./config
                        #Логинимся
                        #oc login ${ochost} --token=${octoken} --insecure-skip-tls-verify
                        oc login -u developer -p developer
                        #Заходим в своё пространство
                        #oc project autoscheduler
                        #Делаем импорт buildconfig
                        oc  apply -f target/tmp/resources/buildconfig.yaml
                        #Стартуем buildconfig загруженный
                        oc start-build demo-jenkins --follow
                }
            }
        }
    }

}
