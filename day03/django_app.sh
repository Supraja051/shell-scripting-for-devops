#!/bin/bash
<< task
Deploy a django app and handle the code for errors
task
code_clone() {
	echo"Cloning the django app.."
	git clone https://github.com/Supraja051/django-notes-app.git
}
install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}
required_restarts() {   
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable jenkins
}
deploy(){
docker build -t notes-app .
docker run -p 8000:8000 notes-app:latest
}
echo "Deployment started"
if ! code_clone; then
	echo "the code repo already exists"
	cd django-notes-app
fi
if ! install_requirements; then
	echo "Installation failed"
	exit1
fi
if ! required_restarts; then
	echo "Restarts failed"
	exit 1
fi
if ! deploy; then
	echo "Deploy failed"
	exit 1
fi
