# print found results 
if [ -s pluto.txt ]; then
     echo "🟢🟢🟢 File is not empty 🟢🟢🟢"
     cat pluto.txt
fi

sh terminate.sh

echo 'sleep 5'
sleep 5

# start new memcached
echo 'starting new memcached instances'
memcached -n 108 -m 7168 -M -t 24 -d || {
    echo 'memcached -n 70 -m 4096 -M -t 12 -d '; 
    exit 1;
}

echo 'sleep 5'
sleep 5

# load addresses in memcached
echo 'loading addresses in memcached'
python3 fill.py || {
    echo 'python3 fill.py'; 
    exit 1;
}

echo 'sleep 5'
sleep 5

# start magic
echo 'starting magic'
python3 magic.py || {
    echo 'python3 magic.py'; 
    exit 1;
}