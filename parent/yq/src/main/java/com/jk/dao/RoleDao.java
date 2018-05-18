package com.jk.dao;

import com.jk.bean.wyc.Role;
import com.jk.bean.wyc.Tree;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleDao {

	long selectCount(Role role,@Param("name")String name);

	List<Role> roleList(@Param("start") int start, @Param("rows") int rows, @Param("role") Role role,@Param("name") String name);

	List<Tree> addcharolemenulist(Integer roid);

	List addchamenulist();

	void roleService(@Param("roid") Integer roid);

	void saverolemenulist(@Param("parseInt") int parseInt, @Param("roid") Integer roid);


}
