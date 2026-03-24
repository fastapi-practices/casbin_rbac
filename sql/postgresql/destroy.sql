delete from sys_menu
where name in (
    'AddSystemApi',
    'EditSystemApi',
    'DeleteSystemApi',
    'AddCasbinPolicy',
    'AddCasbinPolicies',
    'EditCasbinPolicy',
    'EditCasbinPolicies',
    'DeleteCasbinPolicy',
    'DeleteCasbinPolicies',
    'ClearCasbinPolicies',
    'AddCasbinGroup',
    'AddCasbinGroups',
    'DeleteCasbinGroup',
    'DeleteCasbinGroups',
    'ClearCasbinGroups',
    'CasbinApiManage',
    'CasbinPolicyManage'
);

delete from sys_menu where name = 'PluginCasbinRbac';

drop table if exists sys_api;
drop table if exists sys_casbin_rule;

select setval(pg_get_serial_sequence('sys_menu', 'id'), coalesce(max(id), 0) + 1, true) from sys_menu;
