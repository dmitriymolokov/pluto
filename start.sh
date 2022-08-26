# print found results 
if [ -s pluto.txt ]; then
     echo "🟢🟢🟢 File is not empty 🟢🟢🟢"
     cat pluto.txt
fi

sh terminate.sh

echo 'sleep 3'
sleep 3

# start new memcached
echo 'starting new memcached instances'
memcached -n 70 -m 1639 -M -t 12 -d || {
    echo 'memcached -n 70 -m 1639 -M -t 12 -d failed'; 
    exit 1;
}

# load addresses in memcached
echo 'loading addresses in memcached'
python3 fill.py || {
    echo 'python3 fill.py failed'; 
    exit 1;
}

# start magic
echo 'starting magic'
python3 magic.py || {
    echo 'python3 magic.py failed'; 
    exit 1;
}