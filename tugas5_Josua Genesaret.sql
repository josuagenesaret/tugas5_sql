--1
CREATE DATABASE books_store;

CREATE TABLE books (
    id_buku INTEGER PRIMARY KEY AUTOINCREMENT,
    judul_buku VARCHAR(255),
    pengarang VARCHAR(255),
    tahun_terbit INTEGER,
    penerbit VARCHAR(200),
    tanggal_dibuat DATE DEFAULT CURRENT_DATE,
    tanggal_diupdate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE category (
    id_category INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_category VARCHAR(255),
    tanggal_dibuat DATE DEFAULT CURRENT_DATE,
    tanggal_diupdate DATE DEFAULT CURRENT_DATE
);

--2
INSERT INTO books (judul_buku, pengarang, tahun_terbit, penerbit) VALUES
	("Building Microservices", "Sam Newman", 2014, "O'Reilly Media"),
	("Clean Code", "Robert C. Martin", 2008, "Prentice Hall"),
	("The Pragmatic Programmer", "Andrew Hunt", 1999, "Addison-Wesley"),
	("Design Patterns", "Erich Gamma", 1994, "Addison-Wesley"),
	("Introduction to Algorithms", "Thomas H. Cormen", 1990, "MIT Press"),
	("The Art of Computer Prog.", "Donald E. Knuth", 1968, "Addison-Wesley"),
	("Clean Architecture", "Robert C. Martin", 2017, "Prentice Hall"),
	("Refactoring", "Martin Fowler", 1999, "Addison-Wesley"),
	("Domain-Driven Design", "Eric Evans", 2003, "Addison-Wesley"),
	("The Mythical Man-Month", "Frederick Brooks", 1975, "Addison-Wesley");
    
INSERT INTO category (nama_category) VALUES
	("Pemrograman"),
	("Fiksi"),
	("Nonfiksi"),
	("Bisnis"),
	("Teknologi"),
	("Seni"),
	("Sejarah"),
	("Sains"),
	("Hukum"),
	("Kesehatan")
    
--3
SELECT * FROM books
SELECT * FROM category

--4
UPDATE books 
SET judul_buku = "Building Microservices: Designing FineGrained Systems 1st", tahun_terbit = 2015
WHERE id_buku = 1

--5
DELETE FROM books WHERE id_buku = 10
DELETE FROM category WHERE id_category = 10

--6
SELECT judul_buku FROM books WHERE penerbit = "Addison-Wesley"
SELECT * FROM books WHERE tahun_terbit BETWEEN 2003 and 2023
SELECT * FROM books WHERE judul_buku LIKE "%Design%"

--7
CREATE TABLE book_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_category INTEGER,
    id_book INTEGER,
  	tanggal_dibuat DATE DEFAULT CURRENT_DATE,
    tanggal_diupdate DATE DEFAULT CURRENT_DATE,
  	FOREIGN KEY (id_category) REFERENCES category(id_category),
    FOREIGN KEY (id_book) REFERENCES books(id_buku)
 );
 
 --8
 INSERT INTO book_categories (id_category, id_book)VALUES
 	(1, 2),
    (5, 3),
    (1, 1)
 
 --9
SELECT books.id_buku AS id, books.judul_buku, category.nama_category
FROM books
INNER JOIN book_categories ON books.id_buku = book_categories.id_book
INNER JOIN category ON book_categories.id_category = category.id_category;

--10
ALTER TABLE books
ADD jumlah_halaman NUMBER;