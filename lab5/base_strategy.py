import abc
import redis
import read_config


class BaseStrategy:
    __metaclass__ = abc.ABCMeta

    def __init__(self, url=None, filename=None):
        self.dataset_url = url
        self.dataset_filename = filename

        self.redis_client = redis.StrictRedis(host=read_config.cfg.get('nulplabs', 'redis_host'), port=6380,
                                              password=read_config.cfg.get('nulplabs', 'redis_passwd'), ssl=True)

    @abc.abstractmethod
    def execute(self):
        pass