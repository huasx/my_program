<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head> 
<script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#testJson").click(function(){
            var url = this.href;
            var args = {};
            $.post(url, args, function(data){
                console.log(data)
                for(var i = 0; i < data.length; i++){
                    var id = data[i].id;
                    var lastName = data[i].lastName;
                    alert(id + ": " + lastName);
                }
            });
            return false;
        });
    })
</script>
<body>
    <a href="testSimpleMappingExceptionResolver?i=2">测试SimpleMappingExceptionResolver映射指定异常到对应页面</a>
    <br>
    <a href="testDefaultHandlerExceptionResolver">测试异常处理DefaultHandlerExceptionResolver处理springMVC指定的异常返回对应Http状态</a>
    <br>
    <a href="testResponseStatusExceptionResolver?i=13">测试异常处理ResponseStatusExceptionResolver使用 @ResponseStatus 返回http状态</a>
    <br><br>
    <a href="testExceptionHandlerReslover?i=10">测试springMVC异常处理</a>
    <!-- 测试文件上传 -->
    <h4>测试文件上传</h4>
    <form action="testFileUpload" method="POST" enctype="multipart/form-data">
        File: <input type="file" name="file"/><br>
        Desc: <input type="text" name="desc"/><br>
        <input type="submit" value="Submit"/>
    </form>
    
    <br><br>

    <a href="testJson" id="testJson">ajax测试返回json格式的数据</a>
    <br><br>
        <!-- 测试返回字符串 -->
    <form action="testHttpMessageConverter" method="POST" enctype="multipart/form-data">
        File: <input type="file" name="file"/>
        Desc: <input type="text" name="desc"/>
        <input type="submit" value="Submit"/>
    </form>
    <br><br>
    <!-- 测试下载文件 -->
    <a href="testResponseEntity">Test ResponseEntity</a>
    
        <!--  
        关于国际化:
        1. 在页面上能够根据浏览器语言设置的情况对文本(不是内容), 时间, 数值进行本地化处理
        2. 可以在 bean 中获取国际化资源文件 Locale 对应的消息
        3. 可以通过超链接切换 Locale, 而不再依赖于浏览器的语言设置情况
        
        解决:
        1. 使用 JSTL 的 fmt 标签
        2. 在 bean 中注入 ResourceBundleMessageSource 的示例, 使用其对应的 getMessage 方法即可
        3. 配置 LocalResolver 和 LocaleChangeInterceptor
    -->
    <!-- 测试国际化 -->
    <a href="i18n" >i18n Page</a>
</body>
</html>