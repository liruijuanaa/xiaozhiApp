//package com.xiaozhi.filter;
//
//import com.xiaozhi.realm.ShiroRealm;
//import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
//import org.apache.shiro.cache.CacheManager;
//import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
//import org.apache.shiro.web.mgt.CookieRememberMeManager;
//import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
//import org.apache.shiro.web.servlet.SimpleCookie;
//import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.HashMap;
//
//@Configuration
//public class ShiroFilter {
//
//    //将shiro的过滤器工厂交给spring工厂管理
//    @Bean
//    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultWebSecurityManager securityManager){
//        //创建过滤器工厂
//        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
//
//        //将shiro安全管理器交给过滤器工厂
//        shiroFilter.setSecurityManager(securityManager);
//
//        //定义过滤规则
//        HashMap<String,String> map = new HashMap<>();
//        //定义过滤规则  (要过滤的资源,过滤器)
//        //anon  org.apache.shiro.web.filter.authc.AnonymousFilter   匿名过滤器
//        //authc org.apache.shiro.web.filter.authc.FormAuthenticationFilter  认证过滤器
//        //map.put("/**","anon"); //anon   过滤器的简称  匿名过滤器  不用认证都可以访问
//        map.put("/**","authc");     //认证过滤器  只有认证成功才能访问的资源
//        map.put("/user/login","anon");
//        map.put("/regist.jsp","anon");
//        map.put("/user/addUser","anon");
//        map.put("/style/**","anon");
//        map.put("/main.jsp","anon");
//
////        map.put("/login.jsp","anon");
//        //设置过滤器链
//        shiroFilter.setFilterChainDefinitionMap(map);
//        //自定义登录界面
//        shiroFilter.setLoginUrl("/main.jsp");
//        return shiroFilter;
//    }
//
//    //将安全管理器交给spring工厂管理
//    @Bean
//    public DefaultWebSecurityManager getDefaultWebSecurityManager(ShiroRealm realm){
//        //创建安全管理器
//        DefaultWebSecurityManager securityManager=new DefaultWebSecurityManager();
//        //将自定义Realm交给安全管理器
//        securityManager.setRealm(realm);
////        //将会话管理器交给安全管理器
////        securityManager.setSessionManager(sessionManager);
////        //将记住我管理器交给安全管理器
////        securityManager.setRememberMeManager(rememberMeManager);
////        //将缓存管理器交给安全管理器
////        securityManager.setCacheManager(cacheManager);
//        return securityManager;
//    }
//
//    //将自定义Realm交给Spring工厂管理
//    @Bean
//    public ShiroRealm getShiroRealm(HashedCredentialsMatcher credentialsMatcher){
//        ShiroRealm realm = new ShiroRealm();
//        //将凭证匹配器交给自定义Realm
//        realm.setCredentialsMatcher(credentialsMatcher);
//        return realm;
//    }
////    //将凭证匹配器交给Spring工厂管理
//    @Bean
//    public HashedCredentialsMatcher getHashedCredentialsMatcher(){
//        //创建凭证匹配器
//        HashedCredentialsMatcher credentialsMatcher=new HashedCredentialsMatcher();
//        credentialsMatcher.setHashAlgorithmName("md5");  //加密算法
//        credentialsMatcher.setHashIterations(1024);   //散列次数
//        return credentialsMatcher;
//    }
////
////    //将会话管理器交给Spring工厂管理
////    @Bean
////    public DefaultWebSessionManager getDefaultWebSessionManager(){
////        //创建会话管理
////        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
////        //设置Session的过期时间  参数：毫秒   默认是30秒失效
////        sessionManager.setGlobalSessionTimeout((1*1000)*60*20);
////        return sessionManager;
////    }
////
////    //将记住我管理器交给Spring工厂管理
////    @Bean
////    public CookieRememberMeManager getCookieRememberMeManager(SimpleCookie cookie){
////        //创建记住我管理器
////        CookieRememberMeManager rememberMeManager=new CookieRememberMeManager();
////        //将Cookie 交给记住我管理器
////        rememberMeManager.setCookie(cookie);
////        return rememberMeManager;
////    }
////
////    //将Shiro中的Cookie对象交给Spring工厂管理
////    @Bean
////    public SimpleCookie getSimpleCookie(){
////        SimpleCookie cookie =new SimpleCookie();
////        //cookie的名称，对应的是前端checkbox中name属性的值  name="rememberme"
////        cookie.setName("rememberme");
////        //设置记住我cookie的失效时间   参数：秒
////        cookie.setMaxAge(60*2);
////        return cookie;
////    }
////    //将Shiro的缓存交给Spring工厂管理
////    @Bean
////    public CacheManager getCacheManager(){
////        //创建缓存管理
////        CacheManager cacheManager =new EhCacheManager();
////        return cacheManager;
////    }
//}
