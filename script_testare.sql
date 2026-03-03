-- Tabela PERSOANE
-- PK: CNP trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.PERSOANE_PK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO PERSOANE VALUES( 5040917134679, 'panainte.oct@gmail.com', '0333444555' ); 

-- CK: CNP trebuie sa aiba 13 caractere
-- ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_CNP_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PERSOANE SET CNP = 1 WHERE CNP = 5040917134679;

-- CK: CNP trebuie sa aiba doar cifre
-- ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_CNP_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PERSOANE SET CNP = 'a040917134679' WHERE CNP = 5040917134679;

-- UK: adresa_email trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.PERSOANE_ADRESA_EMAIL_UK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PERSOANE SET ADRESA_EMAIL = 'panainte.oct@gmail.com' WHERE CNP = 6050918123456;

-- CK: adresa_email nu respecta regex-ul de email
-- ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_ADRESA_EMAIL_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PERSOANE SET ADRESA_EMAIL = 'abc' WHERE CNP = 6050918123456;

-- UK: numar_telefon trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.PERSOANE_NUMAR_TELEFON_UK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PERSOANE SET NUMAR_TELEFON = 0444444444 WHERE CNP = 5040917134679;

-- CK: numar_telefon trebuie sa aiba 10 caractere 
-- ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_NUMAR_TELEFON_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PERSOANE SET NUMAR_TELEFON = 111 WHERE CNP = 6050918123456;

-----------------------------------------
-- Tabela PROPRIETARI

-- PK: CNP trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.PROPRIETARI_PK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO PROPRIETARI VALUES( 6050918123456, 'Popa Oana-Maria' ); 

-- FK: CNP trebuie sa existe deja in tabela PERSOANE
-- ORA-02291: integrity constraint (RO_A285_SQL_S51.PERSOANE_PROPRIETARI_FK) violated - parent key not found
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO PROPRIETARI VALUES( 1, 'Popa Oana-Maria' ); 

-- NN: nume_proprietar nu poate sa fie NULL
-- ORA-01407: cannot update ("RO_A285_SQL_S51"."PROPRIETARI"."NUME_PROPRIETAR") to NULL
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PROPRIETARI SET NUME_PROPRIETAR = NULL WHERE CNP = 6050918123456;

