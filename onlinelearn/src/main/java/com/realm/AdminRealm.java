package com.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import com.bean.SysUser;
import com.service.SysUserService;


public class AdminRealm extends AuthorizingRealm{
	
	@Autowired
	private SysUserService us;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		 String username =  (String)principals.getPrimaryPrincipal();
		 SysUser user = us.getByName(username);
		 SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		 info.setRoles(us.getRoleNameSet(user));
		 info.setStringPermissions(us.getPermissionNamesSet(user));
		 return info;
		 
	}
	
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		UsernamePasswordToken uptoken = (UsernamePasswordToken) token;
		String username = uptoken.getUsername();
		if("unknow".equals(username)){
			throw new UnknownAccountException("�û�������");
		}
		if("monster".equals(username)){
			throw new LockedAccountException("�û�������");
		}
		SysUser user = us.getByName(username);	
		if (user == null) {
			return null;
		}
		ByteSource salt=ByteSource.Util.bytes(username);
		SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(username,user.getLogin_pwd(),salt,getName());
		return info;
		
	}

	public static void main(String[] args){
		String hashAlgorithName="MD5";
		String pass="123456";
		Object salt=ByteSource.Util.bytes("index");
		int count=1024;
		Object result=new SimpleHash(hashAlgorithName, pass,salt,count);
		System.out.println("result:"+result);
	}
	
}
