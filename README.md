<h1 align="center">📚 Spring MVC CRUD Book Application</h1>

A simple Book Management Web Application built using **Spring MVC**, **JSP**, and **MySQL Database** demonstrating full **CRUD operations**.


# 📚 Spring MVC CRUD Book Application

A simple Book Management Web Application built using **Spring MVC**, **JSP**, and **MySQL Database** demonstrating full **CRUD operations**.

---

## 🚀 Features
- Add new book
- Search book by ID
- Update existing book
- Delete book
- Form-based book management UI (JSP)
- Repository implemented using Spring Data JPA

---

## 🛠️ Technologies Used
| Technology | Description |
|-----------|-------------|
| Java | Core language |
| Spring MVC | Web MVC framework |
| Spring Boot | Project setup & embedded Tomcat |
| Spring Data JPA | Database interaction |
| MySQL | Database |
| JSP | Frontend UI |

---

## 📦 Project Structure
src
└── main
├── java
│ └── com.tejasandjava
│ ├── BookController.java
│ └── entity / repository
└── webapp
└── WEB-INF
└── views
└── bookForm.jsp

---

## 🗄️ Database Table (MySQL)
```sql
CREATE TABLE book (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  price DOUBLE,
  qty INT
);


⚙️ Configure application.properties

spring.datasource.url=jdbc:mysql://localhost:3306/yourdbname
spring.datasource.username=root
spring.datasource.password=yourpassword

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp


▶️ How to Run

Import project into Eclipse / IntelliJ

Configure MySQL database

Run the Spring Boot main class

Open browser and visit:

http://localhost:8080/


📌 REST Endpoints (Form Actions)
Operation	HTTP Method	URL
Load Form	GET	/
Search Book	GET	/search?bookId=
Add Book	POST	/add
Update Book	POST	/update
Delete Book	GET	/delete?bookId=
🧑‍💻 Developer

👤 Tejas Indurkar

📌 Feel free to fork ⭐ the repo and contribute.
