# clean up
sh clean_useless_files.sh

# downloading new addresses
sh download_data.sh

# terminal current memcached
sh terminate.sh

# replace data.tsv
sh replace_data.sh

# clean up
sh clean_useless_files.sh

# starting magic
sh start.sh
