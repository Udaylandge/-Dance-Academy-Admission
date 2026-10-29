<%@ page import="java.sql.*" %>
<html>
<html>
<head>
    <title>Dance Academy Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e4e0e0;
            margin: 0;
            padding: 30px;
        }
        .container {
            width: 90%;
            margin: auto;
            background: rgb(219, 181, 181);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }
        h1, h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #251a1a;
            padding: 10px;
            text-align: center;
        }
        th {
            background: #14b9cb;
            color: rgb(0, 0, 0);
        }
        .total {
            margin-top: 20px;
            padding: 15px;
            background: #eee;
            font-size: 18px;
            font-weight: bold;
        }
        .style-count {
            margin-top: 25px;
        }
        .style-count table {
            width: 60%;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
<h1>Dance Academy Admissions</h1>
<%
String name = request.getParameter("name");
String style = request.getParameter("style");
String level = request.getParameter("level");
String feeString = request.getParameter("monthly_fee");
Connection con = null;
PreparedStatement ps = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/dance_admission ",
        "root",
        "root"
    );
    String insertQuery =
        "INSERT INTO dance_admission (name, style, level, monthly_fee) VALUES (?, ?, ?, ?)";
    ps = con.prepareStatement(insertQuery);
    ps.setString(1, name);
    ps.setString(2, style);
    ps.setString(3, level);
    ps.setInt(4, Integer.parseInt(feeString));
    ps.executeUpdate();
    ps.close();
    String selectQuery =
        "SELECT * FROM dance_admission";
    ps = con.prepareStatement(selectQuery);
    ResultSet rs = ps.executeQuery();
    int totalFee = 0;
%>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Style</th>
        <th>Level</th>
        <th>Monthly Fee</th>
    </tr>
<%
    while (rs.next()) {
        int id = rs.getInt("id");
        String studentName = rs.getString("name");
        String danceStyle = rs.getString("style");
        String danceLevel = rs.getString("level");
        int monthlyFee = rs.getInt("monthly_fee");
        totalFee += monthlyFee;%>
    <tr>
        <td><%= id %></td>
        <td><%= studentName %></td>
        <td><%= danceStyle %></td>
        <td><%= danceLevel %></td>
        <td>₹<%= monthlyFee %></td>
    </tr>
<%
    }
    rs.close();
    ps.close();
%>
</table>
<div class="total">
    Total Monthly Fee: ₹<%= totalFee %>
</div>
<h2>Style-wise Admission Count</h2>
<div class="style-count">
<table>
<tr>
    <th>Dance Style</th>
    <th>Total Records</th>
</tr>
<%
String countQuery =
    "SELECT style, COUNT(*) AS total FROM dance_admission GROUP BY style";
ps = con.prepareStatement(countQuery);
ResultSet countRs = ps.executeQuery();
while (countRs.next()) {
%>
<tr>
    <td><%= countRs.getString("style") %></td>
    <td><%= countRs.getInt("total") %></td>
</tr>
<%
}
countRs.close();
ps.close();
%>
</table>
</div>
<%
} catch (Exception e) {
%>
<h3 style="color:red;">
    Error: <%= e.getMessage() %>
</h3>
<%
} finally {
    try {
        if (con != null) {
            con.close();
        }} 
        catch (Exception e) {
        e.printStackTrace();
    }}%>
</div>
</body>
</html>