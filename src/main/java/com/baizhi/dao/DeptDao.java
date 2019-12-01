package com.baizhi.dao;

import com.baizhi.entity.Dept;

import java.util.List;

public interface DeptDao {
    public List<Dept> findAllDept();

    public void saveDept(Dept dept);

    public void updateDept(Dept dept);

    public void deleteDept(String id);

}