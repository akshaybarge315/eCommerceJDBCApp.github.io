# E-Commerce Application
## Introduction
This is a simple E-Commerce application built using Core Java and JDBC. The application allows customers to browse and search for products, while administrators can manage users, products, orders, and order items. The project is designed to provide a basic understanding of CRUD operations using JDBC in a console-based Java application.

## Features
### Customer Features
+ Search for products by name
+ Display all available products
## Admin Features
+ User management (add, update, delete, view all users)
+ Product management (add, update, delete, view all products)
+ Order management (add, update, delete, view all orders)
+ Order Item management (add, update, delete, view all order items)

## Project Structure
The project is divided into several packages and classes:

### Packages
+ com.shopping.app: Contains the main application class
+ com.shopping.daoImpl: Contains DAO implementation classes for User, Product, Order, and OrderItem
+ com.shopping.model: Contains model classes representing User, Product, Order, and OrderItem

## Setup and Running the Project
1. Clone the repository from GitHub:
  git clone https://github.com/akshaybarge315/ecommerce-jdbc.git
2. Import the project into your preferred IDE.
3. Set up your database and create the required tables using the provided SQL scripts.
4. Update the database connection details in the UserDAOImpl, ProductDAOImpl, OrderDAOImpl, and OrderItemDAOImpl classes.
5. Run the app class to start the application.
## Usage
### Running the Application
1. Upon running the application, you will be prompted to choose between customer and admin modes.
2. Follow the on-screen instructions to perform various actions like searching for products (customer mode) or managing users, products, orders, and order items (admin mode).
### Admin Credentials
+ Username: Akshay
+ Password: 123@123
## Contributions
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.
