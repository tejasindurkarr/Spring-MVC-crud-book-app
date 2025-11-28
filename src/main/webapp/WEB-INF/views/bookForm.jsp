<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tejasandjava.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Application</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #e8f0fe;
        margin: 0;
    }

    .container {
        width: 450px;
        background: white;
        margin: 40px auto;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 0 15px gray;
    }

    h2 {
        text-align: center;
        color: #2c3e50;
    }

    label {
        font-weight: bold;
    }

    input[type=text], input[type=number] {
        width: 95%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid gray;
        border-radius: 6px;
    }

    input[type=submit] {
        padding: 10px;
        background: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 6px;
        width: 100%;
        font-size: 16px;
        margin-top: 5px;
    }

    .actions button, .actions a {
        margin-top: 10px;
        width: 30%;
        height: 40px;
        border-radius: 6px;
        border: none;
        font-size: 15px;
        cursor: pointer;
        color: white;
    }

    .btn-add { background: #28a745; }
    .btn-update { background: #ff9800; }
    .btn-delete { background: #dc3545; display: inline-block; text-align: center; line-height: 40px; }

    .msg {
        margin-top: 15px;
        text-align: center;
        font-weight: bold;
        color: #0c5460;
    }
</style>

</head>
<body>

<div class="container">
<h2>📚 Book Management</h2>



<!-- 🔍 Search Section -->
<form action="search" method="get">
   <label>Book ID :</label>
   <input type="number" placeholder="Enter Book ID .." name="bookId" required>
   <input type="submit" value="Search">
</form>

<%
    Book book = (Book) request.getAttribute("book");
    boolean bookExists = (book != null);
%>



<!-- ➕ Add / ✏ Update Section -->
<form action="<%= bookExists ? "update" : "add" %>" method="post">
    <label>Book ID :</label>
    <input type="number" name="id" value="<%= bookExists ? book.getId() : "" %>" required>

    <label>Book Name :</label>
    <input type="text" name="name" value="<%= bookExists ? book.getName() : "" %>" required>

    <label>Book Price :</label>
    <input type="number" name="price" value="<%= bookExists ? book.getPrice() : "" %>" required>

    <label>Book Quantity :</label>
    <input type="number" name="qty" value="<%= bookExists ? book.getQty() : "" %>" required>

    <input type="submit" value="<%= bookExists ? "Update Book" : "Add Book" %>">
</form>



<%--  Delete button display only when book found --%>

<% if (bookExists) { %>
    <form action="delete" method="post" style="margin-top:10px;">
        <input type="hidden" name="bookId" value="<%= book.getId() %>">
        <button type="submit" class="btn-delete">Delete Book</button>
    </form>
<% } %>



<%-- Success / Error Messages --%>
<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <p class="msg"><%= msg %></p>
<% } %>

</div>
</body>
</html>
