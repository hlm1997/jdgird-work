package com.baizhi.controller;


import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("emp")
public class EmpController {

    @Autowired
    EmpService empService;

    @ResponseBody
    @RequestMapping("findAll")
    public List<Emp> findAll() {
        return empService.findAll();
    }

    @ResponseBody
    @RequestMapping("findAllEmpAndDept")
    public List<Emp> findAllEmpAndDept() {
        return empService.findAllEmpAndDept();
    }

    @ResponseBody
    @RequestMapping("findAllByPage")
    public Map<String, Object> findAllByPage(Integer page, Integer rows) {

        /*
         * total 总页数
         * page 当前页
         * records 总条数
         * rows 数据集合
         *
         * */
        Map<String, Object> map = new HashMap<>();
        Integer count = empService.count();
        long total = count % rows == 0 ? count / rows : count / rows + 1;
        List<Emp> allByPage = empService.findAllByPage(page, rows);
        map.put("rows", allByPage);
        map.put("page", page);
        map.put("records", count);
        map.put("total", total);
        return map;
    }

    @ResponseBody
    @RequestMapping("edit")
    public void edit(Emp emp, String oper) {

        if (oper.equals("add")) {

            empService.save(emp);
        } else if (oper.equals("edit")) {

            empService.update(emp);

        } else if (oper.equals("del")) {
            empService.delete(emp.getId());
        }

    }
}
