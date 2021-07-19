<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <style>
          body {
  background: palegreen;
}
h3 {
  text-align: center;
  font-size: 4em;
  color: maroon;
}

table{
  border: 1px solid black;
  padding: 40px;
  font-size: 1.50em;
  text-align: center;
  background: gray;
  margin-left: 40px;
}
th,td {
  padding: 20px;
  font-size: 1em;
  text-align: center;
  border-radius: 5px;
  background: hotpink;
}

      </style>
    <meta charset="utf-8">
    <title>Transaction History</title>
    
  </head>
  <body>
    
      
      <h3>Transaction History</h3>
      <% 
 Connection con=null;
 Statement smt=null;
 ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
        //(2) Establishing connection with database
con=DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/banking","root","root");
        //(3) Creating statment object 
       smt=con.createStatement();
       rs=smt.executeQuery("select * from transaction");
      
       
%>
 <section id="table">
      <div class="user-details">
       <table border="1" style="width:80%" class="center" align="center">
         <thead class="head">
           <tr>
             <th>Transaction_id</th>
             <th>Sender Name</th>
             <th>Reciever Name</th>
            <th>Amount </th>
           </tr>
         </thead>
         <tbody class="body">
             <%
              while(rs.next())
              {
                  String tid=rs.getString("tid");
                  String sname=rs.getString("sender_name");
                  String rname=rs.getString("receiver_name");
                  String amt=rs.getString("amount_paid");
             %>
            <tr>
             <td><%=tid%></td>
             <td><%=sname%></td>
             <td><%=rname%></td>
             <td><%=amt%></td>
           </tr>
        <%
        
              }
        %>
         </tbody>
       </table>

      </div>
    </section>


  </body>
</html>