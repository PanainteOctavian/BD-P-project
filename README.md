# Baze de date - Proiect

| Camp | Detalii |
|------|---------|
| **Student** | Panainte Silviu-Octavian, Grupa 1311A |
| **Coordonator** | s.l. dr. ing. Mironeanu Catalin |
| **Tema** | Site pentru rezervarea de cazari (Booking.com) |

---

## Descrierea proiectului

Aplicatia va gestiona baza de date a rezervarilor unui site precum Booking.com. Aceasta va retine locatia turistica, durata sejurului, pretul cazarii si momentul de timp la care s-a facut rezervarea de catre turist.

Platforma va gestiona rezervarile clientilor si recenziile acestora. De asemenea, aplicatia va retine datele personale si de contact ale utilizatorilor.

**Simplificari adoptate:**

- Nu se iau in considerare oferte all-inclusive, reduceri pentru sejur lung sau optiuni de masa.
- Un proprietar poate da inspre inchiriere mai multe cazari si isi poate seta propriul pret pentru fiecare. Pretul nu variaza in functie de sezon sau disponibilitate.
- Doi clienti pot fi cazati la aceeasi cazare in aceeasi zi.
- Un turist nu poate avea mai mult de o rezervare activa si nu poate face o rezervare pe mai multe cazari in acelasi timp.
- Cazarile au o singura varianta de camera cu un singur pret.

---

## Normalizarea tabelelor

### 1. Tabela PERSOANE - 5NF

- **1NF:** Toate atributele sunt atomice.
- **2NF:** Tabela are o cheie primara simpla (CNP).
- **3NF:** Nu exista dependente tranzitive.
- **BCNF:** Toate dependentele functionale au ca determinant o cheie candidat (CNP, adresa_email sau numar_telefon), deoarece adresa_email si numar_telefon au constrangerea UNIQUE.
- **4NF:** Nu exista seturi de date independente intre adresa_email si numar_telefon (ambele sunt in relatie 1:1 cu CNP).
- **5NF:** Descompunerea in subtabele nu ar aduce niciun beneficiu.

### 2. Tabela PROPRIETARI - 5NF

Tabela de specializare cu structura minimala si atomica: contine doar CNP (cheie primara si straina) si nume_proprietar.

### 3. Tabela CLIENTI - 5NF

Tabela de specializare cu structura minimala si atomica: contine doar CNP (cheie primara si straina) si nume_client.

### 4. Tabela CAZARI - 5NF

- **1NF:** Toate atributele sunt atomice.
- **2NF:** Tabela are o cheie primara simpla (id_cazare).
- **3NF:** Nu exista dependente tranzitive (oras nu determina tara, deoarece pot exista acelasi nume de oras in tari diferite; ex: Alexandria in Egipt si in Romania).
- **BCNF:** id_cazare este super cheie pentru toate dependentele.
- **4NF:** Pentru un id_cazare dat, exista un singur tip_cazare, un singur pret24h si un singur proprietar.
- **5NF:** Orice descompunere (ex: separarea pretului de adresa) ar fi nefolositoare.

### 5. Tabela REZERVARI - 5NF

- **1NF - 3NF:** Atribute atomice, cheie primara simpla (id_rezervare), fara dependente tranzitive.
- **BCNF:** id_rezervare este super cheie pentru toate dependentele.
- **4NF:** O rezervare apartine unui singur client si se refera la o singura cazare.
- **5NF:** Tabela nu poate fi descompusa in subtabelele (CNP, id_cazare), (CNP, data_inceput), (id_cazare, data_inceput) fara aparitia unor date false la reconstructie prin JOIN.

### 6. Tabela RECENZII - 5NF

- **1NF - 3NF:** Atribute atomice, cheie primara simpla (id_rezervare), fara dependente tranzitive.
- **BCNF:** id_rezervare este super cheie pentru toate dependentele.
- **4NF:** O recenzie este un bloc unic de informatie.
- **5NF:** Tabela este deja in forma atomica (doar doua atribute non-cheie).

---

## Descrierea coloanelor din tabele

### 1. Tabela PERSOANE

| Coloana | Tip |
|---------|-----|
| CNP (Cod Numeric Personal) | VARCHAR2(13) |
| adresa_email | VARCHAR2(60) |
| numar_telefon | VARCHAR2(10) |

### 2. Tabela PROPRIETARI

| Coloana | Tip |
|---------|-----|
| CNP (Codul Numeric Personal al proprietarului) | VARCHAR2(13) |
| nume_proprietar | VARCHAR2(30) |

### 3. Tabela CLIENTI

