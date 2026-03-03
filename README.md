Baze de date - proiect
Student: Panainte Silviu-Octavian, Grupa 1311A
Cadru didactic coordonator: ș.l. dr. ing. Mironeanu Cătălin
Tema proiectului: Site pentru rezervarea de cazări (Booking.com)
Descrierea proiectului:
Aplicația va gestiona baza de date a rezervărilor unui site precum Booking.com.
Aceasta va reține locația turistică, durata sejurului, prețul cazării și momentul de timp la care
s-a făcut rezervarea de către turist.
Platforma va gestiona rezervările clienților și recenziile acestora.
De asemenea, aplicația va reține datele personale și de contact ale utilizatorilor.
Pentru simplitate, nu se vor lua în considerare oferte all-inclusive, reduceri pentru sejur lung,
sau opțiuni de masă.
Un proprietar poate da înspre închiriere mai multe cazări.
Fiecare proprietar își poate seta propriul preț pentru cazări. Pentru simplitate, prețul pentru o
cazare nu variază în funcție de sezon și disponibilitate. Dar nu este obligatoriu ca un proprietar să-și
închirieze toate cazările la același preț.
Doi clienți pot fi cazați la aceeași cazare în aceeași zi, pentru simplitate.
Pentru simplitate, un turist nu poate avea mai mult de o rezervare activă și nu poate face o
rezervare pe mai multe cazări în același timp.
Pentru simplitate, cazările nu au decât o singură variantă de cameră cu un singur preț.
Structura si inter-relaționarea tabelelor:
Figura 1: Diagrama modelului logicFigura 2: Diagrama modelului relațional
Normalizarea tabelelor:
1. tabela PERSOANE este în a cincea formă normală:
- Prima formă normală: Toate atributele sunt atomice.
- A doua formă normală: Tabela are o cheie primară simplă(CNP).
- A treia formă normală: Nu există dependențe tranzitive.
- BCNF: Deoarece adresa_email are constrângerea UNIQUE și numar_telefon are
constrângerea UNIQUE, toate dependențele funcționale au ca determinant o cheie candidat
(CNP, adresa_email sau numar_telefon).
- A patra formă normală: Deoarece adresa_email are constrângerea UNIQUE și
numar_telefon are constrângerea UNIQUE, nu există posibilitatea existenței unor seturi de
date independente între adresa_email și numar_telefon.
- A cincea formă normală: Deoarece adresa_email are constrângerea UNIQUE și
numar_telefon are constrângerea UNIQUE, CNP și adresa_email sunt în relație de 1 la 1,
respectiv CNP și numar_telefon sunt în relație de 1 la 1. Așadar, nu s-ar câștiga nimic dacă
s-ar descompune tabela în două subtabele, (CNP, adresa_email) și (CNP, numar_telefon).
2. tabela PROPRIETARI este în a cincea formă normală:
- Prima formă normală→a cincea formă normală : Tabela PROPRIETARI este o
tabelă de specializare. Conține doar CNP(care este și cheie străină și primară) și
nume_proprietar. Structura este minimală și atomică.3. tabela CLIENTI este în a cincea formă normală:
- Prima formă normală→ a cincea formă normală : Tabela CLIENTI este o tabelă de
specializare. Conține doar CNP(care este și cheie străină și primară) și nume_client.
Structura este minimală și atomică.
4. tabela CAZARI este în a cincea formă normală:
- Prima formă normală: Toate atributele sunt atomice.
- A doua formă normală: Tabela are o cheie primară simplă(id_cazare).
- A treia formă normală: Nu există dependențe tranzitive, cu condiția ca atributul oras
să nu determine atributul tara, ceea ce este valabil deoarece pot exista aceleași denumiri de
orașe în țări diferite (exemplu: Alexandria din Egipt și Alexandria din România), respectiv
atributul adresa să nu conțină numele orașului și al țării.
- BCNF: id_cazare este super cheie pentru toate dependențele, cu condiția ca
atributul oras să nu determine atributul tara, ceea ce este valabil deoarece pot exista
aceleași denumiri de orașe în țări diferite (exemplu: Alexandria din Egipt și Alexandria din
România), respectiv atributul adresa să nu conțină numele orașului și al țării.
- A patra formă normală: Pentru un id_cazare dat, există un singur tip_cazare, un
singur pret24h și un singur proprietar. Nu există situații de tipul: "Cazarea 50 are 3 prețuri
diferite per 24 de ore și 5 tipuri de cazare diferite" stocate în același tabel.
- A cincea formă normală: O cazare reprezintă o entitate de bază (un obiect fizic cu
proprietăți). Toate informațiile (unde se află, cât costă, cine o deține) sunt legate intrinseci
de identitatea acelei unități de cazare. Orice descompunere (de exemplu, separarea prețului
într-un tabel și a adresei în altul) ar fi nefolositoare.
5. tabela REZERVARI
- Prima formă normală: Toate atributele sunt atomice.
- A doua formă normală: Tabela are o cheie primară simplă(id_rezervare).
- A treia formă normală: Nu există dependențe tranzitive.
- BCNF: id_rezervare este super cheie pentru toate dependențele.
- A patra formă normală: O rezervare aparține unui singur client și se referă la o
singură cazare. Nu pot apărea situații în care un client face o singură rezervare pentru mai
multe cazări diferite.
- A cincea formă normală: Tabela REZERVARI nu poate fi descompusă în trei
subtabele: (CNP, id_cazare), (CNP, data_inceput), (id_cazare, data_inceput) fără apariția
unor date false la reconstrucția ei prin JOIN.
6. tabela RECENZII
- Prima formă normală: Toate atributele sunt atomice.
- A doua formă normală: Tabela are o cheie primară simplă(id_rezervare).
- A treia formă normală: Nu există dependențe tranzitive.
- BCNF: id_ rezervare este super cheie pentru toate dependențele.
- A patra formă normală: O recenzie este un bloc unic de informație, nu există mai
multe recenzii pentru părțile diferite ale unei rezervări(curățenia, locația, personalul).
- A cincea formă normală: Tabela RECENZII este deja în forma atomică (există
doar două atribute non-cheie).
Descrierea coloanelor din tabele:
1. tabela PERSOANE:
- CNP (Cod Numeric Personal) VARCHAR2(13)
- adresa_email VARCHAR2(60)
- numar_telefon VARCHAR2(10)2. tabela PROPRIETARI:
- CNP (Codul Numeric Personal al proprietarului) VARCHAR2(13)
- nume_proprietar VARCHAR2(30)
3. tabela CLIENTI:
- CNP (Codul Numeric Personal al clientului) VARCHAR2(13)
- nume_client VARCHAR2(30)
4. tabela CAZARI:
- id_cazare NUMBER(8)
- CNP (Codul Numeric Personal al proprietarului) VARCHAR2(13)
- nume_cazare VARCHAR2(30)
- pret24h NUMBER(6, 2)
- adresa VARCHAR2(200)
- oras VARCHAR2(20)
- tara VARCHAR2(30)
- tip_cazare (cazarea poate fi: apartament, hotel, motel, pensiune, vila)
VARCHAR2(10)
5. tabela REZERVARI:
- id_rezervare NUMBER(10)
- CNP (Codul Numeric Personal al clientului) VARCHAR2(13)
- id_cazare NUMBER(8)
- durata_zile NUMBER(2)
- data_inceput DATE
6. tabela RECENZII:
- id_rezervare NUMBER(10)
- continut VARCHAR2(2000)
- stele NUMBER(1)
Descrierea constrangerilor:
1. tabela PERSOANE:
- CNP:
* PK: CNP trebuie să fie unic
* CK: CNP trebuie să aibă 13 caractere (Codul Numeric Personal în
România are 13 caractere)
* CK: CNP trebuie să aibă doar cifre
- adresa_email:
* UK: adresa_email trebuie să fie unic
* CK: adresa_email nu respectă regex-ul de email (exemplu corect:
“adresa@email”)
- numar_telefon:
* UK: numar_telefon trebuie să fie unic
* CK: numar_telefon trebuie să aibă 10 caractere (exemplu corect:
“0777777777”)
2. tabela PROPRIETARI:
- CNP:* PK: CNP trebuie să fie unic
* FK: CNP trebuie să existe deja în tabela PERSOANE
- nume_proprietar:
* NN: nume_proprietar nu poate să fie NULL
* CK: nume_proprietar trebuie sa aibă mai mult de 8 caractere, cu tot cu spațiu
despărțitor (cel mai scurt nume: “Popa Ion”)
* CK: nume_proprietar nu poate conține cifre
3. tabela CLIENTI:
- CNP:
* PK: CNP trebuie să fie unic
* FK: CNP trebuie să existe deja în tabela PERSOANE
- nume_client:
* NN: nume_client nu poate să fie NULL
* CK: nume_client trebuie sa aibă mai mult de 8 caractere, cu tot cu
spațiu despărțitor (cel mai scurt nume: “Popa Ion”)
* CK: nume_client nu poate conține cifre
4. tabela CAZARI:
- id_cazare:
* PK: id_cazare trebuie să fie unic
* CK: id_cazare nu poate fi mai mic de 50 (50 pentru o vizualizare mai ușoară a
datelor)
- CNP:
* FK: CNP trebuie să existe deja în tabela PROPRIETARI
- nume_cazare:
* NN: nume_cazare nu poate fi NULL
* CK: nume_cazare nu poate conține cifre
- pret24h:
* NN: pret24h nu poate fi NULL
* CK: pret24h nu poate fi mai mic de 50.00 (50.00 pentru o vizualizare mai ușoară
a datelor)
- adresa:
* NN: adresa nu poate fi NULL
* CK: adresa trebuie să aibă mai mult de 10 caractere (pentru a fi evitate situații de
tipul “Strada 1”)
- oras:
* NN: oras nu poate fi NULL
* CK: oras nu poate conține cifre
* CK: oras trebuie să aibă cel putin 4 caractere (cel mai scurt nume de oraș:
Roma)
- tara:
* NN: tara nu poate fi NULL
* CK: tara nu poate conține cifre* CK: tara trebuie să aibă cel puțin 2 caractere (cel mai scurt nume de țară: UK
(United Kingdom))
- tip_cazare:
* CK: tip_cazare trebuie să facă parte din lista: apartament, hotel, motel, pensiune,
vila.
5. tabela REZERVARI:
- id_rezervare:
* PK: id_rezervare trebuie să fie unic
* CK: id_rezervare nu poate fi mai mic de 2000 (2000 pentru o
vizualizare mai ușoară a datelor)
- CNP:
* FK: CNP trebuie să existe deja în tabela CLIENTI
- id_cazare:
* FK: id_cazare trebuie să existe deja în tabela CAZARI
- durata_zile:
* CK: durata_zile trebuie să fie în intervalul [1, 30] (30 de zile = 1 lună)
- data_inceput:
* CK: data_inceput trebuie să fie mai mare de SYSDATE (o rezervare nu
poate începe mai devreme de momentul prezent)
6. tabela RECENZII:
- id_rezervare:
* PK: id_rezervare trebuie să fie unic
* FK: id_rezervare trebuie să existe în tabela REZERVARI
- stele:
* NN: stele nu poate fi NULL
* CK: stele trebuie să fie în intervalul [1, 5]
