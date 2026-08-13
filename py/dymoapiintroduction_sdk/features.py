# DymoApiIntroduction SDK feature factory

from dymoapiintroduction_sdk.feature.base_feature import DymoApiIntroductionBaseFeature
from dymoapiintroduction_sdk.feature.test_feature import DymoApiIntroductionTestFeature


def _make_feature(name):
    features = {
        "base": lambda: DymoApiIntroductionBaseFeature(),
        "test": lambda: DymoApiIntroductionTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
