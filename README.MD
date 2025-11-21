# Hospitality Booking Platform - Database Project

Bază de date Oracle pentru o platformă de rezervări în domeniul ospitalității (hoteluri, pensiuni, apartamente, moteluri, vile).

## Cuprins
- [Descriere](#descriere)
- [Structura Bazei de Date](#structura-bazei-de-date)
- [Diagrama ER](#diagrama-er)
- [Instalare](#instalare)
- [Constrained și Reguli](#constrained-și-reguli)
- [Exemple de Utilizare](#exemple-de-utilizare)
- [Tehnologii Utilizate](#tehnologii-utilizate)

## Descriere

Acest proiect implementează o bază de date completă pentru gestionarea unei platforme de rezervări în domeniul ospitalității. Baza de date suportă:

- Gestionarea persoanelor (proprietari și clienți)
- Gestionarea cazărilor (hoteluri, pensiuni, apartamente, moteluri, vile)
- Sistem de rezervări cu validare automată a datelor
- Sistem de recenzii pentru cazări

## Structura Bazei de Date

### Tabele Principale

#### 1. **PERSOANE**
Tabelă părinte care conține informații generale despre toate persoanele din sistem.
- `CNP` (PK) - Cod Numeric Personal (13 cifre)
- `adresa_email` (UK) - Adresă de email unică
- `numar_telefon` (UK) - Număr de telefon unic (10 cifre)

#### 2. **PROPRIETARI**
Proprietari de cazări (moștenește din PERSOANE).
- `CNP` (PK, FK) - Referință către PERSOANE
- `nume_proprietar` (NN) - Nume complet (min. 8 caractere)

#### 3. **CLIENTI**
Clienți care fac rezervări (moștenește din PERSOANE).
- `CNP` (PK, FK) - Referință către PERSOANE
- `nume_client` (NN) - Nume complet (min. 8 caractere)

#### 4. **CAZARI**
Proprietăți disponibile pentru rezervare.
- `id_cazare` (PK) - ID generat automat (≥ 50)
- `CNP` (FK) - Proprietarul cazării
- `nume_cazare` (NN) - Nume cazare (min. 5 caractere, fără cifre)
- `pret24h` (NN) - Preț pe 24h (≥ 50 RON)
- `adresa` (NN) - Adresă completă (min. 10 caractere)
- `oras` (NN) - Oraș (min. 4 caractere, fără cifre)
- `tara` (NN) - Țară (min. 2 caractere, fără cifre)
- `tip_cazare` - Tipul cazării: `apartament`, `hotel`, `motel`, `pensiune`, `vila`

#### 5. **REZERVARI**
Rezervări efectuate de clienți.
- `id_rezervare` (PK) - ID generat automat (≥ 2000)
- `CNP` (FK) - Clientul care face rezervarea
- `id_cazare` (FK) - Cazarea rezervată
- `durata_zile` (NN) - Număr de zile (1-30)
- `data_inceput` (NN) - Data de început (trebuie > SYSDATE)

#### 6. **RECENZII**
Recenzii pentru rezervări completate.
- `id_rezervare` (PK, FK) - Referință către REZERVARI
- `continut` - Text recenzie (max. 2000 caractere, opțional)
- `stele` (NN) - Rating (1-5)

## Diagrama ER

```
PERSOANE (părinte)
    ├── PROPRIETARI
    │       └── CAZARI
    │               └── REZERVARI
    │                       └── RECENZII
    └── CLIENTI
            └── REZERVARI
```

## Instalare

### Prerequizite
- Oracle Database 11g sau superior
- Oracle SQL Developer (recomandat)
- Privilegii de CREATE TABLE, SEQUENCE, TRIGGER

### Pași de Instalare

1. **Clonează repository-ul:**
```bash
git clone https://github.com/PanainteOctavian/BD-P-project.git
cd BD-P-project
```

2. **Creează structura bazei de date:**
```sql
@database/schema/scriptddl.sql
```

3. **Inserează date de test:**
```sql
@database/data/insert_data.sql
```

4. **[Opțional] Testează constraint-urile:**
```sql
@database/tests/test_constraints.sql
```

## Constrained și Reguli

### Primary Keys (PK)
- CNP pentru PERSOANE, PROPRIETARI, CLIENTI
- id_cazare pentru CAZARI
- id_rezervare pentru REZERVARI, RECENZII

### Foreign Keys (FK)
- PROPRIETARI.CNP → PERSOANE.CNP
- CLIENTI.CNP → PERSOANE.CNP
- CAZARI.CNP → PROPRIETARI.CNP
- REZERVARI.CNP → CLIENTI.CNP
- REZERVARI.id_cazare → CAZARI.id_cazare
- RECENZII.id_rezervare → REZERVARI.id_rezervare

### Unique Constraints (UK)
- PERSOANE: adresa_email, numar_telefon

### Check Constraints (CK)
- **CNP**: 13 cifre exacte
- **Email**: Format valid (regex)
- **Telefon**: 10 cifre exacte
- **Nume**: Min. 8 caractere, doar litere și spații/cratimă
- **Preț**: ≥ 50 RON
- **Oraș/Țară**: Doar litere, min. 4/2 caractere
- **Tip cazare**: Unul din: apartament, hotel, motel, pensiune, vila
- **Durată**: Între 1 și 30 zile
- **Stele**: Între 1 și 5

### Triggers
1. **trg_rezervari_BRIU**: Validează că data_inceput > SYSDATE
2. **cazari_id_cazare_trg**: Auto-increment pentru id_cazare (sequence)
3. **rezervari_id_rezervare_trg**: Auto-increment pentru id_rezervare (sequence)

### Sequences
- `cazari_id_cazare_seq`: START WITH 50
- `rezervari_id_rezervare_seq`: START WITH 2000

## Exemple de Utilizare

### Adăugare cazare nouă
```sql
INSERT INTO PERSOANE VALUES(1234567890123, 'john@example.com', '0712345678');
INSERT INTO PROPRIETARI VALUES(1234567890123, 'John Doe Senior');
INSERT INTO CAZARI(CNP, NUME_CAZARE, PRET24H, ADRESA, ORAS, TARA, TIP_CAZARE) 
VALUES(1234567890123, 'Hotel Central', 150, 'Str. Principala 100', 
       'Cluj-Napoca', 'Romania', 'hotel');
```

### Efectuare rezervare
```sql
INSERT INTO PERSOANE VALUES(2345678901234, 'jane@example.com', '0723456789');
INSERT INTO CLIENTI VALUES(2345678901234, 'Jane Smith Junior');
INSERT INTO REZERVARI(CNP, ID_CAZARE, DURATA_ZILE, DATA_INCEPUT) 
VALUES(2345678901234, 50, 5, '15-DEC-2026');
```

### Interogări utile

**Toate rezervările unui client:**
```sql
SELECT c.NUME_CLIENT, caz.NUME_CAZARE, r.DATA_INCEPUT, r.DURATA_ZILE
FROM CLIENTI c
JOIN REZERVARI r ON c.CNP = r.CNP
JOIN CAZARI caz ON r.ID_CAZARE = caz.ID_CAZARE
WHERE c.CNP = '5040917134679';
```

**Recenziile unui client:**
```sql
SELECT c.NUME_CLIENT, caz.NUME_CAZARE, rec.STELE, rec.CONTINUT
FROM CLIENTI c
JOIN REZERVARI r ON c.CNP = r.CNP
JOIN CAZARI caz ON r.ID_CAZARE = caz.ID_CAZARE
JOIN RECENZII rec ON r.ID_REZERVARE = rec.ID_REZERVARE
WHERE c.CNP = '5040917134679';
```

**Cazări după tip și preț:**
```sql
SELECT NUME_CAZARE, ORAS, PRET24H, TIP_CAZARE
FROM CAZARI
WHERE TIP_CAZARE = 'hotel' AND PRET24H < 200
ORDER BY PRET24H;
```

## Tehnologii Utilizate

- **Oracle Database 11g** - Sistem de gestiune a bazelor de date
- **Oracle SQL Developer Data Modeler 24.3** - Design și modelare
- **PL/SQL** - Triggers și proceduri stocate
- **Oracle Sequences** - Auto-increment pentru ID-uri

## Testare

Proiectul include teste comprehensive pentru toate constraint-urile:

- Testare Primary Keys (unicitate)
- Testare Foreign Keys (integritate referențială)
- Testare Check Constraints (validări de format și valori)
- Testare Unique Constraints
- Testare Not Null Constraints
- Testare Triggers (validare date)

Vezi fișierul `database/tests/test_constraints.sql` pentru detalii complete.

## Statistici Proiect

- **6** tabele
- **29** constraint-uri (ALTER TABLE)
- **3** trigger-uri
- **2** secvențe
- **7** Foreign Keys
- **3** Unique Constraints
- **20+** Check Constraints

## Autor

**Panainte Silviu-Octavian**
- GitHub: [@PanainteOctavian](https://github.com/PanainteOctavian)

## Licență

Acest proiect este dezvoltat în scop educațional pentru cursul de Baze de Date.

---

**Notă**: Acest proiect a fost generat folosind Oracle SQL Developer Data Modeler 24.3.1.351.0831 pentru Oracle Database 11g.
