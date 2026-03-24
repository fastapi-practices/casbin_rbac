set @system_menu_id = (select id from sys_menu where name = 'System');

insert into sys_menu (title, name, path, sort, icon, type, component, perms, status, display, cache, link, remark, parent_id, created_time, updated_time)
values ('casbin_rbac.menu', 'PluginCasbinRbac', '/plugins/casbin-rbac', 6, 'mdi:shield-account-outline', 0, null, null, 1, 1, 1, '', 'Casbin RBAC', @system_menu_id, now(), null);

set @casbin_root_menu_id = LAST_INSERT_ID();

insert into sys_menu (title, name, path, sort, icon, type, component, perms, status, display, cache, link, remark, parent_id, created_time, updated_time)
values ('API 管理', 'CasbinApiManage', '/plugins/casbin-rbac/api', 1, 'mdi:api', 1, '/plugins/casbin_rbac/views/api', null, 1, 1, 1, '', null, @casbin_root_menu_id, now(), null);

set @casbin_api_menu_id = LAST_INSERT_ID();

insert into sys_menu (title, name, path, sort, icon, type, component, perms, status, display, cache, link, remark, parent_id, created_time, updated_time)
values ('策略管理', 'CasbinPolicyManage', '/plugins/casbin-rbac/policy', 2, 'mdi:shield-key-outline', 1, '/plugins/casbin_rbac/views/casbin', null, 1, 1, 1, '', null, @casbin_root_menu_id, now(), null);

set @casbin_policy_menu_id = LAST_INSERT_ID();

insert into sys_menu (title, name, path, sort, icon, type, component, perms, status, display, cache, link, remark, parent_id, created_time, updated_time)
values
('新增接口', 'AddSystemApi', null, 0, null, 2, null, 'sys:api:add', 1, 0, 1, '', null, @casbin_api_menu_id, now(), null),
('修改接口', 'EditSystemApi', null, 0, null, 2, null, 'sys:api:edit', 1, 0, 1, '', null, @casbin_api_menu_id, now(), null),
('删除接口', 'DeleteSystemApi', null, 0, null, 2, null, 'sys:api:del', 1, 0, 1, '', null, @casbin_api_menu_id, now(), null),
('新增策略', 'AddCasbinPolicy', null, 0, null, 2, null, 'casbin:p:add', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('批量新增策略', 'AddCasbinPolicies', null, 0, null, 2, null, 'casbin:p:group:add', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('修改策略', 'EditCasbinPolicy', null, 0, null, 2, null, 'casbin:p:edit', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('批量修改策略', 'EditCasbinPolicies', null, 0, null, 2, null, 'casbin:p:group:edit', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('删除策略', 'DeleteCasbinPolicy', null, 0, null, 2, null, 'casbin:p:del', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('批量删除策略', 'DeleteCasbinPolicies', null, 0, null, 2, null, 'casbin:p:group:del', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('清空策略', 'ClearCasbinPolicies', null, 0, null, 2, null, 'casbin:p:empty', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('新增分组', 'AddCasbinGroup', null, 0, null, 2, null, 'casbin:g:add', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('批量新增分组', 'AddCasbinGroups', null, 0, null, 2, null, 'casbin:g:group:add', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('删除分组', 'DeleteCasbinGroup', null, 0, null, 2, null, 'casbin:g:del', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('批量删除分组', 'DeleteCasbinGroups', null, 0, null, 2, null, 'casbin:g:group:del', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null),
('清空分组', 'ClearCasbinGroups', null, 0, null, 2, null, 'casbin:g:empty', 1, 0, 1, '', null, @casbin_policy_menu_id, now(), null);
