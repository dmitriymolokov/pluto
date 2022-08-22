# import pickle
# import os
# from pymemcache.client import base
# from datetime import datetime

# DATABASE_PATH = r'database/MAR_15_2021/'

# print('connect memcached...')
# client = base.Client(('localhost', 11211))
# print('Loading and injecting database')
# print(datetime.now().strftime("%m/%d/%Y, %H:%M:%S"))
# count = len(os.listdir(DATABASE_PATH))
# for c, p in enumerate(os.listdir(DATABASE_PATH)):
#     print('\rreading database: ' + str(c + 1) + '/' + str(count), end=' ')
#     with open(DATABASE_PATH + p, 'rb') as file:
#         database = pickle.load(file)
#         client.set_multi(dict.fromkeys(database, 1), expire=0)
#     database = []
# print('DONE LOADING DATABASE')
# print(datetime.now().strftime("%m/%d/%Y, %H:%M:%S"))
# ret_list = client.get_multi(
#     ['3PQtD6B1crUVvNHt6fVY5HvdajRrJ6EeGq', '1Ca72914TemMMuDpAscEMeZV3494sztc81'])
# if ret_list:
#     print('sanity check pass')
# else:
#     print('check failed')
