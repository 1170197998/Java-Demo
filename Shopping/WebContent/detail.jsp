<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="entity.Shopping"%>
<%@page import="dao.ShoppingDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/detail.css">
<title>详情页</title>
</head>
<body>

	<h1>商品详情</h1>
	<br>

	<%
		ShoppingDAO dao = new ShoppingDAO();
		Shopping sh = dao.getShoppingById(Integer.parseInt(request.getParameter("id")));
		if (sh != null) {
	%>
	<div class="content">
		<img alt="" src="images/<%=sh.getPicture()%>">
		<div class="rightBox">
			<div class="name"><%=sh.getName()%></div>
			<div class="price">
				¥
				<%=sh.getPrice()%></div>
			<div class="city">
				产地：<%=sh.getCity()%></div>
			<div class="sales">
				销量：<%=sh.getNumber()%>件
			</div>
		</div>
	</div>
	<%
		}
	%>

	<!-- 浏览历史记录 -->
	<div class="history">
		浏览历史记录

		<%
		String list = "";
		/* 从客户端读取Cookies集合 */
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			/* 遍历Cookies集合 */
			for (Cookie c : cookies) {
				if (c.getName().equals("COOKIE")) {
					/* 获取Cookie的值 */
					list = c.getValue();
				}
			}
		}

		/* 用#分割各个id */
		list += request.getParameter("id") + "#";
		// 如果浏览记录超过100条，清零
		String[] arr = list.split("#");
		if (arr != null && arr.length > 0) {
			if (arr.length >= 100) {
				list = "";
			}
		}
		/* 创建Cookie对象 */
		Cookie cookie = new Cookie("COOKIE", list);
		System.out.println("当前缓存到Cookie的值(商品id)----" + list);
		/* 写入Cookie对象 */
		response.addCookie(cookie);
	%>

		<!-- 浏览过的商品 -->
		<%
			ArrayList<Shopping> shopplist = dao.getViewList(list);
			if (shopplist != null && shopplist.size() > 0) {
				for (Shopping shh : shopplist) {
		%>

		<div class="historyItem">
			<a href="detail.jsp?id=<%=shh.getId()%>"><img alt=""
				src="images/<%=shh.getPicture()%>"> </a>
			<div class="name"><%=shh.getName()%></div>
			<div class="city">
				产地：<%=shh.getCity()%></div>
			<div class="price">
				¥<%=shh.getPrice()%></div>
		</div>

		<%
			}
			}
		%>

	</div>

</body>
</html>