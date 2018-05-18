package com.jk.service.impl;

import com.jk.dao.IUserDao;
import com.jk.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    @Override
    public List getTree() {
        return userDao.getTree();
    }
}
