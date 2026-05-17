@Library("Shared") _
pipeline{
    agent { label "agent-jenkins"}

    stages{

        stage("Hello"){
            steps{
                script{
                  hello()
                }  
            }
        }
        stage("Code"){
            steps{
                script{
                    clone("https://github.com/RB5437/django-notes-app.git","main")
                }
            }
        }

        stage("Build"){
            steps{
                script{
                    docker_build("notes_app","latest","ritik2909")
                }
            }
        }

        stage("Push to DockerHub"){
            steps{
                script{
                    docker_push("notes_app","latest","ritik2909")
                }
            }
        }

        stage("Deploy"){
            steps{

                echo "This is deploying the code"

                sh "docker compose up -d"
            }
        }
    }
}
