# Laboratorio di Basi di Dati

Questa repo è a cura di **Gennaro Landolfi** (@rinodrummer) e **Francesco Noviello** (@novixfrank).

Il suo contenuto è relativo al corso Lab. di Basi di Dati del professore Alessandro De Luca.

All'interno di questa repo quindi è possibile trovare cartelle contenenti le esercitazioni di laboratorio svolte da noi.
I nostri esercizi potrebbero non essere corretti al 100% (secondo la richiesta del docente), ma possono sempre essere utili per un confronto. Inoltre, se la traccia presentata è poco chiara, gli esercizi verranno svolti secondo le conformità della comunità Oracle.

In questo file invece è possibile trovare la guida per l'installazione dei software **su Windows** e alcune F.A.Q. riguardo l'installazione.

## Indice
1. [Installare i software necessari](#installare-i-software-necessari);
    1. [Download dei packages](#download-dei-packages);
    1. [Installare Oracle 11g XE Release 2](#installare-oracle-11g-xe-release-2);
        - [Configurare Oracle 11g XE Release 2](#configurare-oracle-11g-xe-release-2);
1. [F.A.Q.](#faq).

## Installare i software necessari
I software necessari per il corso sono i seguenti:

1. [Oracle 11g XE Release 2](http://www.oracle.com/technetwork/database/database-technologies/express-edition/overview/index.html);
1. [Oracle SQL Developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/overview/index.html).

**ATTENZIONE!** SQL Developer viene distribuito principalmente in due package: uno contenente solo SQL Developer ed un altro che include la Java JDK in quanto questo software dipende da questa, che inoltre tornerà utile per la seconda parte del corso ed in generale per lo sviluppo di codice in Java. Per installare quindi la Java JDK consiglio di seguire la guida ufficiale, reperibile [qui](https://docs.oracle.com/javase/9/install/overview-jdk-9-and-jre-9-installation.htm#JSJIG-GUID-8677A77F-231A-40F7-98B9-1FD0B48C346A).

### Download dei packages
Per scaricare file dal sito di Oracle bisogna accettare prima i termini di servizio ed inoltre registrarsi o accedere.

![Accettare i termini](https://i.imgur.com/VFUFbcM.jpg)

Una volta scaricati i file in base all'architettura del proprio PC sarà possibile procedere con l'installazione.

### Installare Oracle 11g XE Release 2
Oracle 11g XE è il server messo a disposizione da Oracle per utilizzare la sua distribuzione di SQL.
Una volta scaricato dal sito web, è necessario estrarre il contenuto del file ed accedere alla cartella `DISK1`, per poi cliccare due volte sul file `setup.exe` per avviare l'installazione.

**N.B.:** Non mi dilungherò su fasi essenzialmente banali come l'accettazione delle condizioni e quando cliccare il tasto "Avanti", ma mi concentrerò solo sui punti salienti.

La prima fase fondamentale dell'installazione è scegliere il percorso della cartella che conterrà i file necessari al funzionamento del server:<br/>
![Scegliere il percorso del server](https://i.imgur.com/4yYwj7F.jpg)

La seconda è invece la password dell'utente si sistema (chiamato appunto `SYSTEM` [a.k.a.](https://www.urbandictionary.com/define.php?term=aka) `SYS`). **ATTENZIONE!** E' importante non mettere una password casuale! Servirà più avanti!<br/>
![Scegliere la password dell'utente di sistema](https://i.imgur.com/hdQhSHY.jpg)

Continuando, non si deve far altro che proseguire ed aspettare finchè l'installazione non verrà completata.

#### Configurare Oracle 11g XE Release 2
Ad installazione completata apparirà la seguente icona sul proprio Desktop:<br/>
![Icona del Get Started With Oracle Database](https://i.imgur.com/bbogUCT.jpg)

Ogni tanto potrebbe capitare un messaggio di errore e non aprire il link, se accadesse, basta seguire i seguenti passaggi:
Cliccare col **Tasto destro** sul file sopra citato e selezionare la voce **Apri percorso file**; nel caso non sia disponibile si può cliccare sulla voce **Proprietà** e premere il bottone con scritto **Apri percorso file**:<br/>
![Proprietà del link Get Started With Oracle Database](https://i.imgur.com/bbogUCT.jpg)

Verrà selezionato un file chiama `Get_Started`, bisogna accedere anche alle sue proprietà e selezionare il link contenuto nel campo URL e modificarlo da `http://127.0.0.1:%HTTPPORT%/apex/f?p=4950` in `http://127.0.0.1:8080/apex/f?p=4950`:<br/>
![Proprietà Get Started With Oracle Database](https://i.imgur.com/1lv0Jrh.jpg)

Potrebbe capitare che potrebbe essere visto online un link di questo tipo: `http://localhost:8080/apex/f?p=4950`; `localhost` e `127.0.0.1` significano la stessa cosa e rappresentato il PC locale. **Sono uguali per qualsiasi sistema operativo e funzionano anche offline!**

Ora è possibile cliccare sul collegamento ogni qualvolta si voglia.

_Guida da completare._

## F.A.Q.
Q: **Posso installare questi software anche su Linux o Mac?**<br/>
A: SQL Developer, non necessitando di installazione, non dovrebbe creare problemi, ma, per esperienza personale, installare Oracle 11g XE su Ubuntu è abbastanza difficile. Dal sito è possibile scaricare solo l'installer per RedHat. Inoltre sembrerebbe che non viene sviluppato software compatibile con Mac.

Q: **Per utilizzare questi software ho bisogno della connessione ad Internet?**<br/>
A: Assolutamente no.

Q: **Posso installare altre distribuzioni di SQL (MySQL, Microsoft SQL Server)?**<br/>
A: Non vi sono divieti sul cosa si voglia installare sul proprio PC, ma sconsiglio l'installazione di questi software semplicemente perchè non hanno finalità utili nel contesto del corso in quanto il docente utilizza soltanto Oracle SQL.

Q: **Se non volessi/potessi installare software, vi è un'alternativa (preferibilmente gratuita)?**<br/>
A: Sì. La Oracle mette a disposizione [LiveSQL](https://livesql.oracle.com) che permette anche si salvare i propri script. Funziona tramite browser web ed accessibile anche da smartphone. Inoltre l'università mette a disposizione lo stesso server che si utilizza in laboratorio che è utilizzabile anch'esso solo dal browser (non tramite SQL Developer per questioni di sicurezza) tramite la piattaforma APEX (Application Express), ma che sconsiglio vivamente di utilizzare in quanto molto lento.

Q: **Durante la registrazione al sito di Oracle mi vengono richiesti dati come l'occupazione e l'azienda, cosa inserisco?**<br/>
A: Credo che sia lecito inserire come occupazione "Studente" e come azienda il nome dell'università.

Q: **E' proprio obbligatorio registrarsi al sito Oracle?**<br/>
A: Per effettuare i download ed utilizzare LiveSQL, assolutamente sì, ma l'iscrizione può tornare molto utile per poter scaricare anche altri contenuti (come la JDK) che al giorno d'oggi, per un programmatore sono una vera necessità.
