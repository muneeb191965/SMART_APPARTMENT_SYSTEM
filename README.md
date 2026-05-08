# Apartment Management System

## Semester OOP Project

**Course:** Object-Oriented Programming (OOP)  
**Project Type:** Semester Group Project  
**Technology Used:** Java, Swing GUI, JDBC, MySQL  

# Project Description

The Apartment Management System is a Java desktop application developed to simplify apartment and resident management for property owners and building administrators.

Managing apartments manually can create problems such as:
- Difficulty tracking buildings and apartments
- Poor management of resident records
- Billing and payment confusion
- Time-consuming manual work

This system provides a centralized solution to manage:
- Buildings
- Apartments
- Residents
- Bills
- Payments
- Apartment Reports

The project demonstrates the practical implementation of Object-Oriented Programming concepts using Java.

---

# Group Members

| Full Name | CMS/ID | Section |
|----------|---------|----------|
| Nadia Hassan |023-25-0083 | BSCS-D|
| Muneeb ur Rahman |023-25-0075| BSCS-D|


# Purpose of the System

The purpose of this project is to automate apartment management operations and reduce manual record handling.

## Users of the System

### Owner
The owner can:
- Add buildings
- Add apartments
- Register residents
- View records
- Generate reports

### Resident
The resident can:
- View bills
- Make payments

---

# Core Modules
The project is divided into separate packages for better organization and maintainability.
---
## 1. Model Package (`model`)

This package contains entity classes that represent real-world objects.

### Classes
- `User`
- `Owner`
- `Resident`
- `Building`
- `Apartment`

### Responsibilities
- Store object data
- Define relationships between entities
- Apply encapsulation using private fields and getters

---

## 2. Service Package (`service`)

This package handles database operations and business logic.

### Classes
- `DBConnection`
- `AuthService`
- `ReportService`

### Responsibilities
- Database connection
- User authentication
- Report generation
- SQL query execution


## 3. UI Package (`ui`)

This package contains Java Swing graphical interfaces.

### Classes
- `LoginUI`
- `OwnerDashboard`
- `ResidentDashboard`

### Responsibilities
- User interaction
- Forms and buttons
- Navigation between screens
- Displaying apartment and billing information

---

## 4. Main Class

The application starts from:

```java
Main.java
```

This class connects the application with the database and launches the login screen.

---

# Key OOP Features

## Encapsulation

Private fields are used inside classes and accessed using getter methods.

### Example

```java
private double rent;

public double getRent() {
    return rent;
}


## Inheritance

`Owner` and `Resident` classes inherit from the abstract `User` class.

### Example

```java
public class Owner extends User
```

---

## Abstraction

The `User` class is abstract and defines common behavior for all users.

### Example

```java
public abstract String getRole();
```

---

## Polymorphism

Different classes provide different implementations of methods.

### Example

```java
@Override
public String getRole() {
    return "Resident";
}
```

---

## Validation

Validation is used to prevent invalid data.

### Examples
- Rent cannot be negative
- Empty login fields are not allowed
- Invalid apartment values throw exceptions

### Example

```java
if(rent <= 0){
    throw new IllegalArgumentException("Invalid Rent");
}
```

---

## Exception Handling

Try-catch blocks are used to safely handle errors.

### Example

```java
try {
    pst.executeUpdate();
} catch(Exception ex) {
    JOptionPane.showMessageDialog(f, ex.getMessage());
}
```

---
# Database Information

The project uses MySQL database.

## Database Name

```sql
smartapartmentdb
```

---

# Database Tables

The following tables are used in the system:

| Table Name | Purpose |
|------------|----------|
| Owner | Stores owner information |
| Building | Stores building details |
| Apartment | Stores apartment details |
| Resident | Stores resident records |
| Bill | Stores billing information |
| Payment | Stores payment records |

---

# How to Run the Project

## Requirements

- JDK 17 or above
- MySQL Server
- MySQL JDBC Driver
- Java IDE (IntelliJ IDEA, Eclipse, or VS Code)

---

# Step 1: Create Database

```sql
CREATE DATABASE smartapartmentdb;
USE smartapartmentdb;
```

---

# Step 2: Run SQL Script

Run the provided SQL file to create all required tables.

---

# Step 3: Configure Database Connection

Open:

```java
service/DBConnection.java
```

Update database username and password if needed:

```java
DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/smartapartmentdb",
    "root",
    "@@@12345"
);
```

---

# Step 4: Compile the Project

```bash
javac Main.java
```

---

# Step 5: Run the Project

```bash
java Main
```

---

# Project Structure
```text
ApartmentManagementSystem/
│
├── model/
│   ├── Apartment.java
│   ├── Building.java
│   ├── Owner.java
│   ├── Resident.java
│   └── User.java
│
├── service/
│   ├── AuthService.java
│   ├── DBConnection.java
│   └── ReportService.java
│
├── ui/
│   ├── LoginUI.java
│   ├── OwnerDashboard.java
│   └── ResidentDashboard.java
│
├── Main.java
├── apartment_management.sql
└── README.md
```

---

# Technologies Used

| Technology | Purpose |
|------------|----------|
| Java | Core Programming |
| Java Swing | GUI Development |
| JDBC | Database Connectivity |
| MySQL | Database Management |
| OOP Concepts | Software Design |

---

# GitHub Repository
https://github.com/muneeb191965/SMART_APPARTMENT_SYSTEM/blob/main/README.md

---

# Video Demonstration

https://youtube.com/your-video-link
```

---

# Academic Integrity
This project is developed as part of the Semester OOP Project.  
All code and implementation were created by the group members for educational purposes.

---

# Conclusion
This project demonstrates the practical implementation of Object-Oriented Programming concepts such as:
- Encapsulation
- Inheritance
- Abstraction
- Polymorphism
- Validation
- Exception Handling

along with Java Swing GUI development and MySQL database integration.
