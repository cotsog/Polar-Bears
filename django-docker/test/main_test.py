import unittest
import requests

# [TODO] Split for each service and each function.
# [TODO] Should I automatically grab the machine-ip from docker? 

def webpage_isup(ip, port):
    try:
        req = str(requests.get("http://" + ip + port))
        res = '<Response [200]>'
        if req == res:
            return True
        else:
            return False
    except:
        return False

class TestDjangoBrowser(unittest.TestCase):

    def test_api_isup(self):
        self.assertTrue(webpage_isup('192.168.99.101', ':8000'))
    def test_api_isnotdown(self):
        self.assertFalse(webpage_isup('192.168.99.101', ':8'))



if __name__ == '__main__':
    unittest.main()
