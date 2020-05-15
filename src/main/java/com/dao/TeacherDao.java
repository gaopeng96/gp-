package com.dao;

import com.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherDao {
    //教师登录
    Teacher login(Teacher teacher);

    //查看个人信息
    Teacher infm(Integer tno);

    //查询已发布的作业
    List<Thwork> selectTeaHwork(Integer tno);

    //查看选择题发布记录
    List<Shwork> selectTeaShwork(int tno);

    //查询未批改作业
    List<Hwork> selectNewHwork(Integer tno);

    //根据sno和hno查看作业
    Hwork selectHworkByShno(Integer sno,Integer hno);

    //根据hno查看作业
    Hwork selectHworkByHno(Integer hno);

    //根据hno查看选择题
    Shwork selectShworkByHno(Integer hno);

    //给学生打分
    int updateGrade(Hwork hwork);

    //自动给选择题打分
    int updateSGrade(@Param("hno")int hno, @Param("sno")int sno, @Param("grade")String grade);

    //展示学生成绩
    List<Hwork> showGrade(Integer tno,Integer hno);

    //查看学生选择题成绩
    List<Hworkss> showSGrade(@Param("tno")Integer tno,@Param("hno")Integer hno);

    //查看未提交作业学生
    List<Hwork> selectNotHwork(Integer tno);

    //查看选择题未提交学生
    List<Hworkss> selectNotSHwork(Integer tno);

    //新增作业
    int insertHwork(Thwork thwork);

    //新增选择题
    int insertShwork(Shwork shwork);

    //修改作业
    int updateHwork(Thwork thwork);

    //删除作业
    int deleteHwork(Integer hno);

    //根据cno查sno
    List<Integer> selectStuByCno(Integer cno);

    //根据sno查学生email
    int selectEmail(Integer sno);

    //批量向学生作业表插入作业
    int batchInsert(List<Hwork> list);

    //批量向学生选择作业表插入作业
    int SHbatchInsert(List<Hworkss> list);

    //批量从学生作业表删除作业
    int batchDelete(Integer hno,List<Hwork> list);

    //批量从学生选择作业表删除迆
    int SHbatchDelete(Integer hno,List<Hworkss> list);
}
