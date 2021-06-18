# lpms-db-backup-system  
  
## Overview  
This repository is used for LPMS database collection backup from LPMS production environment.  
This system is installed in same server as lpms production.  

### Backup from  
LPMS production Env.  
Server is tr-shiga as of 2021 1Q.  
  
### Backup to  
1. HDD in server  
  
(1a) D:\LPMS_backup\backup    
This data is overwritten daily.  
  
(1b) D:\LPMS_backup\backup\archived  
This data is added daily. It is not overwritten.   
It is requred to delete it manually by serer manager.  
  
2. Github  
Same data as (1a) are pushed to Github if updated  
https://github.com/localization-3g/lpms-db/tree/master/backup  
  
### Operation  
All backup and Github process are executed by Task scheduler daily in the server.   
Manual operation is not requred basically.   

