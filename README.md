---------- Creating a java project: ----------

first we go to spring initializer:

https://start.spring.io/

we can setup with the configuration we want, i will use maven, java, springboot 3.0.0, jar and java 11.
We need to add Spring Web in the dependencies tab

download the zip file


---- Java setup:

install your java version, for java 11:

sudo apt-get install openjdk-11-jdk

---- Modify the version if you have more than 1 java installed:

update-alternatives --config java
update-alternatives --config javac

---- Update the path

sudo nano /etc/environment

JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64

source /etc/environment

check the path: echo $JAVA_HOME

---- Check the version: 

java -version


---- Maven setup:

sudo apt-get install maven

mvn -version

---------- Creating the app ----------

---- unzip and open with IDE, install java extension

---- create a simple file 

package com.example.dockerize.springbootapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@RequestMapping
public class SpringBootAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAppApplication.class, args);
	}

	@GetMapping()
	public String getGreeting(){
		return "Hello spring boot application";
	}
}

run the file to test if it works, go to localhost:8080 in the browser, you should see "Hello spring boot application"

---- build the app

- At the root folder:

mvn install

./mvnw package && java -jar target/gs-spring-boot-docker-0.1.0.jar


---- run the app with docker

docker build -t springio/gs-spring-boot-docker .		--> create image with that tag
