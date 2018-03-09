# Traccia esercitazione N° 1 del 07/08/2018
Si consideri la tabella `IMPIEGATO(Cod, Nome, Cognome, Data_Assunto, Stipendio, Capo)` in cui:
- `Cod` è un codice univoco;
- `Capo` si riferisce al codice del diretto superiore dell’impiegato (se esistente).

1. Si crei una tale tabella;
1. Si popoli la tabella con i dati indicati nella tabella sottostante:
1. Si determinino gli indirizzi email degli impiegati che hanno uno stipendio inferiore o uguale a 3000, supponendo che abbiano la forma `adeluca@lazienda.it` (iniziale nome + cognome);
1. Si trovi nome e cognome di tutti i sottoposti di Bianchi assunti da più di 50 mesi.

<br/>
<br/>

| Cod |	   Nome    | Cognome | Data_Assunto | Stipendio |  Capo  |
| :-: | :--------- | :------ | :----------- | :-------- | :----: |
|  1  | Alessandro | Rossi   | 01/03/2014   | 3000      | 2      |
|  2  | Alberto    | Bianchi | 01/02/2013   | 4000      | 3      |
|  3  | Andrea     | Verdi   | 03/06/2011   | 5000      | `NULL` |
|  4  | Tiziana    | Viola   | 03/03/2013   | 1500      | 1      |
|  5  | Umberto    | Neri    | 12/09/2014   | 2500      | 2      |
|  6  | Francesca  | Russo   | 22/11/2013   | 2000      | 2      |
|  7  | Luigi      | Marrone | 05/02/2012   | 2800      | 3      |
