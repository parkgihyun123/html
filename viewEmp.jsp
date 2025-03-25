<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
</head>
<body>
    <center>
        <table border="1" width="800" height="20">
            <tr height="20">
                <td width="20" align="left">사원번호</td>
                <td width="20" align="left">사원명</td>
                <td width="25" align="left">직급</td>
                <td width="20" align="left">상관번호</td>
                <td width="40" align="left">입사일자</td>
                <td width="20" align="left">급여</td>
                <td width="20" align="left">커미션</td>
                <td width="35" align="left">부서번호</td>
            </tr>
            
            <%
                String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
                String user = "scott"; 
                String password = "tigers";
                
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection(url, user, password);
                    
                    String sql = "SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();
                    
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("empno") + "</td>");
                        out.println("<td>" + rs.getString("ename") + "</td>");
                        out.println("<td>" + rs.getString("job") + "</td>");
                        out.println("<td>" + rs.getInt("mgr") + "</td>");
                        out.println("<td>" + rs.getDate("hiredate") + "</td>");
                        out.println("<td>" + rs.getDouble("sal") + "</td>");
                        out.println("<td>" + rs.getString("comm") + "</td>");
                        out.println("<td>" + rs.getInt("deptno") + "</td>");
                        out.println("</tr>");
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </center>
</body>
</html>
