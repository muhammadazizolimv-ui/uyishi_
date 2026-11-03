
mysql> USE amalyot2;
Database changed
mysql>
mysql> CREATE TABLE azolar (
    ->     azo_id INT PRIMARY KEY,
    ->     ismi VARCHAR(50) NOT NULL,
    ->     familiyasi VARCHAR(50) NOT NULL,
    ->     telefon VARCHAR(20),
    ->     manzil VARCHAR(100)
    -> );AQuery OK, 0 rows affected (0.07 sec)

mysql>
mysql> INSERT INTO azolar (azo_id, ismi, familiyasi, telefon, manzil) VALUES
    -> (1, 'Aziz', 'Karimov', '+998901112233', 'Toshkent'),
    -> (2, 'Dilnoza', 'Rahimova', '+998902223344', 'Samarqand'),
    -> (3, 'Jasur', 'Aliyev', '+998903334455', 'Buxoro'),
    -> (4, 'Malika', 'Yusupova', '+998904445566', 'Andijon'),
    -> (5, 'Bobur', 'Tursunov', '+998905556677', 'Namangan'),
    -> (6, 'Nodira', 'Qodirova', '+998906667788', 'Farg''ona'),
    -> (7, 'Sardor', 'Ergashev', '+998907778899', 'Toshkent'),
    -> (8, 'Zilola', 'Hamidova', '+998908889900', 'Xiva'),
    -> (9, 'Otabek', 'Nazarov', '+998909990011', 'Qarshi'),
    -> (10, 'Madina', 'Sobirova', '+998901001122', 'Navoiy');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> CREATE DATABASE amalyot3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
Query OK, 1 row affected (0.05 sec)

mysql> USE amalyot3;
Database changed
mysql>
mysql> CREATE TABLE ijaralar (
    ->     ijara_id INT PRIMARY KEY,
    ->     kitob_id INT NOT NULL,
    ->     azo_id INT NOT NULL,
    ->     olingan_sana DATE NOT NULL,
    ->     qaytarilgan_sana DATE,
    ->     FOREIGN KEY (kitob_id) REFERENCES amalyot1.kitoblar(kitob_id),
    ->     FOREIGN KEY (azo_id) REFERENCES amalyot2.azolar(azo_id)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql>
mysql> INSERT INTO ijaralar (ijara_id, kitob_id, azo_id, olingan_sana, qaytarilgan_sana) VALUES
    -> (1, 1, 1, '2025-01-10', '2025-01-24'),
    -> (2, 5, 2, '2025-01-12', '2025-01-26'),
    -> (3, 9, 3, '2025-02-01', NULL),
    -> (4, 13, 4, '2025-02-03', '2025-02-17'),
    -> (5, 4, 5, '2025-02-10', NULL),
    -> (6, 19, 6, '2025-03-01', '2025-03-15'),
    -> (7, 43, 7, '2025-03-05', NULL),
    -> (8, 31, 8, '2025-03-08', '2025-03-22'),
    -> (9, 46, 9, '2025-03-12', NULL),
    -> (10, 10, 10, '2025-03-15', '2025-03-29');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT
    ->     i.ijara_id,
    ->     a.ismi,
    ->     a.familiyasi,
    ->     k.nomi AS kitob_nomi,
    ->     k.muallif,
    ->     i.olingan_sana,
    ->     i.qaytarilgan_sana
    -> FROM amalyot3.ijaralar i
    -> JOIN amalyot2.azolar a ON i.azo_id = a.azo_id
    -> JOIN amalyot1.kitoblar k ON i.kitob_id = k.kitob_id;