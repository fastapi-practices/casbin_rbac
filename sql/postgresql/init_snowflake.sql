insert into sys_menu (id, title, name, path, sort, icon, type, component, perms, status, display, cache, link, remark, parent_id, created_time, updated_time)
values (2147651050658729984, 'casbin_rbac.menu', 'PluginCasbinRbac', '/plugins/casbin-rbac', 6, 'mdi:shield-account-outline', 0, null, null, 1, 1, 1, '', 'Casbin RBAC', (select id from sys_menu where name = 'System' limit 1), now(), null);

insert into sys_menu (id, title, name, path, sort, icon, type, component, perms, status, display, cache, link, remark, parent_id, created_time, updated_time)
values
(2147651050662924288, 'API 管理', 'CasbinApiManage', '/plugins/casbin-rbac/api', 1, 'mdi:api', 1, '/plugins/casbin_rbac/views/api', null, 1, 1, 1, '', null, 2147651050658729984, now(), null),
(2147651050667118592, '策略管理', 'CasbinPolicyManage', '/plugins/casbin-rbac/policy', 2, 'mdi:shield-key-outline', 1, '/plugins/casbin_rbac/views/casbin', null, 1, 1, 1, '', null, 2147651050658729984, now(), null),
(2147651050671312896, '新增接口', 'AddSystemApi', null, 0, null, 2, null, 'sys:api:add', 1, 0, 1, '', null, 2147651050662924288, now(), null),
(2147651050675507200, '修改接口', 'EditSystemApi', null, 0, null, 2, null, 'sys:api:edit', 1, 0, 1, '', null, 2147651050662924288, now(), null),
(2147651050679701504, '删除接口', 'DeleteSystemApi', null, 0, null, 2, null, 'sys:api:del', 1, 0, 1, '', null, 2147651050662924288, now(), null),
(2147651050683895808, '新增策略', 'AddCasbinPolicy', null, 0, null, 2, null, 'casbin:p:add', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050688090112, '批量新增策略', 'AddCasbinPolicies', null, 0, null, 2, null, 'casbin:p:group:add', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050692284416, '修改策略', 'EditCasbinPolicy', null, 0, null, 2, null, 'casbin:p:edit', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050696478720, '批量修改策略', 'EditCasbinPolicies', null, 0, null, 2, null, 'casbin:p:group:edit', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050700673024, '删除策略', 'DeleteCasbinPolicy', null, 0, null, 2, null, 'casbin:p:del', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050704867328, '批量删除策略', 'DeleteCasbinPolicies', null, 0, null, 2, null, 'casbin:p:group:del', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050709061632, '清空策略', 'ClearCasbinPolicies', null, 0, null, 2, null, 'casbin:p:empty', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050713255936, '新增分组', 'AddCasbinGroup', null, 0, null, 2, null, 'casbin:g:add', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050717450240, '批量新增分组', 'AddCasbinGroups', null, 0, null, 2, null, 'casbin:g:group:add', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050721644544, '删除分组', 'DeleteCasbinGroup', null, 0, null, 2, null, 'casbin:g:del', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050725838848, '批量删除分组', 'DeleteCasbinGroups', null, 0, null, 2, null, 'casbin:g:group:del', 1, 0, 1, '', null, 2147651050667118592, now(), null),
(2147651050730033152, '清空分组', 'ClearCasbinGroups', null, 0, null, 2, null, 'casbin:g:empty', 1, 0, 1, '', null, 2147651050667118592, now(), null);