-- CK: nume_proprietar trebuie sa aiba mai mult de 8 caractere(inclusiv spatiu)
-- ORA-02290: check constraint (RO_A285_SQL_S51.PROPRIETARI_NUME_PROPRIETAR_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PROPRIETARI SET NUME_PROPRIETAR = 'Pop' WHERE CNP = 6050918123456;

-- CK: nume_proprietar nu poate contine cifre
-- ORA-02290: check constraint (RO_A285_SQL_S51.PROPRIETARI_NUME_PROPRIETAR_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE PROPRIETARI SET NUME_PROPRIETAR = '111 Popa Oana-Maria' WHERE CNP = 6050918123456;

-----------------------------------------
-- Tabela CLIENTI

-- PK: CNP trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.CLIENTI_PK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO CLIENTI VALUES( 5040917134679, 'Panainte Silviu-Octavian' ); 

-- FK: CNP trebuie sa existe deja in tabela PERSOANE
-- ORA-02291: integrity constraint (RO_A285_SQL_S51.PERSOANE_CLIENTI_FK) violated - parent key not found
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO CLIENTI VALUES( 1, 'Panainte Silviu-Octavian' ); 

-- NN: nume_client nu poate sa fie NULL
-- ORA-01407: cannot update ("RO_A285_SQL_S51"."CLIENTI"."NUME_CLIENT") to NULL
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CLIENTI SET NUME_CLIENT = NULL WHERE CNP = 5040917134679;

-- CK: nume_client trebuie sa aiba mai mult de 8 caractere(inclusiv spatiu)
-- ORA-02290: check constraint (RO_A285_SQL_S51.CLIENTI_NUME_CLIENT_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CLIENTI SET NUME_CLIENT = 'Pop' WHERE CNP = 5040917134679;

-- CK: nume_client nu poate contine cifre
-- ORA-02290: check constraint (RO_A285_SQL_S51.CLIENTI_NUME_CLIENT_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CLIENTI SET NUME_CLIENT = '111 Panainte Silviu-Octavian' WHERE CNP = 5040917134679;

-----------------------------------------
-- Tabela CAZARI

-- PK: id_cazare trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.CAZARI_PK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO CAZARI VALUES(
    50,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    'Romania',
    'pensiune'
); 

-- CK: id_cazare nu poate fi mai mic de 50
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ID_CAZARE_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET ID_CAZARE = 20 WHERE ID_CAZARE = 50;

-- FK: CNP trebuie sa existe deja in tabela PROPRIETARI
-- ORA-02291: integrity constraint (RO_A285_SQL_S51.PROPRIETARI_CAZARI_FK) violated - parent key not found
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO CAZARI VALUES(
    60,
    1234567891234,
    'Apartment ultra central',
    500,
    'Str. Doamnei 2',
    'Bucuresti',
    'Romania',
    'apartament'
);

-- NN: nume_cazare nu poate fi NULL
-- ORA-01407: cannot update ("RO_A285_SQL_S51"."CAZARI"."NUME_CAZARE") to NULL
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET NUME_CAZARE = NULL WHERE ID_CAZARE = 50;

-- CK: nume_cazare nu poate contine cifre
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_NUME_CAZARE_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET NUME_CAZARE = '123 Pensiune' WHERE ID_CAZARE = 50;

-- NN: pret24h nu poate fi NULL
-- ORA-01407: cannot update ("RO_A285_SQL_S51"."CAZARI"."PRET24H") to NULL
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET PRET24H = NULL WHERE ID_CAZARE = 50;

-- CK: pret24h nu poate fi mai mic de 50.00
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_PRET_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET PRET24H = 10.0 WHERE ID_CAZARE = 50;

-- NN: adresa nu poate fi NULL
-- ORA-01407: cannot update ("RO_A285_SQL_S51"."CAZARI"."ADRESA") to NULL
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET ADRESA = NULL WHERE ID_CAZARE = 50;

-- CK: adresa trebuie sa aiba mai mult de 10 caractere
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ADRESA_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET ADRESA = 'Str' WHERE ID_CAZARE = 50;

-- NN: oras nu poate fi NULL
-- ORA-01407: cannot update ("RO_A285_SQL_S51"."CAZARI"."ORAS") to NULL
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET ORAS = NULL WHERE ID_CAZARE = 50;

-- CK: oras nu poate contine cifre
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ORAS_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET ORAS = '123 Vaslui' WHERE ID_CAZARE = 50;

-- CK: oras trebuie sa aiba cel putin 4 caractere
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ORAS_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET ORAS = 'abc' WHERE ID_CAZARE = 50;

-- NN: tara nu poate fi NULL 
-- ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CAZARI"."TARA")
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET TARA = NULL WHERE ID_CAZARE = 50; 

-- CK: tara nu poate contine cifre
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_TARA_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET TARA = '123 Romania' WHERE ID_CAZARE = 50; 

-- CK: tara trebuie sa aiba cel putin 2 caractere (Cel mai mic nume de tara: UK(United Kingdom))
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_TARA_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET TARA = 'a' WHERE ID_CAZARE = 50;

-- CK: tip_cazare trebuie sa faca parte din lista (apartament, hotel, motel, pensiune, vila)
-- ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_TIP_CAZARE_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE CAZARI SET TIP_CAZARE = 'nimic' WHERE ID_CAZARE = 50;

-----------------------------------------
-- Tabela REZERVARI

-- PK: id_rezervare trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.REZERVARI_PK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO REZERVARI VALUES(
    2000,
    5040917134679,
    50,
    20,
    '1-JAN-2026'
);  

-- CK: id_rezervare nu poate fi mai mic de 2000
-- ORA-02290: check constraint (RO_A285_SQL_S51.REZERVARI_ID_REZERVARE_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE REZERVARI SET ID_REZERVARE = 1000 WHERE ID_REZERVARE = 2000;

-- FK: CNP trebuie sa existe deja in tabela CLIENTI
-- ORA-02291: integrity constraint (RO_A285_SQL_S51.CLIENTI_REZERVARI_FK) violated - parent key not found
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO REZERVARI VALUES(
    3000,
    1234567891234,
    50,
    20,
    '30-NOV-2026'
); 

-- FK: id_cazare trebuie sa existe deja in tabela CAZARI
-- ORA-02291: integrity constraint (RO_A285_SQL_S51.CAZARI_REZERVARI_FK) violated - parent key not found
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO REZERVARI VALUES(
    3000,
    5040917134679,
    222,
    20,
    '30-NOV-2026'
); 

-- CK: durata_zile trebuie sa fie in intervalul [1, 30]
-- ORA-02290: check constraint (RO_A285_SQL_S51.REZERVARI_DURATA_ZILE_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE REZERVARI SET DURATA_ZILE = 99 WHERE ID_REZERVARE = 2000; 

-- CK: data_inceput trebuie sa fie mai mare de SYSDATE
-- ORA-20001: Data invalida: 27.11.2025 00:00:00 trebuie sa fie mai mare decat data curenta.
-- ORA-06512: at "RO_A285_SQL_S51.TRG_REZERVARI_BRIU", line 4
-- ORA-04088: error during execution of trigger 'RO_A285_SQL_S51.TRG_REZERVARI_BRIU'
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE REZERVARI SET DATA_INCEPUT = '27-NOV-2025' WHERE ID_REZERVARE = 2000;

--------------------------------------
-- Tabela RECENZII

-- PK: id_rezervare trebuie sa fie unic
-- ORA-00001: unique constraint (RO_A285_SQL_S51.RECENZII_PK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO RECENZII VALUES(
    2000,
    'Nu ne-a placut',
    1
);

-- FK: id_rezervare trebuie sa existe in tabela REZERVARI
-- ORA-02291: integrity constraint (RO_A285_SQL_S51.REZERVARI_RECENZII_FK) violated - parent key not found
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
INSERT INTO RECENZII VALUES(
    4000,
    'O cazare buna',
    5
);

-- NN: stele nu poate fi NULL
-- ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."RECENZII"."STELE")
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE RECENZII SET STELE = NULL WHERE ID_REZERVARE = 2000;

-- CK: stele trebuie sa fie in intervalul [1, 5]
-- ORA-02290: check constraint (RO_A285_SQL_S51.RECENZII_STELE_CK) violated
-- ORA-06512: at "SYS.DBMS_SQL", line 1721
UPDATE RECENZII SET STELE = 6 WHERE ID_REZERVARE = 2000;

----------------------------------------------
-- Interogari

-- id-ul si numele cazarilor la care a stat clientul cu CNP = 5040917134679
SELECT C.CNP AS "CNP CLIENT", CA.ID_CAZARE, CA.NUME_CAZARE
FROM CLIENTI C
INNER JOIN REZERVARI R ON C.CNP = R.CNP
INNER JOIN CAZARI CA ON R.ID_CAZARE = CA.ID_CAZARE
WHERE C.CNP = 5040917134679;

-- recenziile pe care le a lasat clientul cu CNP = 5040917134679
SELECT C.CNP AS "CNP CLIENT", CA.NUME_CAZARE, R.CONTINUT, R.STELE
FROM CLIENTI C
INNER JOIN REZERVARI REZ ON C.CNP = REZ.CNP
INNER JOIN CAZARI CA ON REZ.ID_CAZARE = CA.ID_CAZARE
INNER JOIN RECENZII R ON REZ.ID_REZERVARE = R.ID_REZERVARE
WHERE C.CNP = 5040917134679;

-- numele proprietarilor la care a stat clientul cu CNP = 5040917134679
SELECT C.CNP AS "CNP CLIENT", P.NUME_PROPRIETAR
FROM CLIENTI C
INNER JOIN REZERVARI R ON C.CNP = R.CNP
INNER JOIN CAZARI CA ON R.ID_CAZARE = CA.ID_CAZARE
INNER JOIN PROPRIETARI P ON CA.CNP = P.CNP
WHERE C.CNP = 5040917134679;

-- adresa de email a clientului care a lasat cea mai proasta recenzie
SELECT DISTINCT P.ADRESA_EMAIL, R.STELE
FROM PERSOANE P
INNER JOIN CLIENTI C ON P.CNP = C.CNP
INNER JOIN REZERVARI REZ ON C.CNP = REZ.CNP
INNER JOIN RECENZII R ON REZ.ID_REZERVARE = R.ID_REZERVARE
WHERE R.STELE = (SELECT MIN(STELE) FROM RECENZII);
