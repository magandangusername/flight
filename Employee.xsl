<?xml version = "1.0" encoding = "UTF-8"?>
	<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
        <xsl:key name = "misdep" match = "employee" use = "department_name"/>
        <xsl:key name = "stat" match = "employee" use = "status"/>
        <xsl:key name = "hr" match = "employee" use = "position"/>
        <xsl:template match="/">
            <html>
                <head>
                    <style>
                        body {
                            background-image: url("https://cdn.discordapp.com/attachments/764139209937125387/839817438467194920/Asus-Zenfone-5-Lite-Stock-Wallpapers_Techbeasts.com-3.jpg");
                            background-size: cover;
                            
                            font-size: 25px;
                        }
                        table {
                            text-align: center;
                            margin-left: 5%;
                            margin-right: 5%;
                            font-family: Arial, Helvetica, sans-serif;
                            border-collapse: collapse;
                        }

                        td, th {
                            border: 1px solid #ddd;
                            padding: 8px;
                        }

                        tr:nth-child(even){
                            background-color: #cce0ff;
                        }
                        tr:nth-child(odd){
                            background-color: #b3d1ff;
                        }
                        
                        tr:hover {
                            background-color: #e6f0ff;
                        }
                        
                        th {
                            padding-top: 12px;
                            padding-bottom: 12px;
                            background-color: #668cff;
                        }
                        
                        h1, h2, h3 {
                            font-family: courier new;
                            
                            
                        }
                        center {
                            background: rgba(255, 255, 255, .4);
                        }
                    </style>
                </head>

                <body>
                    <center>
                        <h1>All Employee Data</h1>
                        <table border ="1">
                            <tr>
                                <th rowspan="2">Department Number</th>
                                <th rowspan="2">Department Name</th>
                                <th rowspan="2">Employee Number</th>
                                <th colspan="3">Employee Name</th>
                                <th colspan="2">Date Hired</th>
                                <th rowspan="2">Position</th>
                                <th rowspan="2">Status</th>
                                <th rowspan="2">Salary</th>
                            </tr>
                            
                            <tr>
                                <th>LastName</th>
                                <th>FirstName</th>
                                <th>M I</th>
                                <th>Month</th>
                                <th>Year</th>
                            </tr>
                            <xsl:for-each select="emp_inf/department/employee">
                                <tr>
                                    <td><xsl:value-of select="department_number"/></td>
                                    <td><xsl:value-of select="department_name"/></td>
                                    <td><xsl:value-of select="@num"/></td>
                                    <td><xsl:value-of select="employee_name/lastname"/></td>
                                    <td><xsl:value-of select="employee_name/firstname"/></td>
                                    <td><xsl:value-of select="employee_name/MI"/></td>
                                    <td><xsl:value-of select="date_hired/month"/></td>
                                    <td><xsl:value-of select="date_hired/year"/></td>
                                    <td><xsl:value-of select="position"/></td>
                                    <td><xsl:value-of select="status"/></td>
                                    <td><xsl:value-of select="concat(substring(salary,0,3) , ',' ,substring(salary,3,10))"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        
                        <h1>Employees from MIS Department</h1>
                        <table border ="1">
                            <tr>
                                <th colspan="3">Employee Name</th>
                            </tr>
                            
                            <tr>
                                <th>LastName</th>
                                <th>FirstName</th>
                                <th>M I</th>
                            </tr>
        
                            <xsl:for-each select= "key('misdep', 'MIS')">
                            <tr>
                                <td><xsl:value-of select="employee_name/lastname"/></td>
                                <td><xsl:value-of select="employee_name/firstname"/></td>
                                <td><xsl:value-of select="employee_name/MI"/></td>
                            </tr>
                            </xsl:for-each>
        
                        </table>

                        <h1>Hired Employees as of March 2021</h1>
                        <table border ="1">
                            <tr>
                                <th colspan="3">Employee Name</th>
                                <th colspan="2">Date Hired</th>
                            </tr>
                            
                            <tr>
                                <th>LastName</th>
                                <th>FirstName</th>
                                <th>M I</th>
                                <th>Month</th>
                                <th>Year</th>
                            </tr>
                            <xsl:for-each select="emp_inf/department/employee">
                                <xsl:if test="contains(date_hired/month, 'March') and contains(date_hired/year, '2021')">
                                    <tr>
                                        <td><xsl:value-of select="employee_name/lastname"/></td>
                                        <td><xsl:value-of select="employee_name/firstname"/></td>
                                        <td><xsl:value-of select="employee_name/MI"/></td>
                                        <td><xsl:value-of select="date_hired/month"/></td>
                                        <td><xsl:value-of select="date_hired/year"/></td>
                                    </tr>
                                </xsl:if>
                                
                            </xsl:for-each>
                        </table>

                        <h1>Permanent Employees</h1>
                        <table border ="1">
                            <tr>
                                <th rowspan="2">Department Number</th>
                                <th rowspan="2">Department Name</th>
                                <th rowspan="2">Employee Number</th>
                                <th colspan="3">Employee Name</th>
                                <th colspan="2">Date Hired</th>
                                <th rowspan="2">Position</th>
                                <th rowspan="2">Status</th>
                                <th rowspan="2">Salary</th>
                            </tr>
                            
                            <tr>
                                <th>LastName</th>
                                <th>FirstName</th>
                                <th>M I</th>
                                <th>Month</th>
                                <th>Year</th>
                            </tr>
                            <xsl:for-each select="key('stat', 'Permanent')">
                                <tr>
                                    <td><xsl:value-of select="department_number"/></td>
                                    <td><xsl:value-of select="department_name"/></td>
                                    <td><xsl:value-of select="@num"/></td>
                                    <td><xsl:value-of select="employee_name/lastname"/></td>
                                    <td><xsl:value-of select="employee_name/firstname"/></td>
                                    <td><xsl:value-of select="employee_name/MI"/></td>
                                    <td><xsl:value-of select="date_hired/month"/></td>
                                    <td><xsl:value-of select="date_hired/year"/></td>
                                    <td><xsl:value-of select="position"/></td>
                                    <td><xsl:value-of select="status"/></td>
                                    <td><xsl:value-of select="concat(substring(salary,0,3) , ',' ,substring(salary,3,10))"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>

                        <h1>Employees with salary not less than 30,000</h1>

                        <table border ="1">
                
                            <tr>
                                  <th rowspan="2">Department Number</th>
                                  <th rowspan="2">Department Name</th>
                                  <th rowspan="2">Employee Number</th>
                                  <th colspan="3">Employee Name</th>
                                  <th colspan="2">Date Hired</th>
                                  <th rowspan="2">Position</th>
                                  <th rowspan="2">Status</th>
                                  <th rowspan="2">Salary</th>
                             </tr>
                             
                             <tr>
                                 <th>LastName</th>
                                 <th>FirstName</th>
                                 <th>M I</th>
                                 <th>Month</th>
                                 <th>Year</th>
                             </tr>
         
                             
         
                            <xsl:for-each select= "emp_inf/department/employee">
                                <xsl:choose>
                                    <xsl:when test="salary &gt; 29000.00 ">   
                                        <tr>
                                            <td><xsl:value-of select="department_number"/></td>
                                            <td><xsl:value-of select="department_name"/></td>
                                            <td><xsl:value-of select="@num"/></td>
                                            <td><xsl:value-of select="employee_name/lastname"/></td>
                                            <td><xsl:value-of select="employee_name/firstname"/></td>
                                            <td><xsl:value-of select="employee_name/MI"/></td>
                                            <td><xsl:value-of select="date_hired/month"/></td>
                                            <td><xsl:value-of select="date_hired/year"/></td>
                                            <td><xsl:value-of select="position"/></td>
                                            <td><xsl:value-of select="status"/></td>
                                            <td><xsl:value-of select="concat(substring(salary,0,3) , ',' ,substring(salary,3,10))"/></td>
                                        </tr>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
            
                        </table>

                        <h1>HR Manager Information</h1>
                        
                        <table border ="1">
                            <tr>
                                <th rowspan="2">Department Number</th>
                                <th rowspan="2">Department Name</th>
                                <th rowspan="2">Employee Number</th>
                                <th colspan="3">Employee Name</th>
                                <th colspan="2">Date Hired</th>
                                <th rowspan="2">Position</th>
                                <th rowspan="2">Status</th>
                                <th rowspan="2">Salary</th>
                            </tr>
                            
                            <tr>
                                <th>LastName</th>
                                <th>FirstName</th>
                                <th>M I</th>
                                <th>Month</th>
                                <th>Year</th>
                            </tr>
                            <xsl:for-each select="key('hr', 'HR Manager')">
                                <tr>
                                    <td><xsl:value-of select="department_number"/></td>
                                    <td><xsl:value-of select="department_name"/></td>
                                    <td><xsl:value-of select="@num"/></td>
                                    <td><xsl:value-of select="employee_name/lastname"/></td>
                                    <td><xsl:value-of select="employee_name/firstname"/></td>
                                    <td><xsl:value-of select="employee_name/MI"/></td>
                                    <td><xsl:value-of select="date_hired/month"/></td>
                                    <td><xsl:value-of select="date_hired/year"/></td>
                                    <td><xsl:value-of select="position"/></td>
                                    <td><xsl:value-of select="status"/></td>
                                    <td><xsl:value-of select="concat(substring(salary,0,3) , ',' ,substring(salary,3,10))"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>


                    </center>

                </body>
            </html>
        </xsl:template>
	</xsl:stylesheet>