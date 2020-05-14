package com.service;

import com.pojo.Hwork;
import com.pojo.Hworkss;
import com.pojo.Shwork;
import com.pojo.Student;
import org.springframework.ui.Model;

import java.util.List;

public interface StuService {

    //学生登录
    Student login(Student student);

    //查看个人信息
    Student infm(Integer sno);

    //查看个人作业成绩by sno
   List<Hwork> selectGrade(Integer sno);

   //查看选择题成绩
    List<Hworkss> selectSGrade(int sno);

    //查看个人作业
    List<Hwork> selectHwork(Integer sno);

    //查看选择题
    List<Hworkss> selectShwork(Integer sno);

   //做作业，插入答案
  int insertShContent(Hwork hwork);

   //插入选择题答案
   int insertHworkContent(String shcontent,int hno,int sno);

    //根据作业号查作业
    Hwork selectByHno(int hno,int sno, Model model);

    //根据作业号查选择题
    Hworkss selectShworkByHno(int hno,int sno,Model model);

    //根据作业号查选择题答案
    Hworkss selectAnswerByHno(int hno);
}
