**🐾 Animal Adoption Platform**
A web-based platform that connects people with animals in shelters, making the adoption process seamless and efficient.

**📌 Table of Contents**
Introduction
Features
Technologies Used
Installation
Usage
Database Schema
System Design
Security Measures
Future Enhancements
License

**📖 Introduction**
Millions of stray cats and dogs are waiting to be adopted, and many shelters struggle with overpopulation. The Animal Adoption Platform is designed to simplify the adoption process, increase awareness about animal welfare, and encourage responsible pet ownership.
**This project was developed as part of the BSc (IT) Final Year Project at Lala Lajpat Rai College of Commerce and Economics, University of Mumbai.**

**✨ Features**
✔ View available pets with details like age, gender, and description
✔ User registration and authentication
✔ Adoption request submission with an approval process
✔ Admin panel for managing animal records and adoption requests
✔ Email notifications for adoption status updates
✔ Secure user authentication and data protection

**🛠 Technologies Used**
Frontend >> HTML, CSS (Bootstrap) , JavaScript
Backend >> Python (Flask/Django) , MySQL (Database Management)
Development Tools:
IDE: Visual Studio Code
Version Control: Git & GitHub
UML Diagrams: StarUML

**🖥 Installation**
To run this project locally:

**1.Clone the repository**
git clone https://github.com/yashgadodia12/Animal-Adoption.git
cd Animal-Adoption

**Install dependencies**
pip install -r requirements.txt

**Set up the database**
Create a MySQL database.
Import the provided database.sql file.

**Run the application**
python app.py

**Access the application Open a browser and go to http://127.0.0.1:5000/**

**📌 Usage**
Users: Register, browse pets, and submit adoption requests.
Admins: Manage pet records, review adoption requests, and approve/reject applications.

**📊 Database Schema**
**The database consists of the following tables:**
users - Stores user information
animals - Stores details of pets available for adoption
adoptions - Stores adoption requests and statuses

**⚙ System Design**
ER Diagram: Defines relationships between users, pets, and adoption records.
Use Case Diagram: Illustrates user interactions.
Class Diagram: Represents object-oriented structure.
Activity & Sequence Diagrams: Show process workflows.

**🔐 Security Measures**
User authentication using hashed passwords
Admin verification before approving adoptions
Data validation to prevent SQL injections
OTP-based authentication for secure logins

**📜 License**
This project is open-source. Feel free to contribute and improve it! 
