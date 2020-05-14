package com.service;

import com.dao.StudentDao;
import com.pojo.Hwork;
import com.pojo.Hworkss;
import com.pojo.Shwork;
import com.pojo.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class StuServiceImpl implements StuService{
    @Autowired
    private StudentDao studentDao;


    //学生登录
    @Override
    public Student login(Student student){
        Student student1 = studentDao.login(student);
        if (student1!=null){
            return student1;
        }
        return null;
    }

    //查看个人信息
    @Override
    public Student infm(Integer sno) {
        return studentDao.infm(sno);
    }

    //查看个人成绩
    @Override
    public List<Hwork> selectGrade(Integer sno) {
        return studentDao.selectGrade(sno);
    }

    @Override
    public List<Hworkss> selectSGrade(int sno) {
        return studentDao.selectSGrade(sno);
    }


    //查看个人作业
    @Override
    public List<Hwork> selectHwork(Integer sno){
        return  studentDao.selectHwork(sno);
    }

    //查看选择题
    @Override
    public List<Hworkss> selectShwork(Integer sno) {
        return studentDao.selectShwork(sno);
    }

    //做作业，插入答案
    @Override
    public int insertShContent(Hwork hwork){
        return studentDao.insertShContent(hwork);
    }

    //插入选择题答案
    @Override
    public int insertHworkContent(String shcontent,int hno, int sno) {
        return studentDao.insertHworkContent(shcontent,hno,sno);
    }


    //根据作业号查作业
    @Override
    public Hwork selectByHno(int hno, int sno, Model model) {
        return studentDao.selectByHno(hno,sno);
    }

    //根据作业号查选择题
    @Override
    public Hworkss selectShworkByHno(int hno, int sno, Model model) {
        return studentDao.selectShworkByHno(hno,sno);
    }

    //根据作业号查看选择题答案
    @Override
    public Hworkss selectAnswerByHno(int hno) {
        return studentDao.selectAnswerByHno(hno);
    }


}
