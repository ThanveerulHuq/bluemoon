# bluemoon

### **Build Steps**
 - Change Urls from SDMS to SDMS_*
 - To do that find /SDMS in vscode which will give 42 results in 17 files
 - Replace all
 - change database in application.properties
 - change artifact name in pom.xml
 - Build using the command below
```shell
mvn package -DskipTests
```

