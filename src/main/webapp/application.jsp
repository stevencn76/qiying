<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.admission.util.*, java.sql.Timestamp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上海闵行区启英幼儿园招生报名</title>
<link rel="stylesheet" type="text/css" href="plugins/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="plugins/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/my.css">
<script type="text/javascript" src="plugins/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="plugins/json2.js"></script>
<script type="text/javascript" src="plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/pages/application.js"></script>
</head>
<%
Timestamp startTime = Profile.getInstance().getStartApplicationTime();
String startTimeStr = TimeUtil.getStringTimestamp(startTime);
Timestamp endTime = Profile.getInstance().getEndApplicationTime();
String endTimeStr = TimeUtil.getStringTimestamp(endTime);
String curTimeStr = TimeUtil.getCurTimeString("yyyy年MM月dd日 HH:mm:ss");
%>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="page_body">
<div class="hmenu"><jsp:include page="menu.jsp"></jsp:include></div>
<div class="board">
<div class="title">闵行区启英幼儿园报名登记表</div>
<div class="subtitle"><%= startTimeStr%> ~ <%= endTimeStr%></div>
<div class="block">
<table border="0" cellspacing="0" cellpadding="5">
	<tr>
		<th colspan="6" class="red" align="left">请设定便于记忆的用户名和密码，将来用于查询通知和下载报名表</th>
	</tr>
	<tr>
		<th>用户名</th>
		<td><input id="username" class="easyui-validatebox" style="width: 180px;" type="text" 
			data-options="required:true"></td>
		<th>查询密码</th>
		<td><input id="password" class="easyui-validatebox" style="width: 180px;" type="password" 
			data-options="required:true"></td>
		<th>确认密码</th>
		<td><input id="confirmpassword" class="easyui-validatebox" style="width: 180px;" type="password" 
			data-options="required:true"></td>
	</tr>
