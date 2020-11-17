package com.xiaozhi.realm;


import com.xiaozhi.dao.UserDao;
import com.xiaozhi.entity.User;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;

public class ShiroRealm extends AuthorizingRealm {

    @Resource
    UserDao userDao;

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("==认证==");
        String username = (String) token.getPrincipal();
        User user = userDao.queryByName(username);
        AuthenticationInfo info =null;
        if (user!=null){
            if(user.getUsername().equals(username)){
                info =new SimpleAuthenticationInfo(
                        user.getUsername(),
                        user.getPassword(),
                        ByteSource.Util.bytes("abcd"),
                        this.getName()
                );
            }
        }else {
            info=null;
        }

        return info;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    //授权
//    @Override
//    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//
//        System.out.println("==授权==");
//
//        String username = (String) principals.getPrimaryPrincipal();
//        //根据用户查询角色   角色集合   遍历角色集合 查询权限
//        //根据角色查询权限   权限集合
//
//        User user = userDao.queryByName(username);
//
//        //创建角色集合
//        ArrayList<String> roleNameList = new ArrayList<>();
//
//        //创建权限集合
//        ArrayList<String> permissionsNameList = new ArrayList<>();
//
//        //获取角色对象集合
//        List<Role> roleList = user.getRoles();
//
//        //遍历角色集合
//        for (Role role : roleList) {
//            //虎丘角色名
//            String roleName = role.getRoleName();
//            //将角色放入角色集合
//            roleNameList.add(roleName);
//
//            //获取权限集合
//            List<Authority> authorityList = role.getAuthoritys();
//            for (Authority authority : authorityList) {
//                //获取权限名称
//                String authorityName = authority.getAuthorityName();
//
//                //将权限放入权限集合
//                permissionsNameList.add(authorityName);
//            }
//        }
//
//        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//        //给当前主体授予多个角色
//        info.addRoles(roleNameList);
//        //给当前主体授予多个权限
//        info.addStringPermissions(permissionsNameList);
//
//        return info;
//    }

}
