package com.baizhi.test;

import com.baizhi.SpringBoot;
import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Emp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest(classes = SpringBoot.class)
@RunWith(SpringRunner.class)
public class testEmp {
    @Autowired
    EmpDao empDao;

    @Test
    public void testfindAll() {
        List<Emp> all = empDao.findAll();
        for (Emp emp : all) {
            System.out.println(emp);
        }
    }

}
