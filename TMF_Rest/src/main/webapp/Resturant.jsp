<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
	<div class="header">
            <div class="logo">
                <img class="logo-img" src="https://t3.ftcdn.net/jpg/02/41/30/72/360_F_241307210_MjjaJC3SJy2zJZ6B7bKGMRsKQbdwRSze.jpg";" alt="logo image"/>
            </div>
             <div class="nav-items">
        		<ul>
          			<li>Home</li>
          			<li>About Us</li>
          			<li>Contact Us</li>
          			<li>Cart</li>
       			</ul>
      		 </div>
    </div>
    
    
    <%
    
    String jdbcURL = "jdbc:mysql://localhost:3306/tmf_food";
    String jdbcUsername = "root";
    String jdbcPassword = "root";

    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
    
        Class.forName("com.mysql.cj.jdbc.Driver");

       
        		
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

       
        statement = con.createStatement();

        
        String sql = "SELECT Resturant_img, Resturant_Name, AVG_rating, costForTwo FROM resturant_details";
        resultSet = statement.executeQuery(sql);

       
        while (resultSet.next()) {
            String Resturant_img = resultSet.getString("Resturant_img");
            String Resturant_Name = resultSet.getString("Resturant_Name");
           
            Double AVG_rating = resultSet.getDouble("AVG_rating");
            String costForTwo = resultSet.getString("costForTwo");
        
%>
    
    <div class="res-container">
    <div class="res-card" >
        <img
          class="res-logo"
          alt="res-logo"
          src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/<%= Resturant_img %>";  
        />
        <h3><%= Resturant_Name %></h3>
        
        <h4><%= AVG_rating %></h4>
        <h4><%= costForTwo %></h4>
    </div>
    </div>
    
<%
        } 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        
       
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
%>
    
</body>
</html>