# ProjectName SDK exists test

import pytest
from dymoapiintroduction_sdk import DymoApiIntroductionSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = DymoApiIntroductionSDK.test(None, None)
        assert testsdk is not None
