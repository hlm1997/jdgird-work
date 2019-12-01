package com.baizhi.controller;

import com.baizhi.entity.Dept;
import com.baizhi.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("dept")
public class DeptController {
    @Autowired
    DeptService deptService;

    @ResponseBody
    @RequestMapping("findAllDept")
    public void findAllDept(HttpServletResponse response) throws IOException {

       /*
       *
       *<select>
          <option value="1">研发部</option>
        </select>
       *
       *
       * */
        StringBuilder sb = new StringBuilder();
        sb.append("<select>");
        List<Dept> allDept = deptService.findAllDept();
        for (Dept dept : allDept) {
            sb.append("<option value=\"")
                    .append(dept.getId())
                    .append("\">")
                    .append(dept.getName())
                    .append("</option>");
        }
        sb.append("</select>");

        response.setContentType("text/html;charset=utf-8");

        response.getWriter().print(sb.toString());

    }

    @RequestMapping("findAll")
    @ResponseBody
    public List<Dept> findAll() {
        return deptService.findAllDept();
    }


    @ResponseBody
    @RequestMapping("edit")
    public void edit(Dept dept, String oper) {
        if (oper.equals("add")) {
            deptService.saveDept(dept);
        } else if (oper.equals("edit")) {

            deptService.updateDept(dept);

        } else if (oper.equals("del")) {
            deptService.deleteDept(dept.getId());
        }

    }

}