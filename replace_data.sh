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
