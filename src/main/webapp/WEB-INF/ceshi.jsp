<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">


    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.1/moment-with-locales.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <script src="lib/layui/layui.js" type="text/javascript"></script>
    <script src="js/admin.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <form class="layui-form layui-form-pane"   role="form" action="/user/insertShwork" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">截止时间</label>
            <div class="layui-input-inline layer-inputs">
                <input type="date" name="endTimes" id="endTimes" class="layui-input" />
            </div>
            <div class="layui-form-mid layui-word-aux">请选择截止时间</div>
        </div>


    </form>
</div>
<script type="text/javascript">

    $("#endTimes").datetimepicker({
        format: "YYYY-MM-DD HH:mm:ss"
    });
</script>
</body>


</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="css/admin.css" media="all">


    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.1/moment-with-locales.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <script src="lib/layui/layui.js" type="text/javascript"></script>
    <script src="js/admin.js" type="text/javascript"></script>
</head>
<body>
<div class="container" id="a">
    <form class="layui-form layui-form-pane" id="insertHwork"  role="form" action="/user/insertShwork" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">截止时间</label>
            <div class="layui-input-inline layer-inputs">
                <input type="datetime-local" name="endTime" id="endTime" class="layui-input" />
            </div>
            <div class="layui-form-mid layui-word-aux">请选择截止时间</div>
        </div>


    </form>
</div>
<script type="text/javascript">

    $("#endTime").datetimepicker({
        format: "YYYY-MM-DD HH:mm:ss"
    });
</script>
</body>


</html>
