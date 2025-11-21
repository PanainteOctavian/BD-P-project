TABELA PERSOANE

INSERT INTO PERSOANE VALUES( 5040917134679, 'panainte.oct@gmail.com', '0333444555' ); 
// PK: CNP trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.PERSOANE_PK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PERSOANE VALUES( 504091713467, 'panainte.oct@gmail.com', '0333444555' ); 
// CK: CNP trebuie sa aiba 13 caractere
ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_CNP_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PERSOANE VALUES( 'a040917134679', 'panainte.oct@gmail.com', '0333444555' ); 
// CK: CNP trebuie sa aiba doar cifre
ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_CNP_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PERSOANE VALUES( 1040917134679, 'panainte.oct@gmail.com', '0333444555' ); 
// UK: adresa_email trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.PERSOANE_ADRESA_EMAIL_UK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PERSOANE VALUES( 1040917134679, 'panainte.octgmail.com', '0333444555' ); 
// CK: adresa_email nu respecta regex-ul de email
ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_ADRESA_EMAIL_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PERSOANE VALUES( 1040917134679, 'panainte.oct12@gmail.com', '0333444555' ); 
// UK: numar_telefon trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.PERSOANE_NUMAR_TELEFON_UK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PERSOANE VALUES( 1040917134679, 'panainte.oct12@gmail.com', '333444555' ); 
// CK: numar_telefon trebuie sa aiba 10 caractere 
ORA-02290: check constraint (RO_A285_SQL_S51.PERSOANE_NUMAR_TELEFON_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

-----------------------------------------
TABELA PROPRIETARI

INSERT INTO PROPRIETARI VALUES( 6050918123456, 'Popa Oana-Maria' ); 
// PK: CNP trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.PROPRIETARI_PK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PROPRIETARI VALUES( 0050918123456, 'Popa Oana-Maria' ); 
// FK: CNP trebuie sa existe deja in tabela PERSOANE
ORA-02291: integrity constraint (RO_A285_SQL_S51.PERSOANE_PROPRIETARI_FK) violated - parent key not found
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PROPRIETARI VALUES( 6050918123456, NULL); 
// NN: nume_proprietar nu poate sa fie NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."PROPRIETARI"."NUME_PROPRIETAR")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PROPRIETARI VALUES( 5041209123456, 'Pop' ); 
// CK: nume_proprietar trebuie sa aiba mai mult de 8 caractere(inclusiv spatiu)
ORA-02290: check constraint (RO_A285_SQL_S51.PROPRIETARI_NUME_PROPRIETAR_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO PROPRIETARI VALUES( 6050918123456, '111 Popa Oana-Maria' ); 
// CK: nume_proprietar nu poate contine cifre
ORA-02290: check constraint (RO_A285_SQL_S51.PROPRIETARI_NUME_PROPRIETAR_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

-----------------------------------------
TABELA CLIENTI

INSERT INTO CLIENTI VALUES( 5040917134679, 'Panainte Silviu-Octavian' ); 
// PK: CNP trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.CLIENTI_PK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CLIENTI VALUES( 040917134679, 'Panainte Silviu-Octavian' ); 
// FK: CNP trebuie sa existe deja in tabela PERSOANE
ORA-02291: integrity constraint (RO_A285_SQL_S51.PERSOANE_CLIENTI_FK) violated - parent key not found
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CLIENTI VALUES( 5040917134679, NULL ); 
// NN: nume_client nu poate sa fie NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CLIENTI"."NUME_CLIENT")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CLIENTI VALUES( 5041209654321, 'Pop' ); 
// CK: nume_client trebuie sa aiba mai mult de 8 caractere(inclusiv spatiu)
ORA-02290: check constraint (RO_A285_SQL_S51.CLIENTI_NUME_CLIENT_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CLIENTI VALUES( 5040917134679, '111 Panainte Silviu-Octavian' ); 
// CK: nume_client nu poate contine cifre
ORA-02290: check constraint (RO_A285_SQL_S51.CLIENTI_NUME_CLIENT_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

-----------------------------------------
TABELA CAZARI

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
// PK: id_cazare trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.CAZARI_PK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    20,
    6050918123456,
    'Hotel Royal',
    400,
    'Str. Pacii 340',
    'Vaslui',
    'Romania',
    'hotel'
); 
// CK: id_cazare nu poate fi mai mic de 50
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ID_CAZARE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

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
// FK: CNP trebuie sa existe deja in tabela PROPRIETARI
ORA-02291: integrity constraint (RO_A285_SQL_S51.PROPRIETARI_CAZARI_FK) violated - parent key not found
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    NULL,
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    'Romania',
    'pensiune'
); 
// NN: nume_cazare nu poate fi NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CAZARI"."NUME_CAZARE")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    '123 Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    'Romania',
    'pensiune'
); 
// CK: nume_cazare nu poate contine cifre
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_NUME_CAZARE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    NULL,
    'Bulevardul Traian 1',
    'Vaslui',
    'Romania',
    'pensiune'
); 
// NN: pret24h nu poate fi NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CAZARI"."PRET24H")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    10.05,
    'Bulevardul Traian 1',
    'Vaslui',
    'Romania',
    'pensiune'
); 
// CK: pret24h nu poate fi mai mic de 50.00
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_PRET_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    NULL,
    'Vaslui',
    'Romania',
    'pensiune'
); 
// NN: adresa nu poate fi NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CAZARI"."ADRESA")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Strada',
    'Vaslui',
    'Romania',
    'pensiune'
); 
// CK: adresa trebuie sa aiba mai mult de 10 caractere
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ADRESA_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    NULL,
    'Romania',
    'pensiune'
); 
// NN: oras nu poate fi NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CAZARI"."ORAS")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    '111 Vaslui',
    'Romania',
    'pensiune'
); 
// CK: oras nu poate contine cifre
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ORAS_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vas',
    'Romania',
    'pensiune'
); 
// CK: oras trebuie sa aiba cel putin 4 caractere
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_ORAS_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    NULL,
    'pensiune'
); 
// NN: tara nu poate fi NULL 
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."CAZARI"."TARA")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    '111 Romania',
    'pensiune'
); 
// CK: tara nu poate contine cifre
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_TARA_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    'R',
    'pensiune'
); 
// CK: tara trebuie sa aiba cel putin 2 caractere
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_TARA_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO CAZARI VALUES(
    60,
    6050918123456,
    'Pensiunea Margareta',
    100,
    'Bulevardul Traian 1',
    'Vaslui',
    'Romania',
    'nimic'
); 
// CK: tip_cazare trebuie sa faca parte din lista (apartament, hotel, motel, pensiune, vila)
ORA-02290: check constraint (RO_A285_SQL_S51.CAZARI_TIP_CAZARE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

-----------------------------------------
TABELA REZERVARI

INSERT INTO REZERVARI VALUES(
    2000,
    5040917134679,
    50,
    20,
    '1-JAN-2026'
);  
// PK: id_rezervare trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.REZERVARI_PK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO REZERVARI VALUES(
    1000,
    5040917134679,
    50,
    20,
    '30-NOV-2026'
);  
// CK: id_rezervare nu poate fi mai mic de 2000
ORA-02290: check constraint (RO_A285_SQL_S51.REZERVARI_ID_REZERVARE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO REZERVARI VALUES(
    3000,
    1234567891234,
    50,
    20,
    '30-NOV-2026'
); 
// FK: CNP trebuie sa existe deja in tabela CLIENTI
ORA-02291: integrity constraint (RO_A285_SQL_S51.CLIENTI_REZERVARI_FK) violated - parent key not found
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO REZERVARI VALUES(
    3000,
    5040917134679,
    222,
    20,
    '30-NOV-2026'
); 
// FK: id_cazare trebuie sa existe deja in tabela CAZARI
ORA-02291: integrity constraint (RO_A285_SQL_S51.CAZARI_REZERVARI_FK) violated - parent key not found
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO REZERVARI VALUES(
    3000,
    5040917134679,
    53,
    99,
    '30-NOV-2026'
); 
// CK: durata_zile trebuie sa fie in intervalul [1, 30]
ORA-02290: check constraint (RO_A285_SQL_S51.REZERVARI_DURATA_ZILE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO REZERVARI VALUES(
    3000,
    5040917134679,
    53,
    0,
    '30-NOV-2026'
); 
// CK: durata_zile trebuie sa fie in intervalul [1, 30]
ORA-02290: check constraint (RO_A285_SQL_S51.REZERVARI_DURATA_ZILE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO REZERVARI VALUES(
    3000,
    5040917134679,
    53,
    2,
    '14-NOV-2025'
); 
// CK: data_inceput trebuie sa fie mai mare de SYSDATE
ORA-20001: Data invalida: 14.11.2025 00:00:00 trebuie sa fie mai mare decat data curenta.
ORA-06512: at "RO_A285_SQL_S51.TRG_REZERVARI_BRIU", line 4
ORA-04088: error during execution of trigger 'RO_A285_SQL_S51.TRG_REZERVARI_BRIU'
ORA-06512: at "SYS.DBMS_SQL", line 1721

--------------------------------------
Tabela RECENZII

INSERT INTO RECENZII VALUES(
    2000,
    'Nu ne-a placut',
    1
);
// PK: id_rezervare trebuie sa fie unic
ORA-00001: unique constraint (RO_A285_SQL_S51.RECENZII_PK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO RECENZII VALUES(
    4000,
    'O cazare buna',
    5
);
// FK: id_rezervare trebuie sa existe in tabela REZERVARI
ORA-02291: integrity constraint (RO_A285_SQL_S51.REZERVARI_RECENZII_FK) violated - parent key not found
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO RECENZII VALUES(
    2004,
    'Foarte frumos mai venim',
    NULL
);
// NN: stele nu poate fi NULL
ORA-01400: cannot insert NULL into ("RO_A285_SQL_S51"."RECENZII"."STELE")
ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO RECENZII VALUES(
    2004,
    'Foarte frumos mai venim',
    6
);
// CK: stele trebuie sa fie in intervalul [1, 5]
ORA-02290: check constraint (RO_A285_SQL_S51.RECENZII_STELE_CK) violated
ORA-06512: at "SYS.DBMS_SQL", line 1721

----------------------------------------------
SELECT CLIENTI.CNP, CLIENTI.NUME_CLIENT, CAZARI.ID_CAZARE, CAZARI.NUME_CAZARE
FROM CLIENTI, CAZARI, REZERVARI
WHERE CLIENTI.CNP = 5040917134679 
AND CLIENTI.CNP = REZERVARI.CNP 
AND CAZARI.ID_CAZARE = REZERVARI.ID_CAZARE;

SELECT CLIENTI.CNP, CLIENTI.NUME_CLIENT, RECENZII.CONTINUT
FROM CLIENTI, REZERVARI, RECENZII
WHERE CLIENTI.CNP = 5040917134679 
AND CLIENTI.CNP = REZERVARI.CNP 
AND RECENZII.ID_REZERVARE = REZERVARI.ID_REZERVARE;
