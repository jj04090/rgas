<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google.">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template, eCommerce dashboard, analytic dashboard">
    <meta name="author" content="ThemeSelect">
    <title>환급형 목표달성 서비스 | CHEERUP</title>
    <link rel="apple-touch-icon" href="/images/favicon/favicon_1.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon/favicon_1.ico">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- BEGIN: VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="/vendors/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/flag-icon/css/flag-icon.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/dropify/css/dropify.min.css">
    <link rel="stylesheet" type="text/css" href="/fonts/fontawesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/flag-icon/css/flag-icon.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/dropify/css/dropify.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/data-tables/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css">
     <link rel="stylesheet" type="text/css" href="/css/pages/page-contact.css">
    <!-- END: VENDOR CSS-->
    <!-- BEGIN: Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="/css/themes/horizontal-menu-template/materialize.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/horizontal-menu-template/style.css">
    <link rel="stylesheet" type="text/css" href="/css/layouts/style-horizontal.css">
    <link rel="stylesheet" type="text/css" href="/css/pages/component-navbar.css">
    <link rel="stylesheet" type="text/css" href="/css/pages/cards-basic.css">
    <link rel="stylesheet" type="text/css" href="/css/pages/page-users.css">
    <link rel="stylesheet" type="text/css" href="/css/pages/page-contact.css">
    <!-- END: Page Level CSS-->
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/css/custom/custom.css">
    <!-- END: Custom CSS-->
    <style>
		tr:hover {
		  background-color: #CEF6F5;
		}
	</style>
</head>
<!-- END: Head-->

<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">

    <!-- BEGIN: Header-->
    <header class="page-topbar" id="header">
        
        	 <c:if test="${auth eq 'C'}">
	        	 <nav class="navbar-main navbar-color nav-collapsible sideNav-lock navbar-dark gradient-45deg-blue-grey-blue gradient-shadow">
				    <div class="nav-wrapper">
				      <a href="/home" class="brand-logo" style="font-weight:bold;"><img src="/images/logo-4.png" style="width:170px;padding-top:8px;padding-left:10px;height:auto;"/></a>
				      <ul id="nav-mobile" class="right hide-on-med-and-down">
				        <li><a href="/mission" style="font-weight:bold;">미션</a></li>
				        <li><a href="/perform" style="font-weight:bold;">전체 피드</a></li>
	                    <li><a class="waves-effect waves-block waves-light profile-button" href="javascript:void(0);" style="height:64px;" data-target="profile-dropdown">
	                    <i class="material-icons">dehaze</i></a></li>
				      </ul>
	                    <ul class="dropdown-content" id="profile-dropdown">
	                        <li><a class="grey-text text-darken-1" href="/member/${memberValue.no}"><i class="material-icons">person_outline</i> 내 정보</a></li>
	                        <li class="divider"></li>
	                        <li><a class="grey-text text-darken-1" href="/logout"><i class="material-icons">keyboard_tab</i> 로그아웃</a></li>
	                    </ul>
				    </div>
				  </nav> 
			  </c:if>
			  <c:if test="${auth eq 'A'}">
				  <nav class="navbar-main navbar-color nav-collapsible sideNav-lock navbar-dark gradient-45deg-blue-grey-blue gradient-shadow">
				    <div class="nav-wrapper">
				      <a href="/home" class="brand-logo" style="font-weight:bold;"><img src="/images/logo-4.png" style="width:170px;padding-top:8px;padding-left:10px;height:auto;"/></a>
				      <ul id="nav-mobile" class="right hide-on-med-and-down">
				        <li><a href="/member" style="font-weight:bold;">회원 관리</a></li>
				        <li><a href="/report" style="font-weight:bold;">신고 관리</a></li>
				        <li><a href="/donation" style="font-weight:bold;">기부 관리</a></li>
	                    <li><a class="waves-effect waves-block waves-light profile-button" href="javascript:void(0);" style="height:64px;" data-target="profile-dropdown">
	                    <i class="material-icons">dehaze</i></a></li>
				      </ul>
	                    <ul class="dropdown-content" id="profile-dropdown">
	                        <li class="divider"></li>
	                        <li><a class="grey-text text-darken-1" href="/logout"><i class="material-icons">keyboard_tab</i> 로그아웃</a></li>
	                    </ul>
				    </div>
				  </nav>
			  </c:if>
    </header>
    <!-- END: Header-->