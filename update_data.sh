# clear old files if needed
echo 'removing old gz if exists...'
rm Bitcoin_addresses_LATEST.txt.gz
echo 'deleted'

echo 'removing old Bitcoin_addresses_LATEST.txt if exists...'
rm Bitcoin_addresses_LATEST.txt
echo 'removed'

# downloading new
echo 'downloading is started...'
curl -O http://addresses.loyce.club/Bitcoin_addresses_LATEST.txt.gz || {
    echo 'curl -O http://addresses.loyce.club/Bitcoin_addresses_LATEST.txt.gz failed';
    exit 1;
}
echo 'downloaded'

# gunzip
echo 'gunzip is started...'
gunzip Bitcoin_addresses_LATEST.txt.gz || {
    echo 'gunzip Bitcoin_addresses_LATEST.txt.gz failed';
    exit 1;
}
echo 'gunziped'

echo 'removing gz is started...'
rm Bitcoin_addresses_LATEST.txt.gz || {
    echo 'rm Bitcoin_addresses_LATEST.txt.gz failed'; 
    exit 1;
}
echo 'deleted'

# terminal current memcached
echo 'killing current session pids...'
sh terminate.sh
echo 'killed'

# remove previous data.txt
echo 'removing previous data.txt...'
rm data.txt || {
    echo 'rm data.txt failed';
    exit 1;
}
echo 'deleted'

# put new data.txt
echo 'renaming new addresses to data.txt...'
mv Bitcoin_addresses_LATEST.txt data.txt || {
    echo 'mv Bitcoin_addresses_LATEST.txt data.txt';
    exit 1;
}
echo 'renamed'

# clean up
echo 'removing Bitcoin_addresses_LATEST.txt...'
rm Bitcoin_addresses_LATEST.txt || {
    echo 'rm Bitcoin_addresses_LATEST.txt failed';
    exit 1;
}
echo 'removed'

echo 'starting new magic...'
sh start.sh
