# 📊 SQL Book Orders Analysis  

## **📌 Project Overview**  
This project analyzes **book orders and inventory** using SQL queries. It includes operations like **JOINs, GROUP BY, COALESCE, and aggregate functions** to extract meaningful insights from the dataset.  

## **📂 Dataset**  
The project works with two tables:  
- **Books** 📚: Contains book details such as `Book_ID`, `Title`, and `Stock`.  
- **Orders** 🛒: Stores `Book_ID`, `Quantity`, and order-related details.  

## **🔍 Key SQL Concepts Used**  
✅ **LEFT JOIN** - To merge book and order data.  
✅ **GROUP BY** - To aggregate order quantities per book.  
✅ **COALESCE()** - To handle NULL values and show zero for books with no orders.  
✅ **SUM()** - To calculate total order quantity.  

## **📜 SQL Query Example**  
```sql
SELECT 
    b.Book_id, 
    b.Title, 
    b.Stock, 
    COALESCE(SUM(o.Quantity), 0) AS Order_quantity
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_id, b.Title, b.Stock;
