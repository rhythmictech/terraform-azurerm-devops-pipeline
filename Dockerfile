FROM manualtest.azurecr.io/jboss

COPY jboss-as-quickstart/helloworld/target/jboss-as-helloworld.war standalone/deployments/ROOT.war

CMD [ "-c", "standalone-full.xml" ]
