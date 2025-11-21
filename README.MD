# Hospitality Booking Platform - Database Project

Oracle database for a hospitality booking platform (hotels, guesthouses, apartments, motels, villas).

## Table of Contents
- [Description](#description)
- [Database Structure](#database-structure)
- [ER Diagram](#er-diagram)
- [Installation](#installation)
- [Constraints and Rules](#constraints-and-rules)
- [Usage Examples](#usage-examples)
- [Technologies Used](#technologies-used)

## Description

This project implements a complete database for managing a hospitality booking platform. The database supports:

- Management of people (owners and clients)
- Management of accommodations (hotels, guesthouses, apartments, motels, villas)
- Booking system with automatic date validation
- Review system for accommodations

## Database Structure

### Main Tables

#### 1. **PERSOANE** (PEOPLE)
Parent table containing general information about all people in the system.
- `CNP` (PK) - Personal Numeric Code (13 digits)
- `adresa_email` (UK) - Unique email address
- `numar_telefon` (UK) - Unique phone number (10 digits)

#### 2. **PROPRIETARI** (OWNERS)
Property owners (inherits from PERSOANE).
- `CNP` (PK, FK) - Reference to PERSOANE
- `nume_proprietar` (NN) - Full name (min. 8 characters)

#### 3. **CLIENTI** (CLIENTS)
Clients who make bookings (inherits from PERSOANE).
- `CNP` (PK, FK) - Reference to PERSOANE
- `nume_client` (NN) - Full name (min. 8 characters)

#### 4. **CAZARI** (ACCOMMODATIONS)
Properties available for booking.
- `id_cazare` (PK) - Auto-generated ID (≥ 50)
- `CNP` (FK) - Property owner
- `nume_cazare` (NN) - Accommodation name (min. 5 characters, no digits)
- `pret24h` (NN) - Price per 24h (≥ 50 RON)
- `adresa` (NN) - Full address (min. 10 characters)
- `oras` (NN) - City (min. 4 characters, no digits)
- `tara` (NN) - Country (min. 2 characters, no digits)
- `tip_cazare` - Accommodation type: `apartament`, `hotel`, `motel`, `pensiune`, `vila`

#### 5. **REZERVARI** (BOOKINGS)
Bookings made by clients.
- `id_rezervare` (PK) - Auto-generated ID (≥ 2000)
- `CNP` (FK) - Client making the booking
- `id_cazare` (FK) - Booked accommodation
- `durata_zile` (NN) - Number of days (1-30)
- `data_inceput` (NN) - Start date (must be > SYSDATE)

#### 6. **RECENZII** (REVIEWS)
Reviews for completed bookings.
- `id_rezervare` (PK, FK) - Reference to REZERVARI
- `continut` - Review text (max. 2000 characters, optional)
- `stele` (NN) - Rating (1-5)

## ER Diagram

```
PERSOANE (parent)
    ├── PROPRIETARI
    │       └── CAZARI
    │               └── REZERVARI
    │                       └── RECENZII
    └── CLIENTI
            └── REZERVARI
```

## Installation

### Prerequisites
- Oracle Database 11g or higher
- Oracle SQL Developer (recommended)
- Privileges: CREATE TABLE, SEQUENCE, TRIGGER

### Installation Steps

1. **Clone the repository:**
```bash
git clone https://github.com/PanainteOctavian/BD-P-project.git
cd BD-P-project
```

2. **Create the database structure:**
```sql
@database/schema/scriptddl.sql
```

3. **Insert test data:**
```sql
@database/data/insert_data.sql
```

4. **[Optional] Test constraints:**
```sql
@database/tests/test_constraints.sql
```

## Constraints and Rules

### Primary Keys (PK)
- CNP for PERSOANE, PROPRIETARI, CLIENTI
- id_cazare for CAZARI
- id_rezervare for REZERVARI, RECENZII

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
- **CNP**: Exactly 13 digits
- **Email**: Valid format (regex)
- **Phone**: Exactly 10 digits
- **Name**: Min. 8 characters, letters and spaces/hyphens only
- **Price**: ≥ 50 RON
- **City/Country**: Letters only, min. 4/2 characters
- **Accommodation type**: One of: apartament, hotel, motel, pensiune, vila
- **Duration**: Between 1 and 30 days
- **Stars**: Between 1 and 5

### Triggers
1. **trg_rezervari_BRIU**: Validates that data_inceput > SYSDATE
2. **cazari_id_cazare_trg**: Auto-increment for id_cazare (sequence)
3. **rezervari_id_rezervare_trg**: Auto-increment for id_rezervare (sequence)

### Sequences
- `cazari_id_cazare_seq`: START WITH 50
- `rezervari_id_rezervare_seq`: START WITH 2000

## Usage Examples

### Adding a new accommodation
```sql
INSERT INTO PERSOANE VALUES(1234567890123, 'john@example.com', '0712345678');
INSERT INTO PROPRIETARI VALUES(1234567890123, 'John Doe Senior');
INSERT INTO CAZARI(CNP, NUME_CAZARE, PRET24H, ADRESA, ORAS, TARA, TIP_CAZARE) 
VALUES(1234567890123, 'Hotel Central', 150, 'Str. Principala 100', 
       'Cluj-Napoca', 'Romania', 'hotel');
```

### Making a booking
```sql
INSERT INTO PERSOANE VALUES(2345678901234, 'jane@example.com', '0723456789');
INSERT INTO CLIENTI VALUES(2345678901234, 'Jane Smith Junior');
INSERT INTO REZERVARI(CNP, ID_CAZARE, DURATA_ZILE, DATA_INCEPUT) 
VALUES(2345678901234, 50, 5, '15-DEC-2026');
```

### Useful Queries

**All bookings for a client:**
```sql
SELECT c.NUME_CLIENT, caz.NUME_CAZARE, r.DATA_INCEPUT, r.DURATA_ZILE
FROM CLIENTI c
JOIN REZERVARI r ON c.CNP = r.CNP
JOIN CAZARI caz ON r.ID_CAZARE = caz.ID_CAZARE
WHERE c.CNP = '5040917134679';
```

**Client reviews:**
```sql
SELECT c.NUME_CLIENT, caz.NUME_CAZARE, rec.STELE, rec.CONTINUT
FROM CLIENTI c
JOIN REZERVARI r ON c.CNP = r.CNP
JOIN CAZARI caz ON r.ID_CAZARE = caz.ID_CAZARE
JOIN RECENZII rec ON r.ID_REZERVARE = rec.ID_REZERVARE
WHERE c.CNP = '5040917134679';
```

**Accommodations by type and price:**
```sql
SELECT NUME_CAZARE, ORAS, PRET24H, TIP_CAZARE
FROM CAZARI
WHERE TIP_CAZARE = 'hotel' AND PRET24H < 200
ORDER BY PRET24H;
```

## Technologies Used

- **Oracle Database 11g** - Database management system
- **Oracle SQL Developer Data Modeler 24.3** - Design and modeling
- **PL/SQL** - Triggers and stored procedures
- **Oracle Sequences** - Auto-increment for IDs

## Testing

The project includes comprehensive tests for all constraints:

- Primary Keys testing (uniqueness)
- Foreign Keys testing (referential integrity)
- Check Constraints testing (format and value validations)
- Unique Constraints testing
- Not Null Constraints testing
- Triggers testing (data validation)

See `database/tests/test_constraints.sql` for complete details.

## Project Statistics

- **6** tables
- **29** constraints (ALTER TABLE)
- **3** triggers
- **2** sequences
- **7** Foreign Keys
- **3** Unique Constraints
- **20+** Check Constraints

## Author

**Panainte Silviu-Octavian**
- GitHub: [@PanainteOctavian](https://github.com/PanainteOctavian)

## License

This project is developed for educational purposes as part of the Database course.

---

**Note**: This project was generated using Oracle SQL Developer Data Modeler 24.3.1.351.0831 for Oracle Database 11g.
