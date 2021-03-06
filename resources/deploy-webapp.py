import os
import socket

adminServerName =   "AdminServer"
adminPort       =   os.environ.get('ADMIN_PORT', '7001')
adminUser       =   os.environ.get('ADMIN_USERNAME', 'weblogic')
adminPassword   =   os.environ.get('ADMIN_PASSWORD', 'welcome1')
print ''
print 'Host IP Address is : '+socket.gethostbyname(socket.gethostname())
print ''
adminServerUrl  =   "t3://" + socket.gethostbyname(socket.gethostname()) + ":" + adminPort

domainName     =   "base_domain"
domainHome     =   "/u01/oracle/user_projects/domains/" + domainName

#Start the AdminServer so that we can deploy the application
startServer(adminServerName, domainName, adminServerUrl, adminUser, adminPassword, domainHome, block="true")
print ''
print 'STARTED '+adminServerName

print ''
print 'CONNECT TO ADMIN SERVER';
connect(adminUser, adminPassword, adminServerUrl);

print ''
print 'DEPLOYING WEB APPLICATION...'
deploy('HelloWorldEAR', '/u01/oracle/HelloWorld/resources/HelloWorldEAR.ear', targets='AdminServer')
print '..DEPLOYED WEB APPLICATION.'

print ''
print 'NOW STARTING APPLICATION...'
startApplication('HelloWorldEAR')
print '...STARTED APPLICATION HelloWorldEAR'
print ''

