package com.dao;

import com.pojo.Admin;
import com.pojo.Class;
import com.pojo.Notice;
import com.pojo.Student;
import com.pojo.Teacher;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import sun.text.normalizer.NormalizerBase;

import java.util.List;


@Repository
public interface AdminDao {

    //根据账号获取管理员对象
    Admin login(Admin admin);

    //插入公告检测
    int insertCheck(Integer account);

    //插入教师检测
    int insertTeaCheck(Integer account);

    //插入学生检测
    int insertStuCheck(Integer account);

    //插入作业检测
    int insertHworkCheck(Integer account);

    //插入选择题检测
    int insertSHworkCheck(Integer account);

    //插入班级检测
    int insertClassCheck(Integer account);

    //查看公告数
    int selectNoticeNum(Integer count);
    //查看班级数
    int selectClassNum(Integer count);
    //查看教师总数
    int selectTeaNum(Integer count);
    //查看学生总数
    int selectStuNum1(Integer count);
    //*******************班级管理********

    //查看所有班级
    List<Class> selectAllClass();

    //查询班级人数
    List<Integer> selectStuNum();

    //根据cno查班级
    Class selectClassByNo(Integer cno);

    //新增班级
    int insertClass(Class clas);

    //修改班级
    int updateClass(Class clas);
//    ***********公告操作*********

    //查看公告
    List<Notice> selectNotice(Notice notice);

    //根据nno查公告
    Notice selectNoticeByNo(Integer nno, Model model);

    //查看最新公告
    Notice selectNoticeCon(Model model);

    //增加公告
    int insertNotice(Notice notice);

    //修改公告
    int updateNotice(Notice notice);

    //删除公告
    int deleteNotice(Integer nno);

   //  ****************教师操作***************

    //查看所有老师
    List<Teacher> selectTeacher(Teacher teacher);

    //根据tno查看老师
    Teacher selectTeacherByTno(Integer tno,Model model);

    //增加老师
    int insertTeacher(Teacher teacher);

    //修改老师
    int updateTeacher(Teacher teacher);

    //删除老师
    int deleteTeacher(Integer tno);


//    学生操作

    //查看所有学生
    List<Student> selectStudent(Student student);

    //根据sno查看学生
    Student selectStudentByNo(Integer sno,Model model);

    //修改学生
    int updateStudent(Student student);

    //增加学生
    int insertStudent(Student student);

    //删除学生

}
