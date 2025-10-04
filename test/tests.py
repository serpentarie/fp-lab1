import sys
import os
import unittest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../src/lib/problem1")))
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../src/lib/problem2")))

import problem1_7
import problem2_7

class TestEulerSolutions(unittest.TestCase):

    def test_euler4_python(self):
        self.assertEqual(problem1_7.euler4_python(), 906609)

    def test_euler26_python(self):
        self.assertEqual(problem2_7.euler26_python(), 983)

if __name__ == "__main__":
    unittest.main()
