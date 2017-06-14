<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>
<%@page import="com.sprucetec.tms.sso.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserInfo userInfo = null;
Role role = null;
User user = null;
if(request.getAttribute("sso.userInfo") != null){
    userInfo = (UserInfo)request.getAttribute("sso.userInfo"); 
    if(userInfo != null){
       role = (Role)userInfo.getRoles().get(request.getAttribute("system_key"));
       user = userInfo.getUser();
    }
}

String tms_basic_domain = (String)request.getAttribute("tms_basic_domain");
String tms_domain = (String)request.getAttribute("tms_domain");
String tmc_domain =(String)request.getAttribute("tmc_domain");
String tmc_monitor_domain =(String)request.getAttribute("tmc_monitor_domain");
String tms_monitor_domain =(String)request.getAttribute("tms_monitor_domain");
String gis_domain =(String)request.getAttribute("gis_domain");
String tms_cookie_name =(String)request.getAttribute("tms_cookie_key");
String tms_cookie_domain =(String)request.getAttribute("tms_env_domain");
String tms_track_domain =(String)request.getAttribute("tms_track_domain");
%>

<script>
window.HOST_TMS_BASIC = "<%=tms_basic_domain%>";
window.HOST_TMS2 = "<%=tms_domain%>";
window.HOST_TMS_CENTER = "<%=tmc_domain%>";
window.HOST_TMC_MONITOR = "<%=tmc_monitor_domain%>";
window.HOST_TMS_MONITOR = "<%=tms_monitor_domain%>";
window.HOST_GIS = "<%=gis_domain%>";
window.HOST_TMS_TRACK = "<%=tms_track_domain%>";
</script>

 <header class = "navbar navbar-static-top" style="display:none;">
  <div class = "container-fluid">
    <div class="navbar-header"><a href="<%=path %>" title="配送系统"><i class="fa fa-truck icon-flipped"></i>TMC</a></div>
    <nav class = "collapse navbar-collapse in" aria-expanded = "false">
        <ul class = "nav navbar-nav navbar-left">
             
        </ul>
			
	  	<ul class="nav navbar-nav navbar-right">
          <li><a href="#"><%=user != null ? user.getName() : "" %>（<%=role != null ? role.getName() : ""%>）</a></li>
          <li><a href="javascript:void(0);" id="logout">退出</a></li> 
          <!-- <li><a href="/admin/ModifyPwd">修改密码</a></li> -->
          <li>
          <span id="city_switch_wrapper">
          <select id="city_switch">
          	<c:forEach var="city" items="${ownCities}">
          		 <option value="${city.id}">${city.value}</option> 
          	</c:forEach>
          </select>
          </span>
          </li>
        </ul>  
    </nav>
  </div>
</header>
<div>
    <ol class="breadcrumb" id="tmc_breadcrumb" style="display: none;margin: 0 15px 10px 15px;">

    </ol>
</div>

<script type="text/javascript">
		$(function() {
			$('#logout').click(function() {
				//退出调用
				$.ajax({
					type : 'POST',
					url : '../sso/logout',
					success : function(data) {
						//alert(data);
						//alert(document.cookie);
						try{
							window.location.href = data.data.url;
						}catch(e){
							window.location.href = eval("("+data+")").data.url;
						}
						
					},
					error : function() {
						alert();
					}
				});
			});
		});
</script>

<script>
$(function(){
	var cookie_city_key = "<%=tms_cookie_name%>"
	var $city_switch = $("#city_switch");
	$city_switch.on("change", function(){
		var city = $(this).val();
    	var exp = new Date(); 
    	exp.setTime(exp.getTime() + 365*24*60*60*1000); 
    	document.cookie = cookie_city_key + '=' + city + ";domain=<%=tms_cookie_domain%>;expires=" + exp.toGMTString() + ";path=/"
		
    	window.location.reload();
	});
	
	var city_cookie = document.cookie.split(";").filter(function(v){
		return (v.split("=")[0].trim() == cookie_city_key);
	})
	if(city_cookie[0] !== void 0) {
		$city_switch.val(city_cookie[0].split("=")[1]);
	}
});
</script> 
<script>
    /**
     * 动态生成面包屑
     * @author xiaofeng
     */
    (function(){
        "use strict"
        var getUrlPath = function(pathname, index) {
            pathname = pathname || window.location.pathname
            return (pathname.split("/").splice(index, 1)[0] || "")
        }

        var getController = function(pathname) {
            return getUrlPath(pathname, -2)
        }

        var getModule = function(pathname) {
            return (getUrlPath(pathname, -3) || "<%=path%>")
        }

        var controllerInfo = {}
        // iter module (ul)
        $(".nav.navbar-nav.navbar-left>li").each(function(){
            var $module = $($(this).children()[0])
            var module = {
                name : $module.html().replace(/\<b class=\"caret\"\>\<\/b\>/, ""),
                path : $module.attr("href").replace(/javascript:void\(0\)/, "#"),
                $el : $module
            }

            $(this).find("ul>li a").each(function() {
                var controller = {
                    path : $(this).attr("href"),
                    name : $(this).html(),
                    $el : $(this)
                }
                
                var ctl = getController(controller.path)
                //console.log(ctl)
                if(controllerInfo[ctl] === void 0) {
                    controllerInfo[ctl] = {
                        module : module,
                        controller : controller
                    }
                } else {
                    // !!! 不同module内controller不能重名
                    console.info(ctl + " controller has exist")
                }
            })
        })

        var info = controllerInfo[getController()]
        if(info) {
            var module = info.module
            var breadCurmb = '<li><a href="<%=path %>/index">首页</a></li>'
            breadCurmb += '<li><a href="' + module.path + '">' + module.name + '</a></li>'
            breadCurmb += '<li class="active">' + info.controller.name + '</li>'
            $("#tmc_breadcrumb").show().html(breadCurmb)
            module.$el.css("background-color", "#346190")
        }

    }());
</script>
