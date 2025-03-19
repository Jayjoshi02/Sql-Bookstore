create database Bookstore

select * from Books
select * from Customers
select * from Orders

#Basic Query:
-- 1) Retrieve all books in the "Fiction" genre:
select * from Books
where Genre = 'Fiction'

--2) Find books published after the year 1950:
select * from Books
where Published_Year > 1950

--3) List all customers from the Canada:
select * from Customers
where Country = 'Canada'
 
 --4) Show orders placed in November 2023:
 select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30'

--5) Retrieve the total stock of books available:
select SUM(Stock) as totalStock
from Books

--6) Find the details of the most expensive book:
select * from Books 
order by price desc

--7) Show all customers who ordered more than 1 quantity of a book:
 select * from Orders
 where Quantity > 1

 --8) Retrieve all orders where the total amount exceeds $20:
  select * from Orders
 where Total_Amount > 20

 --9) List all genres available in the Books table:
   select DISTINCT Genre from Books

 --10) Find the book with the lowest stock:
 select * from Books
 order by Stock 

 --11) Calculate the total revenue generated from all orders:
 select sum(Total_Amount) as  totalrevenue
 from Orders

 #Advanced Query:

 --1) Retrieve the total number of books sold for each genre:
 select b.Genre,sum(o.Quantity) as total_books_sold
 from Orders o
 join Books b
 on o.Book_id = b.Book_id
 group by b.Genre

--2) Find the average price of books in the "Fantasy" genre:
select avg(Price) as Average_price
from Books
where Genre = 'Fantasy'

--3) List customers who have placed at least 2 orders:
select o.Customer_ID,c.Name,count(o.Order_ID) as Order_count
from Orders o
Join Customers c
on o.Customer_ID = c.Customer_ID
group by o.Customer_ID,c.Name
having count(o.Order_ID) >=2

--4) Find the most frequently ordered book:
select o.Book_ID,b.title,count(o.Order_ID) as Order_count
from Orders o
join Books b
on o.Book_ID = b.Book_ID 
group by o.Book_id,b.title
order by Order_count desc

--5) Show the top 3 most expensive books of 'Fantasy' Genre:
select * from Books
where Genre = 'Fantasy'
order by Price desc

--6) Retrieve the total quantity of books sold by each author:
select b.Author,SUM(o.Quantity) as Total_books_sold
from Orders o
join Books b
on o.Book_ID = b.Book_ID
group by  b.Author

--7) List the cities where customers who spent over $30 are located:
select distinct c.city,total_amount
from Orders o
join Customers c
on o.Customer_ID = c.Customer_ID
where o.Total_Amount > 30

--8) Find the customer who spent the most on orders:
select c.Customer_ID,c.name,sum(o.total_amount) as Total_spent
from Orders o
join Customers c
on o.Customer_ID =c.Customer_ID
group by c.Customer_ID,c.name
order by Total_spent desc

--9) Calculate the stock remaining after fulfilling all orders:
select b.Book_id,b.Title,b.Stock, coalesce(sum(o.quantity),0) as Order_quantity,
b.Stock - coalesce(sum(o.quantity),0) as Remaing_qty
from Books b
left join Orders o
on b.Book_ID = o.Book_ID
group by b.Book_id,b.Title,b.Stock