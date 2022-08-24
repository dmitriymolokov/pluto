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