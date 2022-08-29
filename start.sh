# print found results 
if [ -s pluto.txt ]; then
     echo "🟡🟡🟡🟡🟡🟡🟡"
     cat pluto.txt
     echo "🟡🟡🟡🟡🟡🟡🟡"
fi

sh terminate.sh

echo '⚪️ sleep 3'
sleep 3

while true
do

    echo '⚪️ starting new memcached instances'
    memcached -n 70 -m 2048 -M -t 12 -d || {
        echo '🔴 memcached -n 70 -m 1639 -M -t 12 -d failed';
        exit 1;
    }

    echo '⚪️ loading addresses in memcached'
    python3 fill.py || {
        echo '🔴 python3 fill.py failed';
        sh terminate.sh;
        exit 1;
    }

    echo '⚪️ starting magic' 
    python3 magic.py || {
        echo '🔴 python3 magic.py failed'; 
        sh terminate.sh;
        exit 1;
    }

    sh terminate.sh
    sh update_data.sh

done