import unittest
from app import app

class TestApp(unittest.TestCase):
    def test_home(self):
        client = app.test_client()
        response = client.get("/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode("utf-8"), "Hello from Flask v2 (updated)")

if __name__ == "__main__":
    unittest.main()
