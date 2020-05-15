package com.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.*;
import com.pojo.Class;
import com.service.AdminService;
import com.service.StuService;
import com.service.TeaService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Controller("stuController")
@RequestMapping("/user")
public class StuController {
    @Autowired
    private StuService stuService;
    @Autowired
    private TeaService teaService;
    @Autowired
    private AdminService adminService;

    @Autowired
    private JavaMailSender javaMailSender;


    //@
    @RequestMapping("/ceshi")
    public String ceshi(){
        return "ceshi";
    }

    //邮件发送
    @RequestMapping("/send")
    public Object sendMail(String sno){
        int sno1 = Integer.parseInt(sno);

        int em1 = teaService.selectEmail(sno1);
        System.out.println("1**"+em1);
        String em = String.valueOf(teaService.selectEmail(sno1));

        System.out.println(em);

        MimeMessage mMessage = javaMailSender.createMimeMessage();///创建邮件对象
        MimeMessageHelper mMessageHelper;
        Properties prop = new Properties();
        String from;
        try{
            //从配置文件中拿到发件人邮箱地址
            System.out.println("发送1~");
            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
            from = prop.get("mail.smtp.username")+"";
            System.out.println(from);
            mMessageHelper = new MimeMessageHelper(mMessage,true);
            mMessageHelper.setFrom(from);//发件人邮箱
            mMessageHelper.setTo(em+"@qq.com");//收件人邮箱
            mMessageHelper.setSubject("邮件主题");
            mMessageHelper.setText("第一封邮件");
            javaMailSender.send(mMessage);
            System.out.println("发送成功~");
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException  e) {
            e.printStackTrace();
        }
        return "forward:/user/selectNotHwork";
    }





