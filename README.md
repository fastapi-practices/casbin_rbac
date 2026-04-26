# Casbin RBAC

基于 Casbin 实现的 RBAC 访问控制插件，支持角色、用户、接口维度的策略管理

- 支持 P 策略和 G 策略管理
- 支持在路由中通过 `DependsRBAC` 启用策略校验
- 建议先系统学习 Casbin，再接入业务接口鉴权

使用此插件前，建议查看以下内容：

- **官方文档**：[Casbin 官网](https://casbin.org/docs/get-started)
- **在线编辑器**：[Casbin Online Editor](https://casbin.org/zh/docs/online-editor)
- **视频教程**：
    - [半小时彻底弄懂 Casbin 基础模型](https://www.bilibili.com/video/BV1qz4y167XP)
    - [Casbin 代码使用与 API 调用](https://www.bilibili.com/video/BV13r4y1M7AC)

## 插件类型

- 扩展级插件
- 扩展目标：`admin`

## 配置说明

在 `backend/core/conf.py` 中更新以下内容：

```python
# RBAC
RBAC_ROLE_MENU_MODE: bool = False
```

在 `backend/core/conf.py` 中添加以下内容：

```python
##################################################
# [ Plugin ] casbin_rbac
##################################################
# 基础配置（in plugin.toml）
RBAC_CASBIN_EXCLUDE: set[tuple[str, str]]
```

插件目录下 `plugin.toml` 的 `[settings]` 中包含以下内容：

```toml
[settings]
RBAC_CASBIN_EXCLUDE = [
    ['POST', '/api/v1/auth/logout'],
]
```

## 使用方式

1. 安装并启用插件后，重启后端服务
2. 在后台维护 API 资源、Casbin 策略和用户角色关系
3. 在需要鉴权的路由中添加 `DependsRBAC` 依赖
4. 使用在线编辑器验证规则后，再将策略写入系统

内置模型：

```text
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
```

策略类型：

| 类型             | 适用场景   | 格式                                  | 依赖关系     |
|----------------|--------|-------------------------------------|----------|
| **P 策略**（角色基准） | 批量用户配置 | `角色 role + 访问路径 path + 访问方法 method` | 需配合 G 策略 |
| **P 策略**（用户基准） | 指定用户配置 | `用户 uuid + 访问路径 path + 访问方法 method` | 独立生效     |
| **G 策略**       | 角色分配   | `用户 uuid + 角色 role`                 | 需 P 策略配合 |

路由集成示例：

```python
@router.post(
    '/hello',
    summary='示例接口',
    dependencies=[DependsRBAC],
)
async def hello():
    ...
```

## 卸载说明

- 卸载插件后，移除业务路由中的 Casbin 鉴权依赖
- 如前端菜单或后台页面已集成策略管理，请同步清理对应入口

## 联系方式

- 作者：`wu-clan`
- 反馈方式：提交 Issue 或 PR
