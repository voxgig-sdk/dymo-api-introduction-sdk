# DymoApiIntroduction SDK utility: make_context

from core.context import DymoApiIntroductionContext


def make_context_util(ctxmap, basectx):
    return DymoApiIntroductionContext(ctxmap, basectx)
