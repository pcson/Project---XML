<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc>
        <xd:desc>
            <xd:p>Created on: Nov. 14, 2013</xd:p>
            <xd:p>By Paul Son</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="Courses"> <!-- You need to set the match in order for it to be valid -->
        <xsl:for-each select="Course">
            <xsl:result-document href="{CourseShortCode}.html" method="html"> <!--method and format is different-->
                <html>
                    <head>
                        <link rel="stylesheet" type="text/css" href="style2.css"/>
                    </head>
                    <body>
                        <div id="header" class="container">
                            <h1><xsl:value-of select="CourseCode"/> - <xsl:value-of select="CourseTitle"/></h1>
                            <h2><xsl:value-of select="CourseSemester"/></h2>
                            <u1>
                                <li id="selected"><a href="#general">General</a></li>
                                <li><a href="#text">Text</a></li>
                                <li><a href="#grading">Grading</a></li>
                                <li><a href="#schedule">Schedule</a></li>
                            </u1>
                        </div>
                        <div id="main" class="container">
                            <div id="general">
                                <h3>General Catalogue Course Desciption</h3>
                                <xsl:value-of select="CourseDescriptions/GeneralCatalog"/>
                                <h3>Department Description</h3>
                                <xsl:value-of select="CourseDescriptions/GeneralCatalog"/>
                                <h3>Format</h3>
                                <xsl:value-of select="CourseFormat/CourseFormatOption/CourseFormatType"/>
                                <br/>
                                <xsl:value-of select="CourseFormat/CourseFormatOption/CourseHours"/> Units
                                <br/>
                                <xsl:text>Course Start Date: </xsl:text><xsl:value-of select="CourseStartDate"/>
                                <br/>
                                <xsl:text>Course End Date: </xsl:text><xsl:value-of select="CourseEndDate"/>
                                <br/>
                                <h3>Instructors</h3>
                                <xsl:for-each select="Instructors/Instructor">
                                    <ul>
                                        <li><b>Name:</b><xsl:value-of select="InstructorName"/></li>
                                        <li><xsl:value-of select="InstructorType"/></li>
                                        <li><b>Email:</b><xsl:value-of select="InstructorEmail"/></li>
                                    </ul>
                                </xsl:for-each>
                            </div>
                            <div id="text">
                                <h3>Required Text</h3>
                            </div>
                            <div id="grading">
                                <h3>Grading</h3>
                                <xsl:for-each select="Grading/GradingOptions">
                                    <xsl:value-of select="GradingOption"/>
                                </xsl:for-each>
                            </div>
                            <div id="schedule">
                                <h3>Schedule</h3>
                                <table border="1">
                                    <tr>
                                        <th>Code</th>
                                        <th>Short Code</th>
                                        <th>CCN</th>
                                        <th>Type</th>
                                        <th>Instructor</th>
                                    </tr>
                                    <xsl:for-each select="Sections/Section">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="SectionCode"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="SectionShortCode"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="SectionCCN"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="SectionType"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="SectionInstructor"/>
                                        </td>
                                    </tr> 
                                    </xsl:for-each>
                                </table>
                                <h4>Enrollment Information</h4>
                                <table border="1">
                                    <tr>
                                        <th>Update</th>
                                        <th>Limit</th>
                                        <th>Enrolled</th>
                                        <th>Waitlist</th>
                                        <th>Available Seats</th>
                                    </tr>
                                    <xsl:for-each select="Enrolment/EnrolmentStatus/EnrolmentUpdate">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="EnrolmentUpdatedOn"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Limit"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Enrolled"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Waitlist"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="AvailableSeats"/>
                                        </td>
                                    </tr>
                                    </xsl:for-each>
                                </table>
                            </div>
                        </div>
                    </body>
                </html>
            </xsl:result-document>    
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>