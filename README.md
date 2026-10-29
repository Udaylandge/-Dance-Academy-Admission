Project Structure

DanceAcademy
│
├── src
│   └── main
│       └── webapp
│           ├── index.html
│           ├── result.jsp
│           ├── style.css
│           └── script.js
│
├── pom.xml
├── .gitignore
└── README.md

How the Project Works

The user opens the admission form.

The user enters the required student details.

JavaScript checks the entered information.

The form submits the data to result.jsp.

JSP connects to MySQL using JDBC.

The admission details are inserted using PreparedStatement.

All admission records are displayed in a table.

The total monthly fee is calculated.

The number of students for each dance style is displayed.

Validation

JavaScript validation is used to check:

Name should not be empty.

Name should not exceed 40 characters.

Dance style must be selected.

Monthly fee must be greater than zero.

How to Run

1. Start MySQL

Make sure MySQL Server is running.

2. Create the Database

Run the database SQL given above in MySQL.

3. Configure Database Password

Open result.jsp and update:

"YOUR_PASSWORD"

with your local MySQL password.

4. Build the Project

Open the project folder in PowerShell and run:

mvn clean package

5. Deploy on Tomcat

Copy the generated WAR file from:

target/DanceAcademy.war

to the Tomcat webapps folder.

6. Start Tomcat

Start the Tomcat server and open the application in a browser.

Example:

http://localhost:8080/DanceAcademy/