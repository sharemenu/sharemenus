<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
  String path = request.getContextPath();
%>
<footer>
  <div class ="container">
    <p>云杉美菜 @ 2016</p>
 <!-- 菜单样式，给nav.js使用 -->
<p id = "menuStyle" hidden = hidden>
.nav li.active {
	background-color: #346190;
}
.dropdown-submenu { position: relative; }
.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px;
	border-radius: 0 6px 6px 6px;
}
.dropdown-submenu:hover>.dropdown-menu { display: block; }
.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #ccc;
	margin-top: 5px;
	margin-right: -10px;
}
.dropdown-submenu:hover>a:after { border-left-color: #fff; }
.dropdown-submenu.pull-left { float: none; }
.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}</p>
  </div>
</footer>
<script>
  $(function(){
    TMS.lazyLoadCss("<%=path%>/static/css/tms/layout.css")
  })
</script>
<script src="<%=path%>/static/js/nav.js"></script>