| Coloana | Tip |
|---------|-----|
| CNP (Codul Numeric Personal al clientului) | VARCHAR2(13) |
| nume_client | VARCHAR2(30) |

### 4. Tabela CAZARI

| Coloana | Tip |
|---------|-----|
| id_cazare | NUMBER(8) |
| CNP (Codul Numeric Personal al proprietarului) | VARCHAR2(13) |
| nume_cazare | VARCHAR2(30) |
| pret24h | NUMBER(6, 2) |
| adresa | VARCHAR2(200) |
| oras | VARCHAR2(20) |
| tara | VARCHAR2(30) |
| tip_cazare (apartament, hotel, motel, pensiune, vila) | VARCHAR2(10) |

### 5. Tabela REZERVARI

| Coloana | Tip |
|---------|-----|
| id_rezervare | NUMBER(10) |
| CNP (Codul Numeric Personal al clientului) | VARCHAR2(13) |
| id_cazare | NUMBER(8) |
| durata_zile | NUMBER(2) |
| data_inceput | DATE |

### 6. Tabela RECENZII

| Coloana | Tip |
|---------|-----|
| id_rezervare | NUMBER(10) |
| continut | VARCHAR2(2000) |
| stele | NUMBER(1) |

---

## Descrierea constrangerilor

### 1. Tabela PERSOANE

**CNP**
- `PK` - CNP trebuie sa fie unic
- `CK` - CNP trebuie sa aiba 13 caractere
- `CK` - CNP trebuie sa contina doar cifre

**adresa_email**
- `UK` - adresa_email trebuie sa fie unica
- `CK` - adresa_email trebuie sa respecte formatul de email (ex: `adresa@email`)

**numar_telefon**
- `UK` - numar_telefon trebuie sa fie unic
- `CK` - numar_telefon trebuie sa aiba 10 caractere (ex: `0777777777`)

### 2. Tabela PROPRIETARI

**CNP**
- `PK` - CNP trebuie sa fie unic
- `FK` - CNP trebuie sa existe deja in tabela PERSOANE

**nume_proprietar**
- `NN` - nu poate fi NULL
- `CK` - trebuie sa aiba mai mult de 8 caractere (cel mai scurt: `Popa Ion`)
- `CK` - nu poate contine cifre

### 3. Tabela CLIENTI

**CNP**
- `PK` - CNP trebuie sa fie unic
- `FK` - CNP trebuie sa existe deja in tabela PERSOANE

**nume_client**
- `NN` - nu poate fi NULL
- `CK` - trebuie sa aiba mai mult de 8 caractere (cel mai scurt: `Popa Ion`)
- `CK` - nu poate contine cifre

### 4. Tabela CAZARI

**id_cazare**
- `PK` - id_cazare trebuie sa fie unic
- `CK` - id_cazare nu poate fi mai mic de 50

**CNP**
- `FK` - CNP trebuie sa existe deja in tabela PROPRIETARI

**nume_cazare**
- `NN` - nu poate fi NULL
- `CK` - nu poate contine cifre

**pret24h**
- `NN` - nu poate fi NULL
- `CK` - nu poate fi mai mic de 50.00

**adresa**
- `NN` - nu poate fi NULL
- `CK` - trebuie sa aiba mai mult de 10 caractere

**oras**
- `NN` - nu poate fi NULL
- `CK` - nu poate contine cifre
- `CK` - trebuie sa aiba cel putin 4 caractere (cel mai scurt: `Roma`)

**tara**
- `NN` - nu poate fi NULL
- `CK` - nu poate contine cifre
- `CK` - trebuie sa aiba cel putin 2 caractere (cel mai scurt: `UK`)

**tip_cazare**
- `CK` - trebuie sa faca parte din: `apartament`, `hotel`, `motel`, `pensiune`, `vila`

### 5. Tabela REZERVARI

**id_rezervare**
- `PK` - id_rezervare trebuie sa fie unic
- `CK` - id_rezervare nu poate fi mai mic de 2000

**CNP**
- `FK` - CNP trebuie sa existe deja in tabela CLIENTI

**id_cazare**
- `FK` - id_cazare trebuie sa existe deja in tabela CAZARI

**durata_zile**
- `CK` - trebuie sa fie in intervalul `[1, 30]`

**data_inceput**
- `CK` - trebuie sa fie mai mare de SYSDATE (o rezervare nu poate incepe mai devreme de momentul prezent)

### 6. Tabela RECENZII

**id_rezervare**
- `PK` - id_rezervare trebuie sa fie unic
- `FK` - id_rezervare trebuie sa existe in tabela REZERVARI

**stele**
- `NN` - nu poate fi NULL
- `CK` - trebuie sa fie in intervalul `[1, 5]`
