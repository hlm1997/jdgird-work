package com.baizhi.service;

import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {

    @Autowired
    EmpDao empDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findAll() {
        return empDao.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findAllEmpAndDept() {
        return empDao.findAllEmpAndDept();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findAllByPage(Integer page, Integer rows) {
        int start = (page - 1) * rows;
        List<Emp> allByPage = empDao.findAllByPage(start, rows);

        return allByPage;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer count() {
        Integer count = empDao.count();
        return count;
    }


    @Override
    public void save(Emp emp) {

        emp.setId(UUID.randomUUID().toString());

        empDao.save(emp);
    }

    @Override
    public void update(Emp emp) {
        empDao.update(emp);
    }

    @Override
    public void delete(String id) {
        empDao.delete(id);
    }
}
