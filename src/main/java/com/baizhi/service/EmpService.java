package com.baizhi.service;

import com.baizhi.entity.Emp;

import java.util.List;

public interface EmpService {
    public List<Emp> findAll();

    public List<Emp> findAllEmpAndDept();

    public List<Emp> findAllByPage(Integer page, Integer rows);

    public Integer count();

    public void save(Emp emp);

    public void update(Emp emp);

    public void delete(String id);
}
