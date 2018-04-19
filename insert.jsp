<%@page import="java.sql.*"%>
        <%

            Connection connect = null;
            Statement s = null;
            ResultSet rec = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://35.198.216.128/web?user=james&password=bond");
                                                      
                s = connect.createStatement();
                
                String sql ="insert into member(first_name,lass_name,e_mail,p_assword)"+
                            "values('"+request.getParameter("txtfirstname")+"','"+request.getParameter("txtlastname")+"',+'"+request.getParameter("txtemail")+"','"+request.getParameter("txtpassword")+"')";
                
                s.execute(sql);
                out.println("Record Inserted Successfull<br>");
                sql = "select * from member order by id asc";
                rec = s.executeQuery(sql);
                response.sendRedirect("show.jsp");
            }catch(Exception e){
                out.println(e.getMessage());
                e.printStackTrace();
                }
                try{
                    if (s!= null){
                        s.close();
                        connect.close();}
                }catch(SQLException e){
                out.println(e.getMessage());
                e.printStackTrace();
                }
        
        %>
        
