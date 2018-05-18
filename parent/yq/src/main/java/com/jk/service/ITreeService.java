
package com.jk.service;


import com.jk.bean.wyc.Tree;

import java.util.List;

//import com.jk..Tree;

public interface ITreeService {

	List<Tree> selectTreeList(Tree tree)  throws Exception;

	Tree tuTree(Integer id)  throws Exception;

	void addTree(Tree tree) throws Exception;

	void deleteTree(Integer id) throws Exception;

	void UpdateTree(Tree tree) throws Exception;

	List getTree();
}
