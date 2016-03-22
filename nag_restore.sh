#!/bin/bash

#This script is to perform the System Restore Process for Nagiosxi backup server.



restorefile=$restorefile

        {

          cp /usr/local/nagios/bin/ndo2db /usr/local/
          cd /store/backups/nagiosxi
          restorefile=$(ls /store/backups/nagiosxi)

          echo "$restorefile"

          echo " The Restore Process will now Commence

          /usr/local/nagiosxi/scripts/restore_xi.sh /store/backups/nagiosxi/$restorefile

          sleep 60


          mv /usr/local/ndo2db  /usr/local/nagios/bin/

          sleep 5

          service ndo2db start
          sleep 8
          service mysqld restart
          #mail -s "Nagiosxi Server Restore" email@address.com <<< "The server restore has completed. Please log in and change the host access URL in the Admin tab "

          export SUBJECT=Nagiosxi Server Restore
          export smtp=
          export EMAIL=
          echo "The server restore has completed. Please log in and change the host access URL in the Admin tab" | mailx -s "$SUBJECT" "$EMAIL"


}
