from functools import lru_cache

import casbin
import casbin_async_sqlalchemy_adapter

from fastapi import Request

from backend.common.exception.errors import AuthorizationError
from backend.core.conf import settings
from backend.database.db import async_engine
from backend.plugin.casbin_rbac.model import CasbinRule


async def casbin_enforcer() -> casbin.AsyncEnforcer:
    """获取 casbin 执行器"""
    # 模型定义：https://casbin.org/zh/docs/category/model
    casbin_rbac_model_conf = """
    [request_definition]
    r = sub, obj, act

    [policy_definition]
    p = sub, obj, act

    [role_definition]
    g = _, _

    [policy_effect]
    e = some(where (p.eft == allow))

    [matchers]
    m = g(r.sub, p.sub) && (keyMatch(r.obj, p.obj) || keyMatch3(r.obj, p.obj)) && (r.act == p.act || p.act == "*")
    """
    adapter = casbin_async_sqlalchemy_adapter.Adapter(async_engine, db_class=CasbinRule)
    model = casbin.AsyncEnforcer.new_model(text=casbin_rbac_model_conf)
    enforcer = casbin.AsyncEnforcer(model, adapter)
    await enforcer.load_policy()
    return enforcer


@lru_cache(maxsize=1)
def get_casbin_exclude() -> frozenset[tuple[str, str]]:
    """
    获取 Casbin 鉴权白名单

    配置项格式为 `METHOD PATH`，例如 `POST /api/v1/auth/logout`

    :return:
    """
    excludes = set()
    for item in settings.RBAC_CASBIN_EXCLUDE:
        method, _, path = item.strip().partition(' ')
        if method and path:
            excludes.add((method.upper(), path.strip()))
    return frozenset(excludes)


async def casbin_verify(request: Request) -> None:
    """
    Casbin 权限校验

    :param request: FastAPI 请求对象
    :return:
    """
    method = request.method
    path = request.url.path

    # casbin 鉴权白名单
    if (method, path) in get_casbin_exclude():
        return

    # casbin 权限校验
    user_uuid = request.user.uuid
    enforcer = await casbin_enforcer()
    if not enforcer.enforce(user_uuid, path, method):
        raise AuthorizationError
