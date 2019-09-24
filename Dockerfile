FROM manualtest.azurecr.io/jboss

COPY helloworld/target/jboss-as-helloworld.war standalone/deployments/ROOT.war

CMD [ "-c", "standalone-full.xml" ]
