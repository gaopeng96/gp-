package com.service;

import com.dao.AdminDao;
import com.github.pagehelper.PageHelper;
import com.pojo.Admin;
import com.pojo.Class;
import com.pojo.Notice;
import com.pojo.Student;
import com.pojo.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.rmi.MarshalledObject;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    //登录
    @Override
    public Admin login(Admin admin){
        Admin admin1 =adminDao.login(admin);
        if (admin1!=null){
            return admin1;
        }
        return null;
    }

    //检测各数量
    @Override
    public int selectNoticeNum(Integer count) {
        return adminDao.selectNoticeNum(count);
    }

    @Override
    public int selectClassNum(Integer count) {
        return adminDao.selectClassNum(count);
    }

    @Override
    public int selectTeaNum(Integer count) {
        return adminDao.selectTeaNum(count);
    }

    @Override
    public int selectStuNum1(Integer count) {
        return adminDao.selectStuNum1(count);
    }

    //查询所有公告
    @Override
    public List<Notice> selectNotice(Notice notice) {

        return adminDao.selectNotice(notice);
    }


    //根据nno查询公告
    @Override
    public Notice selectNoticeByNo(Integer nno,Model model) {
        System.out.println("修改公关稿");
        return adminDao.selectNoticeByNo(nno,model);
    }

    //查看最新公告
    @Override
    public Notice selectNoticeCon(Model model) {
        return adminDao.selectNoticeCon(model);
    }

    //插入公告检测
    @Override
    public int insertCheck(Integer account) {
        int i = adminDao.insertCheck(account);
        if(i!=0){
            return i;
        }
        return 0;
    }

    //插入老师检测
    @Override
    public int insertTeaCheck(Integer account) {
        int i = adminDao.insertTeaCheck(account);
        if(i!=0){
            return i;
        }
        return 0;
    }

    //插入学生检测
    @Override
    public int insertStuCheck(Integer account) {
        int i = adminDao.insertStuCheck(account);
        if(i!=0){
            return i;
        }
        return 0;
    }

    //插入作业检测
    @Override
    public int insertHworkCheck(Integer account) {
        int i = adminDao.insertHworkCheck(account);
        if(i!=0){
            return i;
        }
        return 0;
    }

    //插入选择题检测
    @Override
    public int insertSHworkCheck(Integer account) {
        int i = adminDao.insertSHworkCheck(account);
        if(i!=0){
            return i;
        }
        return 0;
    }

    //插入班级检测
    @Override
    public int insertClassCheck(Integer account) {
        int i = adminDao.insertClassCheck(account);
        if(i!=0){
            return i;
        }
        return 0;
    }

    //增加公告
    @Override
    public int insertNotice(Notice notice) {
        return adminDao.insertNotice(notice);
    }

    //修改公告
    @Override
    public int updateNotice(Notice notice) {
        System.out.println("修改公告impl");
        return adminDao.updateNotice(notice);
    }

    //删除公告
    @Override
    public int deleteNotice(Integer nno) {
        return adminDao.deleteNotice(nno);
    }

//    ***************教师操作***************


    //查询所有老师
    @Override
    public List<Teacher> selectTeacher(Teacher teacher) {
        return adminDao.selectTeacher(teacher);
    }

    //根据tno查询老师
    @Override
    public Teacher selectTeacherByTno(Integer tno, Model model) {
        return adminDao.selectTeacherByTno(tno,model);
    }

    //增加老师
    @Override
    public int insertTeacher(Teacher teacher){
        return adminDao.insertTeacher(teacher);
    }

    //修改老师
    @Override
    public int updateTeacher(Teacher teacher) {
        return adminDao.updateTeacher(teacher);
    }

    //删除老师
    @Override
    public int deleteTeacher(Integer tno) {
        return adminDao.deleteTeacher(tno);
    }

    //查看所有班级
    @Override
    public List<Class> selectAllClass() {
        return adminDao.selectAllClass();
    }

    //查看班级人数
    @Override
    public List<Integer> selectStuNum() {
        return adminDao.selectStuNum();
    }

    //根据cno查班级
    @Override
    public Class selectClassByNo(Integer cno) {
        return adminDao.selectClassByNo(cno);
    }


    //增加班级
    @Override
    public int insertClass(Class clas) {
        return adminDao.insertClass(clas);
    }

    //修改班级
    @Override
    public int updateClass(Class clas) {
        return adminDao.updateClass(clas);
    }


    //    ***************学生操作***************

    //查看所有学生
    @Override
    public List<Student> selectStudent(Student student) {


        return adminDao.selectStudent(student);
    }

    //根据sno查学生
    @Override
    public Student selectStudentByNo(Integer sno, Model model) {
        return adminDao.selectStudentByNo(sno,model);
    }

    //修改学生
    @Override
    public int updateStudent(Student student) {
        return adminDao.updateStudent(student);
    }

    //增加学生
    @Override
    public int insertStudent(Student student) {
        return adminDao.insertStudent(student);
    }

}
