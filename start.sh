# terminal memcached
sh terminate.sh

sleep 10

# start new memcached
echo 'starting new memcached instances'
memcached -n 70 -m 4096 -M -t 12 -d || {
    echo 'memcached -n 70 -m 4096 -M -t 12 -d '; 
    exit 1;
}

sleep 10

# load addresses in memcached
echo 'loading addresses in memcached'
python3 fill.py || {
    echo 'python3 fill.py'; 
    exit 1;
}

sleep 10

# start magic
echo 'loading magic'
python3 magic.py || {
    echo 'python3 magic.py'; 
    exit 1;
}