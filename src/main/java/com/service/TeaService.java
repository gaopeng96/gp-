package com.service;

import com.pojo.*;
import org.springframework.ui.Model;

import java.util.List;

public interface TeaService {

    Teacher login(Teacher teacher);

    //查看个人信息

    Teacher infm(Integer tno);

    //查询已发布作业
    List<Thwork> selectTeaHwork(Integer tno);

    //查看已发布选择题记录
    List<Shwork> selectTeaShwork(int tno);

    //查询未批改作业
    List<Hwork> selectNewHwork(Integer tno);

    //根据sno和hno查看作业
    Hwork selectHworkByShno(Integer hno,Integer sno);

    //新增作业
    int insertHwork(Thwork thwork);

    //新增选择题
    int insertShwork(Shwork shwork);

    //删除作业
    int deleteHwork(Integer hno);

    //根据cno查询sno
    List<Integer> selectStuByCno(Integer cno);

    //根据sno查email
    int selectEmail(Integer sno);

    //批量新增至学生作业表
    int batchInsert(List<Hwork> list);

    //批量新增至学生选择作业表
    int SHbatchInsert(List<Hworkss> list);

    //批量从学生作业表删除
    int batchDelete(Integer hno,List<Hwork> list);

    //批量从学生选择作业表删除
    int SHbatchDelete(Integer hno,List<Hworkss> list);

    //给学生作业打分
    int updateGrade(Hwork hwork);

    //自动给选择题打分
    int updateSGrade(int hno,int sno,String grade);

    //查看未提交作业学生
    List<Hwork> selectNotHwork(Integer tno);

    //查看未提交选择题
    List<Hworkss> selectNotSHwork(Integer tno);

    //查看学生成绩页面
    List<Hwork> showGrade(Integer tno,Integer hno);

    //查看学生选择题成绩页面
    List<Hworkss> showSGrade(Integer tno,Integer hno);
}
