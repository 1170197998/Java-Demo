<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="entity.Shopping"%>
<%@page import="dao.ShoppingDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/index.css">
<title>商品浏览</title>
</head>
<body>
	<h2>商品展示</h2>
	<br>

	<div class="contentBox">
		<%
			ShoppingDAO dao = new ShoppingDAO();
			ArrayList<Shopping> list = dao.getAllShopping();
			if (list != null && list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Shopping sh = list.get(i);
		%>
		<div class="item">
			<!-- 点击图片跳转详情页 -->
			<a href="detail.jsp?id=<%=sh.getId()%>"> <img alt=""
				src="images/<%=sh.getPicture()%>" /></a>
			<div class="price">
				¥<%=sh.getPrice()%></div>
			<div class="name"><%=sh.getName()%></div>
			<div class="city">
				产地:<%=sh.getCity()%></div>
		</div>
		<%
			}
			}
		%>
	</div>
</body>
</html>