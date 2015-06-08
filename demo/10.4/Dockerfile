FROM java:7

ENV SAKAI_VERSION 10.4

ENV JAVA_OPTS -server -Xmx1024m -XX:MaxNewSize=256m -XX:MaxPermSize=512m -Dhttp.agent=Sakai -Dsakai.demo=true -Djava.awt.headless=true -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dorg.apache.jasper.compiler.Parser.STRICT_WHITESPACE=false -Dsun.lang.ClassLoader.allowArraySyntax=true

ENV CATALINA_OPTS -server -Xmx1024m -XX:MaxNewSize=256m -XX:MaxPermSize=512m -Dhttp.agent=Sakai -Dsakai.demo=true -Djava.awt.headless=true -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dorg.apache.jasper.compiler.Parser.STRICT_WHITESPACE=false -Dsun.lang.ClassLoader.allowArraySyntax=true

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ADD ./sakai-demo-10.4 /sakai-demo

EXPOSE 8080

CMD ["sakai-demo/bin/catalina.sh","run"]
