# Docker-Sakai #

Sakai is a Java-based, service-oriented web application that provides a variety of capabilities supporting teaching and learning, portfolios, research, and ad-hoc project collaboration. Sakai is typically deployed using Apache Tomcat as its servlet container and scalability is achieved by running multiple instances of Tomcat in a clustered environment, each deploying a copy of Sakai. It integrates with a variety of external authentication services including CAS, Kerberos, LDAP, Shibboleth and WebAuth. A single database, usually MySQL or Oracle, provides a transactional store of information while file storage is typically delegated to NAS or SAN solutions. In most production settings, Sakai relies on a back-end student information system (SIS) to provide it with student and course information, which Sakai consults via provider APIs.

This project try to run sakai on docker

## demo ##

The Sakai Demo is a pre-built version of Sakai with Apache Tomcat and a simple configuration, perfect for a quick and easy demo of Sakai. The Sakai demo is NOT intended for large scale implementations. It is suitable only for evaluating the software and running small pilot implementations on a single server.


    docker run -d -p 8080:8080 --name sakai-demo freedomkk/sakai:demo-10.4

（Give it some 'grab a coffee time' like over 6min for it to launch）

## src ##

need to update...
