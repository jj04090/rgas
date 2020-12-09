<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/fixed.css" title="fixed" media="screen" />
	
	<title>환급형 목표 달성 프로젝트</title>

    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if !IE 7]><style>#wrap {display:table;height:100%}</style><![endif]-->
</head>

<body id="loginpage">
    <div class="container_16 clearfix">
        <div class="widget push_5 grid_6" id="login">
            <div class="widget_title"><h2>환급형 목표 달성 프로젝트</h2></div>

            <form action="${pageContext.request.contextPath}/login" method="post" class="form-signin">
	            <div class="widget_body">
	                <div class="widget_content">
	                    <label class="block" for="username">이메일</label>
	                    <input type="text" name="email" class="large"/>
	
	                    <label class="block" for="password">비밀번호</label>
	                    <input type="password" name="password" class="large" />
                        
	                    <div style="margin-top:10px">
	                    	<input type="submit" class="btn right large" style="width: 100%;" value="로그인" />
	                    </div>
	                    <div class="clear"></div>
	                </div>
	            </div>
	    	</form>
        </div>
    </div>
</body>
</html>
