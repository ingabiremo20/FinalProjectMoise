
<%@page import="java.util.List"%>
<%@page import="enginees.Branches"%>
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
                        <h3>Branch List</h3>
                <table border="1" class="table table-striped">
                    <thead style="background-color:skyblue">
                        <tr style="">
                            <th>Branch_ID</th>
                            <th>Branch_Name</th>
                            <th>Branch_Address</th>                            
                            <th>Registration_Date</th>                            
                            <th>Option</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                    List<Branches> compList = Branches.getBranchList();
                    for (int i = 0; i < compList.size(); i++) {
                        if (i % 2 == 0) {
                %>
                <tr style="color: blue;background-color: whitesmoke;">
                    <td ><%=compList.get(i).getBranchid()%> </td>
                    <td><%=compList.get(i).getBranchname()%></td>
                    <td><%=compList.get(i).getBranchaddress()%></td>
                    <td><%=compList.get(i).getCreationdate()%></td>
                    <td><a href="UpdateBranch.jsp?id=<%=compList.get(i).getBranchid()%> ">Update</a></td>
                </tr>                    <%
                } else {
                %>
                <tr style="color: green;background-color: white;">
                    <td><%=compList.get(i).getBranchid()%> </td>
                    <td><%=compList.get(i).getBranchname()%></td>
                    <td><%=compList.get(i).getBranchaddress()%></td>
                    <td><%=compList.get(i).getCreationdate()%></td>
                    <td><a href="UpdateBranch.jsp?id=<%=compList.get(i).getBranchid()%> ">Update</a></td>
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
