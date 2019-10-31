
<%@page import="java.util.List"%>
<%@page import="enginees.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 <link href="styless/fonts.css" rel="stylesheet" />
        <link href="styless/bootstrap.css" rel="stylesheet" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
    <center>
        <div>          
           
            <div style="width: 100%;height: 100%;border-bottom:   0px black solid;background-color: white;">
                        <h3>Categories List</h3>
                <table border="1" class="table table-striped">
                       <thead style="background-color:skyblue">
                        <tr>
                            <th>Category_ID</th>
                            <th>Category_Name</th>
                            <th>Description</th>                                 
                            <th>Option</th>
                          
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Categories> compList = Categories.getCategoryList();
                            for (int i = 0; i < compList.size(); i++) {
                                if (i % 2 == 0) {
                        %>
                        <tr style="color: blue;background-color: whitesmoke;">
                            <td><%=compList.get(i).getCategoryid()%> </td>
                            <td><%=compList.get(i).getCategoryname()%></td>
                            <td><%=compList.get(i).getCategorydesc()%></td>                    
                            <td><a href="UpdateCategory.jsp?id=<%=compList.get(i).getCategoryid()%> ">Update</a></td>
                        </tr>                    <%
                        } else {
                        %>
                        <tr style="color: green;background-color: white;">
                            <td><%=compList.get(i).getCategoryid()%> </td>
                            <td><%=compList.get(i).getCategoryname()%></td>
                            <td><%=compList.get(i).getCategorydesc()%></td>                    
                            <td><a href="UpdateCategory.jsp?id=<%=compList.get(i).getCategoryid()%> ">Update</a></td>
                        </tr>
                        <%
                            }
                        %>

                        <%
                    }%>
                    </tbody>
                </table>
            </div>           
        </div>
    </center>
</body>
</html>
