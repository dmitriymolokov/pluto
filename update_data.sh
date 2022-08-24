# clean up
clean_useless_files() {
    echo 'removing old files if exist...'
    rm blockchair_bitcoin_addresses_and_balance_LATEST.tsv.gz
    rm blockchair_bitcoin_addresses_and_balance_LATEST.tsv
    echo 'removed'
}

clean_useless_files

# downloading new addresses
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
sh terminate.sh

# replace data.tsv
# remove previous data.txt
echo 'removing previous data.tsv...'
rm data.tsv
echo 'deleted'

# put new data.tsv
echo 'renaming new addresses to data.txt...'
mv blockchair_bitcoin_addresses_and_balance_LATEST.tsv data.tsv || {
    echo 'mv blockchair_bitcoin_addresses_and_balance_LATEST.tsv data.tsv';
    exit 1;
}
echo 'renamed'

clean_useless_files

# starting magic
sh start.sh
