This just worked for me on <b>Ubuntu 16</b>:<br><br>
Download ('instantclient-basic-linux.x64-12.2.0.1.0.zip' and 'instantclient-sdk-linux.x64-12.2.0.1.0.zip') from Oracle web site and then do following script (you can do piece by piece and I did as a ROOT):



    apt-get install -y python-dev build-essential libaio1
    mkdir -p /opt/ora/
    cd /opt/ora/
    
    ## Now put 2 ZIP files:
    # ('instantclient-basic-linux.x64-12.2.0.1.0.zip' and 'instantclient-sdk-linux.x64-12.2.0.1.0.zip') 
    # into /opt/ora/ and unzip them -> both will be unzipped into 1 directory: /opt/ora/instantclient_12_2 
    
    rm -rf /etc/profile.d/oracle.sh
    echo "export ORACLE_HOME=/opt/ora/instantclient_12_2"  >> /etc/profile.d/oracle.sh
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME"  >> /etc/profile.d/oracle.sh
    chmod 777 /etc/profile.d/oracle.sh
    source /etc/profile.d/oracle.sh
    env | grep -i ora  # This will check current ENVIRONMENT settings for Oracle
     
    
    rm -rf /etc/ld.so.conf.d/oracle.conf
    echo "/opt/ora/instantclient_12_2" >> /etc/ld.so.conf.d/oracle.conf
    ldconfig
    cd $ORACLE_HOME  
    ls -lrth libclntsh*   # This will show which version of 'libclntsh' you have... --> needed for following line:
    
    ln -s libclntsh.so.12.1 libclntsh.so
    
    pip install cx_Oracle   # Maybe not needed but I did it anyway (only pip install cx_Oracle without above steps did not work for me...)



Your python scripts are now ready to use 'cx_Oracle'... Enjoy!
