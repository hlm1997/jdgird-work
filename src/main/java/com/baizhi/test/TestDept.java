package com.baizhi.test;

import com.baizhi.SpringBoot;
import com.baizhi.dao.DeptDao;
import com.baizhi.entity.Dept;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest(classes = SpringBoot.class)
@RunWith(SpringRunner.class)
public class TestDept {

    @Autowired
    DeptDao deptDao;


    @Test
    public void testfindAll() {
        List<Dept> allDept = deptDao.findAllDept();

        for (Dept dept : allDept) {
            System.out.println(dept);
        }
    }

    @Test
    public void testsave() {
        Dept dept = new Dept();
        dept.setId("3");
        dept.setName("弟弟");
        deptDao.saveDept(dept);
    }

    @Test
    public void testdelete() {
        deptDao.deleteDept("3");
    }
}
