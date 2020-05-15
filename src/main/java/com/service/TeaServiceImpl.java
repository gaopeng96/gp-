package com.service;

import com.dao.TeacherDao;
import com.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class TeaServiceImpl implements TeaService{
    @Autowired
    private TeacherDao teacherDao;

    //用户登录
    @Override
    public Teacher login(Teacher teacher){
        Teacher teacher1 =teacherDao.login(teacher);
        if (teacher1!=null){
            return teacher1;
        }
        return null;
    }

    //查看个人信息
    @Override
    public Teacher infm(Integer tno) {
        return teacherDao.infm(tno);
    }

    //查看历史发布作业记录
    @Override
    public List<Thwork> selectTeaHwork(Integer tno) {
        return teacherDao.selectTeaHwork(tno);
    }

    //查看发布选择题历史
    @Override
    public List<Shwork> selectTeaShwork(int tno) {
        return teacherDao.selectTeaShwork(tno);
    }

    //查看未批改作业记录
    @Override
    public List<Hwork> selectNewHwork(Integer tno) {
        return teacherDao.selectNewHwork(tno);
    }

    //根据hno和sno查看作业
    @Override
    public Hwork selectHworkByShno(Integer hno, Integer sno) {

//        System.out.println("根据hno和sno查看作业");
//        Hwork hwork = teacherDao.selectHworkByShno(hno,sno);
//        model.addAttribute("updateGrade",hwork);
//        System.out.println(hwork.getHcontent());
//        System.out.println("根据hno和sno查看作业2");
//        return "teacher/updateGrade";
        return teacherDao.selectHworkByShno(hno,sno);
    }

    //根据hno查作业
    @Override
    public Hwork selectHworkByHno(Integer hno) {
        return teacherDao.selectHworkByHno(hno);
    }

    //新增作业
    @Override
    public int insertHwork(Thwork thwork) {
        return teacherDao.insertHwork(thwork);
    }

    //新增选择题
    @Override
    public int insertShwork(Shwork shwork) {
        return teacherDao.insertShwork(shwork);
    }

    //删除作业
    @Override
    public int deleteHwork(Integer hno) {
        return teacherDao.deleteHwork(hno);
    }

    //根据cno查sno
    @Override
    public List<Integer> selectStuByCno(Integer cno) {
        return teacherDao.selectStuByCno(cno);
    }

    //根据sno查email
    @Override
    public int selectEmail(Integer sno) {
        return teacherDao.selectEmail(sno);
    }

    //批量新增至学生作业表
    @Override
    public int batchInsert(List<Hwork> list) {
        return teacherDao.batchInsert(list);
    }

    //批量新增至学生选择作业表
    @Override
    public int SHbatchInsert(List<Hworkss> list) {
        return teacherDao.SHbatchInsert(list);
    }

    //批量从学生作业表删除作业
    @Override
    public int batchDelete(Integer hno,List<Hwork> list) {
        return teacherDao.batchDelete(hno,list);
    }

    //批量从学生选择作业表删除
    @Override
    public int SHbatchDelete(Integer hno, List<Hworkss> list) {
        return teacherDao.SHbatchDelete(hno,list);
    }

    //给学生打分
    @Override
    public int updateGrade(Hwork hwork) {
        return teacherDao.updateGrade(hwork);
    }

    //自动给选择题打分
    @Override
    public int updateSGrade(int hno,int sno,String grade) {
        return teacherDao.updateSGrade(hno,sno,grade);
    }

    //查看未提交作业学生
    @Override
    public List<Hwork> selectNotHwork(Integer tno) {
        return teacherDao.selectNotHwork(tno);
    }

    //查看未提交选择题学生
    @Override
    public List<Hworkss> selectNotSHwork(Integer tno) {
        return teacherDao.selectNotSHwork(tno);
    }

    //查看学生成绩
    @Override
    public List<Hwork> showGrade(Integer tno, Integer hno) {
        System.out.println("查看学生成绩impl1");
        System.out.println(tno+hno);
        System.out.println("查看学生成绩impl2");
        return teacherDao.showGrade(tno,hno);
    }

    //查看学生选择题成绩
    @Override
    public List<Hworkss> showSGrade(Integer tno, Integer hno) {
        return teacherDao.showSGrade(tno,hno);
    }


}
