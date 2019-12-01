package com.baizhi.service;

import com.baizhi.dao.DeptDao;
import com.baizhi.entity.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {
    @Autowired
    DeptDao deptDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Dept> findAllDept() {
        List<Dept> allDept = deptDao.findAllDept();
        return allDept;
    }

    @Override
    public void saveDept(Dept dept) {
        dept.setId(UUID.randomUUID().toString());
        deptDao.saveDept(dept);
    }

    @Override
    public void updateDept(Dept dept) {
        deptDao.updateDept(dept);
    }

    @Override
    public void deleteDept(String id) {
        deptDao.deleteDept(id);
    }
}