</table>
<hr />
<div class="greytable">
	<div style="margin: 5px 0px 5px 0px;">
		<b>申请班级: 小班&nbsp;&nbsp;</b>
		<b>招生对象属性: 
			<input id="candidatetype" class="easyui-combobox" style="width: 120px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/candidatetype_data.json',editable:false">
	    			</input>
	    </b>
	</div>
	<table border="0" cellspacing="1" cellpadding="4" width="100%">
		<tr>
			<th>姓名</th>
			<td><input id="name" class="easyui-validatebox" style="width: 130px;" type="text" 
			data-options="required:true"></input></td>
			<th>曾用名</th>
			<td><input id="formername" class="easyui-validatebox" style="width: 100px;" type="text" 
			data-options="required:false"></td>
			<th>性别</th>
			<td>
				<input id="gender" class="easyui-combobox" style="width: 70px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/gender_data.json',editable:false">
	    			</input>
	    	</td>
			<th>籍贯</th>
			<td><input id="jiguan" class="easyui-validatebox" type="text" style="width: 100px;"
			data-options="required:false"></input></td>
			<th>民族</th>
			<td><input id="ethnicity" class="easyui-validatebox" type="text" style="width: 100px;"
			data-options="required:false"></input></td>
		</tr>
		<tr>
			<th>国别</th>
			<td>
				<input id="nation" class="easyui-validatebox" style="width: 130px;" type="text" value="中国"
					data-options="required:true"></input>
			</td>
			<th>出生日期</th>
			<td><input id="birthday" style="width: 100px;"></input></td>
			<th>独生子女</th>
			<td>
				<input id="onlychild" class="easyui-combobox" style="width: 70px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_data.json',editable:false">
	    			</input>
			</td>
			<th>出生证</th>
			<td>
				<input id="hasbirthcert" class="easyui-combobox" style="width: 70px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/hasno_data.json',editable:false">
	    			</input>
			</td>
			<th>出生地</th>
			<td>
				<input id="birthplace" class="easyui-validatebox" style="width: 100px;" type="text" value=""
					data-options="required:true"></input>
			</td>
		</tr>
		<tr>
			<th colspan="2">是否上过幼儿园</th>
			<td><input id="kindergartened" class="easyui-combobox" style="width: 60px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_data.json',editable:false">
	    			</input></td>
			<th><span id="nurserylabel">幼儿园名称</span></th>
			<td colspan="6"><input id="nursery" class="easyui-validatebox" type="text" name="nursery" 
				style="width: 330px;" data-options="required:false"></input></td>
		</tr>
		<tr>
			<th colspan="2">身份证件类别</th>
			<td colspan="3"><input id="pidtype" class="easyui-combobox" style="width: 200px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/pidtype_data.json',editable:false">
	    			</input></td>
			<th colspan="2">身份证件编号</th>
			<td colspan="3"><input id="pidnumber" class="easyui-validatebox" type="text" name="pidnumber" 
				style="width: 330px;" data-options="required:true"></input></td>
		</tr>
		<tr>
			<th>健康状况</th>
			<td>
				<input id="health" class="easyui-validatebox" style="width: 130px;" type="text" value=""
					data-options="required:true"></input>
			</td>
			<th>有无过敏史</th>
			<td>
				<input id="allergic" class="easyui-combobox" style="width: 70px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/hasno_data.json',editable:false">
	    			</input>
			</td>
			<th>计划免疫证</th>
			<td>
				<input id="immunitycert" class="easyui-combobox" style="width: 70px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/hasno_data.json',editable:false">
	    			</input>
			</td>
			<th>特殊病史</th>
			<td colspan="3">
				<input id="specificdisease" class="easyui-validatebox" style="width: 290px;" type="text" value=""
					data-options="required:false"></input>
			</td>
		</tr>
		<tr>
			<th>户口性质</th>
			<td colspan="2">
				<input id="hknature" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/hknature_data.json',editable:false">
	    			</input>
			</td>
			<th>户籍类别</th>
			<td colspan="3">
				<input id="hktype" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/hktype_data.json',editable:false">
	    			</input>
			</td>
			<th>户籍登记日</th>
			<td colspan="2">
				<input id="hkregdate" style="width: 130px;"></input>
			</td>
		</tr>
		<tr>
			<th>住房性质</th>
			<td>
				<input id="propertynature" class="easyui-combobox" style="width: 130px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/propertynature_data.json',editable:false">
	    			</input>
			</td>
			<th>产证类别</th>
			<td>
				<input id="propertytype" class="easyui-combobox" style="width: 100px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/propertytype_data.json',editable:false">
	    			</input>
			</td>
			<th><span id="propertylabel1"></span></th>
			<td colspan="3">
				<input id="propertynumber" class="easyui-validatebox" type="text" name="propertynumber" style="width:180px;"
	    		 	data-options="required:false">
				<input id="propertyother" class="easyui-validatebox" type="text" name="propertyother" style="width:180px;"
	    		 	data-options="required:false">
			</td>
			<th><span id="propertylabel2">住房登记日期</span></th>
			<td>
				<span id="propertyregdatespan"><input id="propertyregdate" style="width: 100px;"></input></span>
			</td>
		</tr>
	</table>
	<br />
	<table border="0" cellspacing="1" cellpadding="4" width="100%">
		<tr>
			<th>军烈子女</th>
			<td>
				<input id="junlie" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_int_data.json',editable:false">
	    			</input>
	    	</td>
			<th>部队子女</th>
			<td>
				<input id="budui" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_int_data.json',editable:false">
	    			</input>
	    	</td>
			<th>优抚子女</th>
			<td>
				<input id="youfu" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_int_data.json',editable:false">
	    			</input>
	    	</td>
			<th>低保</th>
			<td>
				<input id="dibao" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_int_data.json',editable:false">
	    			</input>
	    	</td>
		</tr>
		<tr>
			<th colspan="2">进程务工人员随迁子女</th>
			<td colspan="2">
				<input id="suiqian" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/yesno_int_data.json',editable:false">
	    			</input>
	    	</td>
			<th colspan="2">留守儿童</th>
			<td colspan="3">
				<input id="liushou" class="easyui-combobox" style="width: 180px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/liushou_data.json',editable:false">
	    			</input>
	    	</td>
		</tr>
	</table>
	<br />
	<table border="0" cellspacing="1" cellpadding="4" width="100%">
		<tr>
			<th rowspan="2">户籍<br/>地址</th>
			<td colspan="6">
				<input id="hkaddress" style="width: 900px;"></input>
	    	</td>
		</tr>
		<tr>
			<th>所属镇(街道)</th>
			<td>
	    		<input id="hktown" class="easyui-validatebox" type="text" name="hktown" style="width:230px;"
	    		 	data-options="required:false">
	    	</td>
	    	<th>所属居委会</th>
	    	<td>
	     		<input id="hkresidentcouncil" class="easyui-validatebox" type="text" name="hktown" style="width:230px;"
	    		 	data-options="required:false">
	    	</td>
	    	<th>邮编</th>
	    	<td><input id="hkpostcode" class="easyui-validatebox" type="text" name="hktown" style="width:100px;"
	    		 	data-options="required:false"></td>
		</tr>
		<tr>
			<th rowspan="2">产权<br/>地址</th>
			<td colspan="6">
				<input id="praddress" style="width: 900px;"></input>
	    	</td>
		</tr>
		<tr>
			<th>所属镇(街道)</th>
			<td>
	    		<input id="prtown" class="easyui-validatebox" type="text" name="hktown" style="width:230px;"
	    		 	data-options="required:false">
	    	</td>
	    	<th>所属居委会</th>
	    	<td>
	     		<input id="prresidentcouncil" class="easyui-validatebox" type="text" name="hktown" style="width:230px;"
	    		 	data-options="required:false">
	    	</td>
	    	<th>邮编</th>
	    	<td><input id="prpostcode" class="easyui-validatebox" type="text" name="hktown" style="width:100px;"
	    		 	data-options="required:false"></td>
		</tr>
		<tr>
			<th rowspan="2">现住<br/>地址</th>
			<td colspan="6">
				<input id="lvaddress" class="easyui-validatebox" type="text" style="width: 900px;"	data-options="required:true"></input>
	    	</td>
		</tr>
		<tr>
			<th>所属镇(街道)</th>
			<td>
	    		<input id="lvtown" class="easyui-validatebox" type="text" name="hktown" style="width:230px;"
	    		 	data-options="required:false">
	    	</td>
	    	<th>所属居委会</th>
	    	<td>
	     		<input id="lvresidentcouncil" class="easyui-validatebox" type="text" name="hktown" style="width:230px;"
	    		 	data-options="required:false">
	    	</td>
	    	<th>邮编</th>
	    	<td><input id="lvpostcode" class="easyui-validatebox" type="text" name="hktown" style="width:100px;"
	    		 	data-options="required:false"></td>
		</tr>
	</table><br />
	<table border="0" cellspacing="1" cellpadding="4" width="100%">
		<tr>
			<th colspan="9">家长信息</th>
		</tr>
		<tr>
			<th>称谓</th><th>姓名</th><th>文化程度</th><th>身份证</th><th>工作单位及地址</th><th>居住证(非沪籍)</th><th>职务</th><th>联系电话</th><th>手机号码</th>
		</tr>
		<tr>
			<td>父</td>
			<td>
				<input id="name1" class="easyui-validatebox" type="text" style="width: 80px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="education1" class="easyui-combobox" style="width: 90px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/education_data.json',editable:false">
	    		</input>
			</td>
			<td>
				<input id="idnumber1" class="easyui-validatebox" type="text" style="width: 130px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="company1" class="easyui-validatebox" type="text" style="width: 130px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="residentpermit1" class="easyui-validatebox" type="text" style="width: 130px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="position1" class="easyui-validatebox" type="text" style="width: 50px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="phone1" class="easyui-validatebox" type="text" style="width: 100px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="mobile1" class="easyui-validatebox" type="text" style="width: 100px;"
					data-options="required:false"></input>
			</td>
		</tr>
		<tr>
			<td>母</td>
			<td>
				<input id="name2" class="easyui-validatebox" type="text" style="width: 80px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="education2" class="easyui-combobox" style="width: 90px;"
	    			data-options="valueField:'id',textField:'text',url:'json_data/education_data.json',editable:false"></input>
			</td>
			<td>
				<input id="idnumber2" class="easyui-validatebox" type="text" style="width: 130px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="company2" class="easyui-validatebox" type="text" style="width: 130px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="residentpermit2" class="easyui-validatebox" type="text" style="width: 130px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="position2" class="easyui-validatebox" type="text" style="width: 50px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="phone2" class="easyui-validatebox" type="text" style="width: 100px;"
					data-options="required:false"></input>
			</td>
			<td>
				<input id="mobile2" class="easyui-validatebox" type="text" style="width: 100px;"
					data-options="required:false"></input>
			</td>
		</tr>
	</table>
	<br />
	<table border="0" cellspacing="1" cellpadding="4" width="100%">
		<tr>
			<th>家长需要特别说明或解释的情况</th>
		</tr>
		<tr>
			<td><input id="remark" class="easyui-validatebox" type="text" style="width: 950px; height: 40px;"
				data-options="required:false"></input></td>
		</tr>
	</table>
</div>
<div style="margin: 15px 5px 5px 5px; text-align: center;">
<table align="center" cellspacing="10">
<tr>
	<td>
	<%
	if(curTimeStr.compareTo(startTimeStr) < 0) {
	%>
	<span style="font-size: 14px; font-weight: bold; color: red;">报名还没开始</span>
	<%
	} else if(curTimeStr.compareTo(endTimeStr) > 0) {
	%>
	<span style="font-size: 14px; font-weight: bold; color: red;">报名已经截止</span>
	<%
	} else {
	%>
	<a id="submitbtn" href="#" onClick="submitApplication()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">提交报名表</a>
	<%
	}
	%>
	</td>
	<td>
	</td>
</tr>
</table>
</div>
</div>
</div>
<div id="resultdlg">
<div class="blacktipblock">报名登记成功, 报名号： <span id="applicationid"></span></div>
</div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>