    /*
    用户登录，判断登录类型
     */
    @RequestMapping("/aa")
    public String login1(HttpSession session){
        session.invalidate();
        return "login1";
    }


    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model, HttpSession session,String userType){
//        User user = new User();
        //获取前台输入的账号和密码
        Integer id=Integer.valueOf(request.getParameter("user_id"));
        String password = request.getParameter("pwd");
        System.out.println("11111");

        Integer uType = Integer.valueOf(request.getParameter("userType"));
        model.addAttribute("userType",uType);
//        user.setUid(id);
        if(userType!=null&&userType.equals("1")){
            Admin admin = new Admin();
            admin.setAno(id);
            admin.setApwd(password);
            Admin login = adminService.login(admin);
            if(login!=null){
                session.setAttribute("user",login);
                System.out.println("管理员类型：");
                System.out.println(admin.getAno());
                System.out.println(admin.getApwd());
                model.addAttribute("msg","");
                return "main";
            }else{
                model.addAttribute("msg","账号或密码错误");
                System.out.println("管理员错误");
                return "login1";
            }
        }else if(userType!=null&&userType.equals("2")){

            Teacher teacher = new Teacher();
            teacher.setTno(id);
            teacher.setTpwd(password);
            Teacher login = teaService.login(teacher);

            if(login!=null){
                session.setAttribute("user",login);
                System.out.println("教师类型：");
                System.out.println(teacher.getTno());
                System.out.println(teacher.getTpwd());
                model.addAttribute("msg","");
                return "main";
            }else{
                model.addAttribute("msg","账号或密码错误");
                System.out.println("教师错误");
                return "login1";
            }
        }else{

            Student student = new Student();
            student.setSno(id);
            student.setSpwd(password);

            Student login = stuService.login(student);

            if(login!=null){
                session.setAttribute("user",login);
                System.out.println("学生类型：");
                System.out.println(student.getSno());
                System.out.println(student.getSpwd());
                model.addAttribute("msg","");
                return "main";
            }else{
                model.addAttribute("msg","账号或密码错误");
                System.out.println("学生错误");
                return "login1";
            }
        }

    }


    //查看数量
    @RequestMapping("/selectNum")
    public String selectNum(Model model,Integer nNum){
        int noticeNum = adminService.selectNoticeNum(nNum);
        model.addAttribute("noticeNum",noticeNum);

        int classNum = adminService.selectClassNum(nNum);
        model.addAttribute("classNum",classNum);

        int teaNum = adminService.selectTeaNum(nNum);
        model.addAttribute("teaNum",teaNum);

        int stuNum = adminService.selectStuNum1(nNum);
        model.addAttribute("stuNum",stuNum);

        return "AdminConsole";
    }

    //教师首页
    @RequestMapping("/teaConsole")
    public String teaConsole(Notice notice,Model model){
        Notice notices = adminService.selectNoticeCon(model);
        model.addAttribute("notice",notices);
        return "teaConsole";
    }

    //学生首页
    @RequestMapping("/stuConsole")
    public String stuConsole(Notice notice,Model model){
        Notice notices = adminService.selectNoticeCon(model);
        model.addAttribute("notice",notices);
        return "stuConsole";
    }
    /**
     * 学生操作
     *
     */

    //查看个人信息
    @RequestMapping("/stuInfm")
    public String stuInfm(HttpSession session,Model model){
        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();

        Student information = stuService.infm(sno);
        model.addAttribute("information",information);

        int cno = information.getCno();
        Class clas = adminService.selectClassByNo(cno);
        model.addAttribute("clas",clas);

        return "stu/stuInformation1";
    }

    //学生修改个人信息
    @RequestMapping("/updateStudent1")
    public String updateStudent1(Student student){
        int count = adminService.updateStudent(student);
        if(count>0){
            return "forward:/user/stuInfm";
        }else {
            return "forward:/user/showUpdateStudent";
        }
    }

    //显示学生修改个人信息
    @RequestMapping("/showUpdateStudent1")
    public String showUpdateStudent1(HttpSession session,Model model){
        System.out.println("显示学生修改个人信息");
        Student student = (Student) session.getAttribute("user");
        Integer sno = student.getSno();

        Student information = adminService.selectStudentByNo(sno,model);
        model.addAttribute("student",information);

        List<Class> list = adminService.selectAllClass();
        model.addAttribute("classList",list);
        return "stu/updateStuIn1";
    }

    //学生修改密码
    @RequestMapping("/updateStuPwd")
    public String updateStuPwd(Student student){
        int count = adminService.updateStudent(student);
        if(count>0){
            return "forward:/user/aa";
        }else {
            return "forward:/user/showUpdateStuPwd";
        }
    }

    //显示修改密码
    @RequestMapping(value = "/showUpdateStuPwd")
    public String showUpdateStuPwd(HttpSession session,Model model){
        System.out.println("显示修改学生密码");
        Student student = (Student) session.getAttribute("user");
        Integer sno = student.getSno();

        Student information = adminService.selectStudentByNo(sno,model);

        model.addAttribute("student",information);
        return "stu/updateStuPwd1";
    }

    //查看个人作业成绩
    @RequestMapping("/searchGrade")
    public String selectGrade(Integer pageNum,Model model,HttpSession session){
        //获取session域中的用户对象
        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();
        List<Hwork> hwork2 = stuService.selectGrade(sno);
        model.addAttribute("Hwork",hwork2);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        PageInfo<Hwork> pageInfo = new PageInfo<>(hwork2);
        model.addAttribute("pageInfo",pageInfo);
        return "stu/hworkGrade1";
    }

    //查看选择题成绩
    @RequestMapping("/selectSGrade")
    public String selectSGrade(Integer pageNum,Model model,HttpSession session){
        //获取session域中的用户对象
        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();

        List<Hworkss> Hworkss = stuService.selectSGrade(sno);
        model.addAttribute("Hworkss",Hworkss);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        PageInfo<Hworkss> pageInfo = new PageInfo<>(Hworkss);
        model.addAttribute("pageInfo",pageInfo);

        return "stu/shworkGrade1";
    }



    //查看个人新作业
    @RequestMapping("/searchHwork")
    public String selectHwork(Integer pageNum,Model model,HttpSession session){
        //获取session域中的用户对象
        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();

        List<Hwork> hworkList = stuService.selectHwork(sno);
        model.addAttribute("HworkList",hworkList);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        PageInfo<Hwork> pageInfo = new PageInfo<>(hworkList);
        model.addAttribute("pageInfo",pageInfo);
        return "stu/newHwork1";
    }

    //查看选择题
    @RequestMapping("/searchShwork")
    public String searchShwork(Integer pageNum,Model model,HttpSession session){
        //获取session域中的用户对象
        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();

        List<Hworkss> hworkssList = stuService.selectShwork(sno);
        model.addAttribute("hworkssList",hworkssList);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        PageInfo<Hworkss> pageInfo = new PageInfo<>(hworkssList);
        model.addAttribute("pageInfo",pageInfo);
        return "stu/newShwork";
    }

    //做作业，插入答案
    @RequestMapping("/insertShContent")
    public String insertShContent(Hwork hwork){
        int count = stuService.insertShContent(hwork);
        if (count > 0){
            System.out.println("插入作业成功");
            return "forward:/user/searchHwork";
        }else {
            System.out.println("插入作业失败");
            return "forward:/user/insertShContent";
        }
    }

    //插入选择题答案
    @RequestMapping("/insertHworkContent")
    public String insertHworkContent(HttpServletRequest request){
        String shcontent1 =request.getParameter("shcontent");

        int hno1 = Integer.parseInt(request.getParameter("hno"));
        int sno1 = Integer.parseInt(request.getParameter("sno"));

        //插入答案
        System.out.println("asaa"+shcontent1);
        int count = stuService.insertHworkContent(shcontent1,hno1,sno1);

        //比较学生回答和答案是否相同
        Hworkss hworkss=stuService.selectAnswerByHno(hno1);
        String answer = hworkss.getAnswer();
        if(answer.equals(shcontent1)){
            String grade="100";
            teaService.updateSGrade(hno1,sno1,grade);
            System.out.println("自动批改成功100");
        }else {
            String grade="0";
            teaService.updateSGrade(hno1,sno1,grade);
            System.out.println("自动批改成功0分");
        }
        if (count > 0){
            System.out.println("插入答案成功");
            return "forward:/user/searchShwork";
        }else {
            System.out.println("插入答案失败");
            return "forward:/user/insertHworkContent";
        }
    }



    //显示要做作业页面
    @RequestMapping("/showAnswerHwork")
    public String showAnserHwork(String hno,Model model,HttpSession session){
        System.out.println("显示做作业页面");

        int hno1 = Integer.parseInt(hno);
        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();

        Hwork hwork = stuService.selectByHno(hno1,sno,model);

        model.addAttribute("hwork",hwork);
        return "stu/answerHwork";
    }

    //显示做选择题页面
    @RequestMapping("/showAnswerShwork")
    public String showAnswerShwork(String hno,Model model,HttpSession session){
        int hno1 = Integer.parseInt(hno);

        System.out.println("作业好"+hno1);

        Student student = (Student)session.getAttribute("user");
        Integer sno = student.getSno();

        Hworkss hworkss = stuService.selectShworkByHno(hno1,sno,model);

        model.addAttribute("hworkss",hworkss);
        return "stu/answerShwork";
    }

            //    *******老师操作*********//

    //查看个人信息
    @RequestMapping("/infm")
    public String infm(HttpSession session,Model model){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        Teacher information = teaService.infm(tno);
        model.addAttribute("infomation",information);

        int cno = information.getCno();
        Class clas = adminService.selectClassByNo(cno);
        model.addAttribute("clas",clas);
        return "teacher/teaInformation1";

    }

    //老师修改密码
    @RequestMapping("/updateTeaPwd")
    public String updateTeaPwd(Teacher teacher){
        int count = adminService.updateTeacher(teacher);
        if(count>0){
            return "forward:/user/aa";
        }else {
            return "forward:/user/showUpdateTeaPwd";
        }
    }

    //显示修改密码
    @RequestMapping(value = "/showUpdateTeaPwd")
    public String showUpdateTeaPwd(HttpSession session,Model model){
        System.out.println("显示修改老师密码");
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        Teacher information = adminService.selectTeacherByTno(tno,model);
        model.addAttribute("teacher",information);

        return "teacher/updateTeaPwd1";
    }

    //教师修改个人信息
    @RequestMapping("/updateTeacher1")
    public String updateTeacher1(Teacher teacher){
        int count = adminService.updateTeacher(teacher);
        if(count > 0){
            return "forward:/user/infm";
        }else {
            return "forward:/user/showUpdateTeacher1";
        }
    }

    //显示教师修改个人信息
    @RequestMapping("/showUpdateTeacher1")
    public String showUpdateTeacher1(HttpSession session,Model model){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        Teacher information = adminService.selectTeacherByTno(tno,model);
        model.addAttribute("teacher",information);

        List<Class> list = adminService.selectAllClass();
        model.addAttribute("classList",list);

        return "teacher/updateTeaIn1";
    }

    //查看作业发布记录
    @RequestMapping("/selectTeaHwork")
    public String selectTeaHwork(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        List<Thwork> thworkList = teaService.selectTeaHwork(tno);
        model.addAttribute("tHworkList",thworkList);

        PageInfo<Thwork> pageInfo = new PageInfo<>(thworkList);
        model.addAttribute("pageInfo",pageInfo);
        return "teacher/teaHwork1";
    }

    //查看选择题发布记录
    @RequestMapping("/selectTeaShwork")
    public String selectTeaShwork(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        List<Shwork> shworkList = teaService.selectTeaShwork(tno);
        model.addAttribute("shworkList",shworkList);

        PageInfo<Shwork> pageInfo = new PageInfo<>(shworkList);
        model.addAttribute("pageInfo",pageInfo);
        return "teacher/teaShwork";
    }


    //查看未批改作业
    @RequestMapping("/selectNewHwork")
    public String selectNewHwork(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        List<Hwork> newHworkList = teaService.selectNewHwork(tno);
        model.addAttribute("newHworkList",newHworkList);

        PageInfo<Hwork> pageInfo = new PageInfo<>(newHworkList);
        model.addAttribute("pageInfo",pageInfo);
        return "teacher/teaNewHwork1";
    }


    //新增作业
    @RequestMapping("/insertHwork")
    public String insertHwork(Model model,Thwork thwork){
        int acount = teaService.insertHwork(thwork);
        System.out.println("获取选择的cno");
        System.out.println(thwork.getClas().getCno());
        if(acount>0){
            //查询sno
            List<Integer> snoList = teaService.selectStuByCno(thwork.getClas().getCno());
            List<Hwork> hworkList = new ArrayList<>();
            for(Integer sno : snoList){
                Hwork hwork = new Hwork();
                hwork.setCno(thwork.getClas().getCno());
                hwork.setHno(thwork.getHno());
                hwork.setSno(sno);
                hworkList.add(hwork);
            }
            //批量新增
            int count = teaService.batchInsert(hworkList);
            System.out.println("测试批量新增是否成功"+count);
            return "forward:/user/selectTeaHwork";
        }
        return "forward:/user/selectTeaHwork";
    }

    //显示新增作业
    @RequestMapping("/showInsertHwork")
    public String showInsertHwork(Model model){
        List<Class> list = adminService.selectAllClass();
        model.addAttribute("classList",list);

        return "teacher/addHwork1";
    }

    //新增选择题
    @RequestMapping("/insertShwork")
    public String insertShwork(Shwork shwork){
        int account = teaService.insertShwork(shwork);
        System.out.println(shwork.getClas().getCno());
        if(account>0){
            //查询sno
            List<Integer> snoList = teaService.selectStuByCno(shwork.getClas().getCno());
            List<Hworkss> hworkList = new ArrayList<>();
            for(Integer sno : snoList){
                Hworkss hworkss = new Hworkss();
                hworkss.setCno(shwork.getClas().getCno());
                hworkss.setHno(shwork.getHno());
                hworkss.setSno(sno);
                hworkList.add(hworkss);
            }
            //批量新增
            int count = teaService.SHbatchInsert(hworkList);
            System.out.println("测试选择批量新增是否成功"+count);
            return "forward:/user/selectTeaShwork";
        }
        return "forward:/user/selectTeaShwork";
    }

    //显示新增选择题
    @RequestMapping("/showInsertShwork")
    public String showInsertShwork(Model model){
        List<Class> list = adminService.selectAllClass();
        model.addAttribute("classList",list);

        return "teacher/addSHwork";
    }


    //删除作业
    @RequestMapping("/deleteHwork")
    public String deleteHwork(Thwork thwork,String hno,String cno){
        int hno1 = Integer.parseInt(hno);
        int cno1 = Integer.parseInt(cno);
        int acount = teaService.deleteHwork(hno1);
        System.out.println("获取选择的cno");
        System.out.println(cno1);

        System.out.println("获取选择的hno");
        System.out.println(hno1);

        if(acount>0){
            //查询sno
            List<Integer> snoList = teaService.selectStuByCno(cno1);
            List<Hwork> hworkList = new ArrayList<>();
            for(Integer sno : snoList){
                Hwork hwork = new Hwork();
                hwork.setSno(sno);
                hworkList.add(hwork);
            }
            //批量删除
            int count = teaService.batchDelete(hno1,hworkList);
            System.out.println("测试批量删除是否成功"+count);
            return "forward:/user/selectTeaHwork";
        }
        return "forward:/user/selectTeaHwork";
    }

    //显示作业详情
    @RequestMapping("/showHworkByHno")
    public String showHworkBuHno(String hno,Model model){
        int hno1 = Integer.parseInt(hno);
        Hwork hwork = teaService.selectHworkByHno(hno1);
        model.addAttribute("hwork",hwork);

        return "teacher/showHworkByHno";
    }

    //显示批改页面
    @RequestMapping(value = "/showUpdateGrade/{hno}/{sno}")
    public String showUpdateGrade(@PathVariable @Valid Integer hno,@PathVariable @Valid Integer sno,Model model){
        System.out.println("显示打分页面");
        Hwork hwork = teaService.selectHworkByShno(hno,sno);
        model.addAttribute("updateGrade",hwork);

        return "teacher/updateGrade1";
    }

    //给学生作业打分
    @RequestMapping("/updateGrade")
    public String updateGrade(Hwork hwork){
        int count = teaService.updateGrade(hwork);
        System.out.println("给学生打分");
        System.out.println(count);
        if (count>0){
            System.out.println("修改成功");
            return "forward:/user/selectNewHwork";
        }
        else {
            System.out.println("修改失败");
            return "forward:/user/showUpdateNotice/{nno}";
        }
    }


    //查看学生成绩页面1
    @RequestMapping("/selectGradeByTea")
    public String selectGradeByTea(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        List<Thwork> thworkList = teaService.selectTeaHwork(tno);
        model.addAttribute("tHworkList",thworkList);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        PageInfo<Thwork> pageInfo = new PageInfo<>(thworkList);
        model.addAttribute("pageInfo",pageInfo);
        return "teacher/searchGradeBytea1";
    }

    //查询选择题成绩页面1
    @RequestMapping("/selectSGradeByTea")
    public String selectSGradeByTea(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        List<Shwork> shworkList = teaService.selectTeaShwork(tno);
        model.addAttribute("shworkList",shworkList);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        PageInfo<Shwork> pageInfo = new PageInfo<>(shworkList);
        model.addAttribute("pageInfo",pageInfo);

        return "teacher/searchSGradeBytea";

    }

    //展示学生选择题成绩页面
    @RequestMapping("/showSGrade")
    public String showSGrade(Integer pageNum,String hno,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        int hno1 = Integer.parseInt(hno);

        List<Hworkss> hworkssList = teaService.showSGrade(tno,hno1);
        model.addAttribute("showSGradeList",hworkssList);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        PageInfo<Hworkss> pageInfo = new PageInfo<>(hworkssList);
        model.addAttribute("pageInfo",pageInfo);
        return "teacher/showSGrade";
    }


   //展示学生成绩页面
    @RequestMapping("/showGrade")
    public String showGrade(Integer pageNum,String hno, Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();
        System.out.println(tno);

        int hno1 = Integer.parseInt(hno);

        List<Hwork> hworkList = teaService.showGrade(tno,hno1);
        model.addAttribute("showGradeList",hworkList);
        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        PageInfo<Hwork> pageInfo = new PageInfo<>(hworkList);
        model.addAttribute("pageInfo",pageInfo);
        System.out.println("查看学生成绩controll");
        return "teacher/showGrade1";
    }



    //查看作业未提交页面
    @RequestMapping("/selectNotHwork")
    public  String selectNotHwork(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        List<Hwork> notHwork=teaService.selectNotHwork(tno);
        model.addAttribute("notHworkList",notHwork);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        PageInfo<Hwork> pageInfo = new PageInfo<>(notHwork);
        model.addAttribute("pageInfo",pageInfo);

        return "teacher/teaNotHwork1";
    }

    //查看未提交选择题页面
    @RequestMapping("/selectNotSHwork")
    public String selectNotSHwork(Integer pageNum,Model model,HttpSession session){
        Teacher teacher = (Teacher) session.getAttribute("user");
        Integer tno = teacher.getTno();

        List<Hworkss> notSHwork = teaService.selectNotSHwork(tno);
        model.addAttribute("notSHwork",notSHwork);

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        PageInfo<Hworkss> pageInfo = new PageInfo<>(notSHwork);
        model.addAttribute("pageInfo",pageInfo);

        return "teacher/teaNotSHwork";
    }


      // *************************管理员操作********************************

    //插入公告检测
    @RequestMapping("/insertCheck")
    public String insertCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {

        //获取前台输入的公告编号
        String account = request.getParameter("account");
        Integer nno = Integer.valueOf(account);
        System.out.println("这里是公告检测");
        //获取查询结果
        int check = adminService.insertCheck(nno);
        PrintWriter out = response.getWriter();
        System.out.println("这里是公告检测4");
        if(check>0){
            out.print("true");
            System.out.println("这里是公告检测2");
        }else {
            out.print("false");
            System.out.println("这里是公告检测3");
        }
       return null;
    }

    //插入老师检测
    @RequestMapping("/insertTeaCheck")
    public String insertTeaCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取前台传来的老师编号
        String account = request.getParameter("account");
        Integer tno = Integer.valueOf(account);
        System.out.println("前台传来的老师编号："+tno);
        //获取查询结果
        int check = adminService.insertTeaCheck(tno);
        PrintWriter out = response.getWriter();
        if(check>0){
            out.print("true");
            System.out.println("这里是插入老师检测2");
        }else {
            out.print("false");
            System.out.println("这里是插入老师公告检测3");
        }
        return null;
    }

    //插入学生检测
    @RequestMapping("/insertStuCheck")
    public String insertStuCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取前台传来的老师编号
        String account = request.getParameter("account");
        Integer sno = Integer.valueOf(account);
        System.out.println("前台传来的学生编号："+sno);
        //获取查询结果
        int check = adminService.insertStuCheck(sno);
        PrintWriter out = response.getWriter();
        if(check>0){
            out.print("true");
            System.out.println("这里是插入学生检测2");
        }else {
            out.print("false");
            System.out.println("这里是插入学生公告检测3");
        }
        return null;
    }

    //插入作业检测
    @RequestMapping("/insertHworkCheck")
    public String insertHworkCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取前台传来的作业编号
        String account = request.getParameter("account");
        Integer hno = Integer.valueOf(account);
        System.out.println("前台传来的作业编号："+hno);
        //获取查询结果
        int check = adminService.insertHworkCheck(hno);
        PrintWriter out = response.getWriter();
        if(check>0){
            out.print("true");
            System.out.println("这里是插入作业检测2");
        }else {
            out.print("false");
            System.out.println("这里是插入作业公告检测3");
        }
        return null;
    }

    //插入选择题检测
    @RequestMapping("/insertSHworkCheck")
    public String insertSHworkCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取前台传来的作业编号
        String account = request.getParameter("account");
        Integer hno = Integer.valueOf(account);
        System.out.println("前台传来的作业编号："+hno);

        //获取查询结果
        int check = adminService.insertSHworkCheck(hno);
        PrintWriter out = response.getWriter();
        if(check>0){
            out.print("true");
            System.out.println("这里是插入选择检测2");
        }else {
            out.print("false");
            System.out.println("这里是插入选择检测3");
        }
        return null;
    }


    //插入班级检测
    @RequestMapping("/insertClassCheck")
    public String insertClassCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取前台传来的班级编号
        String account = request.getParameter("account");
        Integer cno = Integer.valueOf(account);
        System.out.println("前台传来的班级编号："+cno);
        //获取查询结果
        int check = adminService.insertClassCheck(cno);
        PrintWriter out = response.getWriter();
        if(check>0){
            out.print("true");
            System.out.println("这里是插入班级检测2");
        }else {
            out.print("false");
            System.out.println("这里是插入班级公告检测3");
        }
        return null;
    }

    //查看所有公告
    @RequestMapping("/selectNotice")
    public String selectNotice(Integer pageNum,Notice notice,Model model){
        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        List<Notice> notices = adminService.selectNotice(notice);
        model.addAttribute("noticeList",notices);

        PageInfo<Notice> pageInfo = new PageInfo<>(notices);
        model.addAttribute("pageInfo",pageInfo);

        return "admin/showNotice1";
    }

    //根据编号查看公告
    @RequestMapping("/selectNoticeByNo")
    public String selectNotcieByNo(String nno,Model model)  {

        int nno1 = Integer.parseInt(nno);
        System.out.println(nno1);
        Notice notice = adminService.selectNoticeByNo(nno1,model);
        model.addAttribute("notice",notice);
        System.out.println(notice.getNno()+notice.getNcontent());
        return "admin/showNotice";
    }

    //显示增加公告
    @RequestMapping("/showAddNotice")
    public String showAddNotice(){
        System.out.println("显示增加公告");
        return "admin/addNotice1";
    }

    //增加公告
    @RequestMapping("/insertNotice")
    public String insertNotice(Notice notice){
        int count = adminService.insertNotice(notice);
        System.out.println("增加公告");
        if (count>0){
            System.out.println("增加公告1");
            return "forward:/user/selectNotice";
        }
        else {
            System.out.println("增加公告2");
            return "forward:/user/showAddNotice";
        }
    }

    //修改公告
    @RequestMapping("/updateNotice")
    public String updateNotice(Notice notice){
        int count = adminService.updateNotice(notice);
        System.out.println("修改");
        System.out.println(count);
        if (count>0){
            System.out.println("修改成功");
            return "forward:/user/selectNotice";
        }
        else {
            System.out.println("修改失败");
            return "forward:/user/showUpdateNotice";
        }
    }

    //显示修改公告
    @RequestMapping("/showUpdateNotice")
    public String showUpdateNotice(String nno,Model model) {
        int nno1 = Integer.parseInt(nno);
        System.out.println("显示修改公告");
        System.out.println(nno1);

        Notice notice = adminService.selectNoticeByNo(nno1,model);
        model.addAttribute("notice",notice);

        return "admin/updateNotice1";
    }

    //删除公告
    @RequestMapping("/deleteNotice")
    public String deleteNotice(String nno,HttpServletResponse response,HttpServletRequest request) throws IOException {
//        String account = request.getParameter("id");
//        Integer nno1 = Integer.valueOf(account);

        int nno1 = Integer.parseInt(nno);
        int count = adminService.deleteNotice(nno1);

        PrintWriter out = response.getWriter();
        if (count > 0){
            out.print("true");
            return "forward:/user/selectNotice";
        }else{
            out.print("false");
            return "forward:/user/";
        }
    }


    //查看所有班级
    @RequestMapping("/selectClass")
    public String selectClass(Integer pageNum,Model model){
        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

//        List<Class> list = adminService.selectAllClass();
//        model.addAttribute("classList",list);

        List<Integer> list1=adminService.selectStuNum();
        model.addAttribute("numList",list1);

        PageInfo<Integer> pageInfo = new PageInfo<>(list1);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/showClass1";
    }

    //增加班级
    @RequestMapping("/insertClass")
    public String insertClass(Class clas){
        int count = adminService.insertClass(clas);
        if (count>0)
        {
            System.out.println("增加班级成功");
            return "forward:/user/selectClass";
        }
        else {
            System.out.println("增加班级失败");
            return "forward:/user/showInsertClass";
        }
    }

    //显示新增班级
    @RequestMapping("/showInsertClass")
    public String showInsertClass(){
        return "admin/addClass";
    }

    //修改班级信息
    @RequestMapping("/updateClass")
    public String updateClass(Class clas){
        int count = adminService.updateClass(clas);
        if(count>0){
            return "forward:/user/selectClass";
        }else {
            return "forward:/user/showUpdateClass";
        }
    }

    //显示修改班级信息
    @RequestMapping("/showUpdateClass")
    public String showUpdateClass(String cno,Model model){
        System.out.println("显示修改班级信息");

        int cno1 = Integer.parseInt(cno);
        Class clas = adminService.selectClassByNo(cno1);
        model.addAttribute("clas",clas);

        return "admin/updateClass1";
    }


    //查看所有学生
    @RequestMapping("/selectStudent")
    public String selectStudent(Integer pageNum,Student student,Model model){

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }
        //分页
        List<Student> students = adminService.selectStudent(student);

        PageInfo<Student> pageInfo = new PageInfo<>(students);

        model.addAttribute("studentList",students);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/showStudent1";
    }

    //增加学生
    @RequestMapping("/insertStudent")
    public String insertStudent(Student student){
        int count = adminService.insertStudent(student);
        if (count>0)
        {
            return "forward:/user/selectStudent";
        }
        else {

            return "forward:/user/insertStudent";
        }
    }

    //显示新增学生
    @RequestMapping("/showInsertStudent")
    public String selectAllClass1(Model model){
        List<Class> list = adminService.selectAllClass();

        model.addAttribute("classList",list);
        System.out.println(list);
        return "admin/addStudent1";
    }

    //修改学生信息
    @RequestMapping("/updateStudent")
    public String updateStudent(Student student){
        int count = adminService.updateStudent(student);
        if(count>0){
            return "forward:/user/selectStudent";
        }else {
            return "forward:/user/showUpdateStudent";
        }
    }

    //显示修改学生信息
    @RequestMapping("/showUpdateStudent")
    public String showUpdateStudent(String sno,Model model){
        System.out.println("显示修改学生信息");

        int sno1 = Integer.parseInt(sno);
        Student student = adminService.selectStudentByNo(sno1,model);
        model.addAttribute("student",student);

        List<Class> list = adminService.selectAllClass();
        model.addAttribute("classList",list);
        return "admin/updateStudent1";
    }

    //查看所有老师
    @RequestMapping("/selectTeacher")
    public String selectTeacher(Integer pageNum,Teacher teacher,Model model){

        if(pageNum!=null){
            PageHelper.startPage(pageNum, 5);
        }else{
            PageHelper.startPage(1,  5);
        }

        List<Teacher> teachers = adminService.selectTeacher(teacher);
        model.addAttribute("teacherList",teachers);

        PageInfo<Teacher> pageInfo = new PageInfo<>(teachers);
        model.addAttribute("pageInfo",pageInfo);

        return "admin/showTeacher1";
    }

    //新增老师
    @RequestMapping("/insertTeacher")
    public String insertTeacher(Teacher teacher){
        int count = adminService.insertTeacher(teacher);
        if (count>0)
        {
            return "forward:/user/selectTeacher";
        }
        else {

            return "forward:/user/insertTeacher";
        }
    }

    //显示新增老师
    @RequestMapping("/showInsertTeacher")
    public String selectAllClass(Model model){
        List<Class> list = adminService.selectAllClass();

        model.addAttribute("classList",list);
        System.out.println(list);
        return "admin/addTeacher1";
    }

    //修改老师信息
    @RequestMapping("/updateTeacher")
    public String updateTeacher(Teacher teacher){
        int count = adminService.updateTeacher(teacher);
        if(count>0){
            return "forward:/user/selectTeacher";
        }else {
            return "forward:/user/showUpdateTeacher";
        }
    }

    //显示修改老师信息
    @RequestMapping("/showUpdateTeacher")
    public String showUpdateTeacher(String tno,Model model){
        System.out.println("显示修改老师信息");
        int tno1 = Integer.parseInt(tno);
        Teacher teacher = adminService.selectTeacherByTno(tno1,model);
        model.addAttribute("teacher",teacher);

        List<Class> list = adminService.selectAllClass();
        model.addAttribute("classList",list);
        return "admin/updateTeacher1";
    }

    //删除老师
    @RequestMapping("/deleteTeacher")
    public String deleteTeacher(String tno){
        int tno1 = Integer.parseInt(tno);
        adminService.deleteTeacher(tno1);
        return "forward:/user/selectTeacher";
    }
}
