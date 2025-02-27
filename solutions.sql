-- ### Order
-- 1. Find all subjects sorted by subject
  --  SELECT subject FROM subjects; 

--  Arts
--  Business
--  Children's Books
--  Classics
--  Computers
--  Cooking
--  Drama
--  Entertainment
--  History
--  Horror
--  Mystery
--  Poetry
--  Religion
--  Romance
--  Science
--  Science Fiction

-- 2. Find all subjects sorted by location
-- SELECT subject FROM subjects ORDER BY location;

--  History
--  Classics
--  Mystery
--  Horror
--  Arts
--  Cooking
--  Children's Books
--  Entertainment
--  Drama
--  Romance
--  Science Fiction
--  Science
--  Computers
--  Business
--  Poetry
--  Religion

-- ### Where
-- 3. Find the book "Little Women"
--SELECT * FROM books WHERE title ='Little Women';
-- booktown=# \i solutions.sql 
--  id  |    title     | author_id | subject_id 
-- -----+--------------+-----------+------------
--  190 | Little Women |        16 |          6

-- 4. Find all books containing the word "Python"
--SELECT * FROM books WHERE title LIKE '%Python%';
--   id   |       title        | author_id | subject_id 
-- -------+--------------------+-----------+------------
--  41473 | Programming Python |      7805 |          4
--  41477 | Learning Python    |      7805 |          4
-- (2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
--SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
--  id |     subject     | location 
-- ----+-----------------+----------
--   6 | Drama           | Main St
--   7 | Entertainment   | Main St
--  13 | Romance         | Main St
--  15 | Science Fiction | Main St


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
--SELECT books.title FROM books JOIN subjects ON books.subject_id = subjects.id JOIN  WHERE subjects.subject = 'Computers';
----------------------
--  Practical PostgreSQL
--  Perl Cookbook
--  Learning Python
--  Programming Python
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
--SELECT books.title, authors.first_name, authors.last_name, subjects.subject  FROM subjects JOIN books ON books.subject_id = subjects.id JOIN authors ON books.author_id = authors.id;
-- -----------------------------+------------------+--------------+------------------
--  Practical PostgreSQL        | John             | Worsley      | Computers
--  Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
--  The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
--  Little Women                | Louisa May       | Alcott       | Drama
--  The Shining                 | Stephen          | King         | Horror
--  Dune                        | Frank            | Herbert      | Science Fiction
--  Dynamic Anatomy             | Burne            | Hogarth      | Arts
--  Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
--  The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
--  Programming Python          | Mark             | Lutz         | Computers
--  Learning Python             | Mark             | Lutz         | Computers
--  Perl Cookbook               | Tom              | Christiansen | Computers
--  2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
--  The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
--  Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- SELECT books.title, stock.cost FROM stock JOIN editions ON stock.isbn = editions.isbn JOIN books on books.id = editions.book_id ORDER BY stock.cost DESC;

--             title            | cost  
-- -----------------------------+-------
--  2001: A Space Odyssey       | 36.00
--  Dune                        | 36.00
--  The Cat in the Hat          | 30.00
--  The Shining                 | 29.00
--  Dynamic Anatomy             | 26.00
--  Goodnight Moon              | 25.00
--  The Shining                 | 24.00
--  The Cat in the Hat          | 23.00
--  Franklin in the Dark        | 23.00
--  The Tell-Tale Heart         | 23.00
--  The Velveteen Rabbit        | 20.00
--  The Tell-Tale Heart         | 19.00
--  Little Women                | 18.00
--  2001: A Space Odyssey       | 17.00
--  Dune                        | 17.00
--  Bartholomew and the Oobleck | 16.00
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- SELECT books.title, stock.isbn, stock.retail, publishers.name  FROM stock JOIN editions ON stock.isbn = editions.isbn JOIN books on books.id = editions.book_id JOIN publishers on publishers.id = editions.publisher_id WHERE books.title = 'Dune';
--  title |    isbn    | retail |   name    
-- -------+------------+--------+-----------
--  Dune  | 0441172717 |  21.95 | Ace Books
--  Dune  | 044100590X |  45.95 | Ace Books
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
-- SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM books JOIN editions ON books.id = editions.book_id JOIN shipments ON editions.isbn = shipments.isbn JOIN customers ON shipments.customer_id = customers.id
-- -- first_name | last_name |       ship_date        |            title            
-- ------------+-----------+------------------------+-----------------------------
--  Annie      | Jackson   | 2001-09-14 20:42:22-04 | The Cat in the Hat
--  Jenny      | King      | 2001-09-14 19:46:32-04 | The Cat in the Hat
--  Julie      | Bollman   | 2001-08-13 12:42:10-04 | The Cat in the Hat
--  Eric       | Morrill   | 2001-08-10 16:47:52-04 | The Cat in the Hat
--  Chad       | Allen     | 2001-08-06 12:29:21-04 | The Cat in the Hat
--  Jonathan   | Anderson  | 2001-08-08 11:36:44-04 | The Shining
--  Jenny      | King      | 2001-08-14 16:45:51-04 | The Shining
--  Chuck      | Brown     | 2001-08-14 13:36:41-04 | The Shining
--  Annie      | Jackson   | 2001-09-22 23:58:56-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-09-22 14:23:28-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-08 13:46:13-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-06 14:46:36-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-07 13:58:36-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-11 12:55:05-04 | Bartholomew and the Oobleck
--  Rich       | Thomas    | 2001-08-10 10:29:52-04 | Franklin in the Dark
--  Tammy      | Robinson  | 2001-08-14 16:49:00-04 | Franklin in the Dark
--  Jean       | Owens     | 2001-08-12 15:09:47-04 | Franklin in the Dark
--  James      | Clark     | 2001-08-15 14:57:40-04 | Goodnight Moon
--  Laura      | Bennett   | 2001-08-06 10:49:44-04 | Goodnight Moon
--  Richard    | Brown     | 2001-08-11 13:52:34-04 | Goodnight Moon
--  Wendy      | Black     | 2001-08-09 12:30:46-04 | The Velveteen Rabbit
--  Dave       | Olson     | 2001-08-09 10:30:07-04 | The Velveteen Rabbit
--  Eric       | Morrill   | 2001-08-07 16:00:48-04 | Little Women
--  Owen       | Bollman   | 2001-08-05 12:34:04-04 | Little Women
--  Kathy      | Corner    | 2001-08-13 12:47:04-04 | The Cat in the Hat
--  James      | Williams  | 2001-08-11 16:34:08-04 | The Cat in the Hat
--  Owen       | Becker    | 2001-08-12 16:39:22-04 | The Shining
--  Ed         | Gould     | 2001-08-08 12:53:46-04 | The Shining
--  Royce      | Morrill   | 2001-08-07 14:31:57-04 | The Tell-Tale Heart
--  Adam       | Holloway  | 2001-08-14 16:41:39-04 | The Tell-Tale Heart
--  Jean       | Black     | 2001-08-10 11:29:42-04 | The Tell-Tale Heart
--  Trevor     | Young     | 2001-08-14 11:42:58-04 | Dune
--  Kate       | Gerdes    | 2001-08-12 11:46:35-04 | Dune
--  Christine  | Holloway  | 2001-08-07 14:56:42-04 | 2001: A Space Odyssey
--  Shirley    | Gould     | 2001-08-15 17:02:01-04 | 2001: A Space Odyssey
--  Tim        | Owens     | 2001-08-14 10:33:47-04 | Dynamic Anatomy
 -- ### Grouping and Counting
-- 11. Get the COUNT of all books
-- SELECT count(*) FROM books
-- 15
-- 12. Get the COUNT of all Locations
-- SELECT count(location) FROM subjects
-- 15
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- SELECT location, COUNT(location) FROM subjects GROUP BY location; 
-- ------------------+-------
--                   |     0
--  Sunset Dr        |     1
--  Kids Ct          |     1
--  Black Raven Dr   |     2
--  Creativity St    |     2
--  Academic Rd      |     2
--  Main St          |     4
--  Productivity Ave |     3
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
-- SELECT books.title, COUNT(editions.book_id) AS editions FROM books JOIN editions ON books.id = editions.book_id GROUP BY books.title;
--             title            | editions 
-- -----------------------------+----------
--  The Tell-Tale Heart         |        2
--  Bartholomew and the Oobleck |        1
--  Programming Python          |        1
--  2001: A Space Odyssey       |        2
--  Dune                        |        2
--  The Shining                 |        2
--  The Velveteen Rabbit        |        1
--  Little Women                |        1
--  The Cat in the Hat          |        2
--  Franklin in the Dark        |        1
--  Dynamic Anatomy             |        1
--  Goodnight Moon              |        1