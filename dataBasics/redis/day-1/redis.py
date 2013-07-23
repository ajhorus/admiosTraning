#Day 1: CRUD and Datatypes with Python and redis-py lib

#	Install your favorite programming language driver and connect to the
#	Redis server. Insert and increment a value within a transaction.
import redis

pool = redis.ConnectionPool(host='localhost', port=6379, db=0)
redis_server = redis.Redis(connection_pool=pool)
redis_server.set('val', 1)
redis_server.incr('val',1)
getResult = redis_server.get('val')
print(getResult)

#	Using your driver of choice, create a program that reads a blocking list
#	and outputs somewhere (console, file, Socket.io, etc), and another that
#	writes to the same list.
import redis

pool = redis.ConnectionPool(host='localhost', port=6379, db=0)

def readRedisList(redisList):
	redis_server = redis.Redis(connection_pool=pool)
	return redis_server.lrange(redisList, 0, -1)

def addRedisList(redisList,val):
	redis_server = redis.Redis(connection_pool=pool)
	return redis_server.rpush(redisList,val)
	
print(readRedisList("members"))


