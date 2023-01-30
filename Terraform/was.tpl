#! /bin/bash

cd /root/spring-petclinic/target
java -jar -Dspring.profiles.active=mysql spring-petclinic-2.7.0-SNAPSHOT.jar