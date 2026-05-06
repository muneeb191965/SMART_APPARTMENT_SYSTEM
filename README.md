# SMART_APPARTMENT_SYSTEM
Purpose

The Apartment Management System is a Java desktop application created to simplify apartment and resident management for property owners.
Managing apartments manually can be difficult because records are often scattered, rent tracking becomes confusing, and resident information is hard to organize. This system solves those problems by providing a centralized platform to manage:

1.Buildings
Apartments/Flats
Residents
Bills and Payments
Apartment Report
Users of the System
Owner

2.The owner can:
Add buildings
Add apartments
Register residents
View apartment and resident records
Generate reports
Resident

3.The resident can:
View personal bills
Make payments
Core Modules

The project is divided into separate packages to keep the system organized and maintainable.
1. Model Package (model)
This package contains entity classes that represent real-world objects.

Classes
User
Owner
Resident
Building
Apartment
Responsibilities
Store object data
Define relationships between entities
Apply encapsulation using private fields and getters

2. Service Package (service)
This package handles business logic and database operations.

Classes
DBConnection
AuthService
ReportService
Responsibilities
Database connectivity
User authentication
Report generation
SQL query handling

3. UI Package (ui)
This package contains all Java Swing graphical interfaces.

Classes
LoginUI
OwnerDashboard
ResidentDashboard
Responsibilities
User interaction
Forms and buttons
Navigation between screens
Displaying records and reports
