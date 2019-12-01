package com.baizhi.service;

import com.baizhi.entity.Dept;

import java.util.List;

public interface DeptService {
    public List<Dept> findAllDept();

    public void saveDept(Dept dept);

    public void updateDept(Dept dept);

    public void deleteDept(String id);
}
