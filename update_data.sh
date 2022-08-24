# clear old files if needed
echo 'removing old files if exists...'
rm blockchair_bitcoin_addresses_and_balance_LATEST.tsv.gz
rm blockchair_bitcoin_addresses_and_balance_LATEST.tsv

# downloading new
echo 'downloading is started...'
curl -O http://addresses.loyce.club/blockchair_bitcoin_addresses_and_balance_LATEST.tsv.gz || {
    echo 'curl -O http://addresses.loyce.club/blockchair_bitcoin_addresses_and_balance_LATEST.tsv.gz failed';
    exit 1;
}
echo 'downloaded'

# gunzip
echo 'gunzip is started...'
gunzip blockchair_bitcoin_addresses_and_balance_LATEST.tsv.gz || {
    echo 'gunzip Bitcoin_addresses_LATEST.txt.gz failed';
    exit 1;
}
echo 'gunziped'

# terminal current memcached
echo 'killing current session pids...'
sh terminate.sh
echo 'killed'

# remove previous data.txt
echo 'removing previous data.txt...'
rm data.tsv
echo 'deleted'

# put new data.txt
echo 'renaming new addresses to data.txt...'
mv blockchair_bitcoin_addresses_and_balance_LATEST.tsv data.tsv || {
    echo 'mv Bitcoin_addresses_LATEST.txt data.txt falied';
    exit 1;
}
echo 'renamed'

# clear old files if needed
echo 'removing old files if exists...'
rm blockchair_bitcoin_addresses_and_balance_LATEST.tsv.gz
rm blockchair_bitcoin_addresses_and_balance_LATEST.tsv
echo 'removed'

echo 'starting magic...'
sh start.sh
