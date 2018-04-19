<%@page import="java.sql.*"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>INSERT WEB DB</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    </head>
    <body>
        
        <!--from show-->
        <% 
            Connection connect = null;
            ResultSet rec = null;
            Statement s = null;  
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://35.198.216.128/web?user=james&password=bond");
                
                s = connect.createStatement();
                String sql = "select * from member ";
                rec = s.executeQuery(sql);  
            }catch(Exception e){
            out.println(e.getMessage());
            e.printStackTrace();
            }
        %>

        <table class="table table-bordered">
            <tr>
                <th width="auto"><div align="canter">ID</div></th> 
                <th width="auto"><div align="canter">NAME</div></th>
                <th width="auto"><div align="canter">LASS NAME</div></th>
                <th width="auto"><div align="canter">EMAIL</div></th>
                <th width="auto"><div align="canter">PASSWORD</div></th>
            </tr>
            
            <%while((rec != null) && (rec.next())){%>
            
            <tr>
                <td><div align="center"><%=rec.getString("id")%></div></td>
                <td><%=rec.getString("first_name")%></td>
                <td><%=rec.getString("lass_name")%></td>
                <td><%=rec.getString("e_mail")%></td>
                <td><%=rec.getString("p_assword")%></td>
            </tr>
            
            <% }
                try{
                    if (s!= null){
                        s.close();
                        connect.close();}
                }catch(SQLException e){
                out.println(e.getMessage());
                e.printStackTrace();
                }%>
        </table>
    </body>
</html>


