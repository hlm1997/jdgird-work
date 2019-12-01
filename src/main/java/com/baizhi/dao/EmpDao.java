package com.baizhi.dao;

import com.baizhi.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpDao {
    public List<Emp> findAll();

    public List<Emp> findAllEmpAndDept();

    public List<Emp> findAllByPage(@Param("start") int start, @Param("rows") int rows);

    public Integer count();

    public void save(Emp emp);

    public void update(Emp emp);

    public void delete(String id);

}
