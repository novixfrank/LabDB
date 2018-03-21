# Laboratorio di Basi di Dati

Questa repo è a cura di **Gennaro Landolfi** (@rinodrummer) e **Francesco Noviello** (@novixfrank).

Il suo contenuto è relativo al corso Lab. di Basi di Dati del professore Alessandro De Luca.

All'interno di questa repo quindi è possibile trovare cartelle contenenti le esercitazioni di laboratorio svolte da noi.
I nostri esercizi potrebbero non essere corretti al 100% (secondo la richiesta del docente), ma possono sempre essere utili per un confronto. Inoltre, se la traccia presentata è poco chiara, gli esercizi verranno svolti secondo la nostra interpretazione e le conformità della comunità Oracle.

In questo file invece è possibile trovare la guida per l'installazione dei software **su Windows** e alcune F.A.Q. riguardo l'installazione.

## Indice
1. [Installare i software necessari](#installare-i-software-necessari);
    1. [Download dei packages](#download-dei-packages);
    1. [Installare Oracle 11g XE Release 2](#installare-oracle-11g-xe-release-2);
        - [Configurare Oracle 11g XE Release 2](#configurare-oracle-11g-xe-release-2);
        - [Utilizzare Application Express](#utilizzare-application-express);
    1. [Installare Oracle SQL Developer](#installare-oracle-sql-developer);
        - [Configurare Oracle SQL Developer](#configurare-oracle-sql-developer);
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
![Proprietà del link Get Started With Oracle Database](https://i.imgur.com/KFkvFwT.jpg)

Verrà selezionato un file chiama `Get_Started`, bisogna accedere anche alle sue proprietà e selezionare il link contenuto nel campo URL e modificarlo da `http://127.0.0.1:%HTTPPORT%/apex/f?p=4950` in `http://127.0.0.1:8080/apex/f?p=4950`:<br/>
![Proprietà Get Started With Oracle Database](https://i.imgur.com/1lv0Jrh.jpg)

Potrebbe capitare che potrebbe essere visto online un link di questo tipo: `http://localhost:8080/apex/f?p=4950`; `localhost` e `127.0.0.1` significano la stessa cosa e rappresentato il PC locale. **Sono uguali per qualsiasi sistema operativo e funzionano anche offline!**

Ora è possibile cliccare sul collegamento ogni qualvolta si voglia.

Da questo link è possibile accedere ad **Application Express** (abbreviato in **APEX**), ovvero un web panel utilizzabile dal browser che offre le stesse funzionalità di SQL Developer, ma in maniera embedded. E' lo stesso che si utilizza in laboratorio.

Una volta aperto il collegamento, si aprirà una nuova scheda dal browser con l'indirizzo appena inserito:<br/>
![URL di APEX](https://i.imgur.com/zzwn3Nz.jpg)

Questa è la homepage di Application Express:<br/>
![Home di APEX](https://i.imgur.com/JmFtF7c.jpg)

E' ora necessario cliccare sul tasto `Application Express` (come indicato dall'immagine precedente) e si verrà reindirizzati ad una pagin richiedente un login dove bisogna inserire come username `SYSTEM` e per la password quella scelta durante l'installazione:<br/>
![Login di APEX](https://i.imgur.com/7LMaDbh.jpg)

Ora sarà possibile accedere alla schermata di creazione e modifica degli utenti e delle workspace del server:<br/>
![Gestione Utenti di APEX](https://i.imgur.com/4yb7KtX.jpg)

Il primo utente consiglio di chiamarlo `admin` e di dare lo stesso nome alla workspace per evitare confusioni e consiglio di immettere la stessa password di `SYSTEM`, ma sottolineo che questa cosa è **ASSOLUTAMENTE sconsigliata** in ambienti professionali!

E' importante inoltre riconoscere che vi è una forte ambiguità sulla nomenclatura dei campi, quindi è fondamentale cosa rappresentano:
1. Il nome della workspace;
1. Il nome dell'utente effettivo;

Una volta aver inserito i dati del nuovo utente, basta cliccare sul tasto `Create Workspace` e si verrà riportati alla home e vi sarà un avviso che ci dirà che è ora possibile alla workspace. E' necessario cliccare sul link indicato dell'immagine:<br/>
![Avviso di creazione di successo della workspace di APEX](https://i.imgur.com/LpHJWZh.jpg)

Questo riporterà ad un'altra schermata contenente un login (diverso da quello precedente), questo è il login della workspace ed è accessibile al link [http://127.0.0.1:8080/apex](http://127.0.0.1:8080/apex) (equivalente a [http://localhost:8080/apex](http://localhost:8080/apex)) dove verranno inseriti dell'utente creao nello step precedente:<br/>
![Login alla workspace di APEX](https://i.imgur.com/kuRyjJl.jpg)

Ora la configurazione di Oracle 11g XE è terminata.

#### Utilizzare Application Express
Per poter eseguire query e svolgere esercizi su APEX è necessario accedere alla sezione **SQL Workshop**:<br/>
![SQL Workshop](https://i.imgur.com/kuRyjJl.jpg)

Ora è possibile a le tre operazioni principali:<br/>
![Scelte disponibili in SQL Workshop](https://i.imgur.com/tDdc8x0.jpg)

In ordine, esse rappresentano:
1. **Object Browser**: una sezione che permette di visualizzare tutti gli elementi presenti nella workspace;
1. **SQL Commands**: editor di **singole query**;
1. **SQL Scripts**: editor **multi-query**, il più utilizzato in quanto permette di scrivere appunto più query.

### Installare Oracle SQL Developer
Oracle SQl Developer è un programma abbastanza consigliato da utilizzare in quanto, molto probabilmente la prova pratica potrebbe essere svolta utilizzandolo.

Il download può essere effettuato da questa pagina: [Oracle SQL Developer Downloads](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html).

Come definito all'inizio della guida, è possibile principalmente scaricare due package: **Windows 32-bit/64-bit** e **Windows 64-bit with JDK 8 included**, il primo necessita dell'installazione manuale della JDK, quindi consiglio di rifarsi alla guida ufficiale o cercare online, mentre il secondo già include la JDK, ma è ovviamente più pesante e non permette di usare la propria JDK (quindi si avranno almeno due versioni distinte di questo pachetto software sul PC).

Personalmente consiglio il primo se si ha la possibilità di perdere tempo per installare la JDK perchè è obbligatoriamente necessaria per poter sviluppare in Java (cosa che faremo nella seconda parte di questo corso e vedremo in altri corsi, inoltre Java è e suppongo continuerà ad essere uno di quei linguaggi che sono uno standard nel mondo lavorativo). Avanzando col corso, potrei mettere una guida sull'argomento, ma al momento, non ho molto tempo a disposizione.

Mentre chi ha voglia di esercitarsi subito (ed ovviamente ha un S.O. a 64 bit) può scaricare il package con la JDK inclusa.

Ricordo che prima di poter scaricare, è necessario accettare la licenza, come illustrato nell'immagine.

![Download di Oracle SQL Developer](https://i.imgur.com/1wzRe8k.jpg)

#### Configurare Oracle SQL Developer
Nel caso si scelga la versione senza JDK oppure venga eliminata (o rinominata) la cartella `jdk` dalla directory di SQL Developer verrà mostrato il seguente messaggio (solo la prima volta):

![Directory JDK di SQL Developer](https://i.imgur.com/gs7wUmS.jpg)

Inoltre, sempre al primo avvio, verrà mostrato questo ulteriore messaggio:<br/>
![Versioni disponibili di SQL Developer](https://i.imgur.com/NCszsut.jpg)

Verrà mostrata la schermata iniziale di SQL Developer, dalla quale consiglio di disabilitare la pagina di benvenuto (Cliccare sulla spunta **Visualizza all'avvio**):<br/>
![Pagina iniziale di SQL Developer](https://i.imgur.com/Qiq8EK8.jpg)

Per poter utilizzare il software è necessario specificare una connessione. Per farlo bisogna cliccare col tasto destro sulla voce **Connessioni** dal menù laterale sinistro e selezionare la voce **Nuova connessione...**. Verrà mostrata la seguente finestra, dove è necessario inserire i dati dell'utente creato assieme alla workspace. Prima di cliccare su **Connetti**, è consigliato cliccare prima sul tasto **Salva**:<br/>
![Creazione della connessione di SQL Developer](https://i.imgur.com/yfK2mR8.jpg)

Ora è possibile scrivere tutte le query che si vogliono.

Anche SQL Developer ha due modalità di esecuzione dello script. Consiglio di scegliere la seconda perchè permette l'esecuzione multi-query.<br/>
![Creazione della connessione di SQL Developer](https://i.imgur.com/yfK2mR8.jpg)

## F.A.Q.
Q: **Posso installare questi software anche su Linux o Mac?**<br/>
A: SQL Developer, non necessitando di installazione, non dovrebbe creare problemi, ma, per esperienza personale, installare Oracle 11g XE (anche versoni successive) su Ubuntu è abbastanza difficile: dal sito ufficiale è possibile scaricare solo l'installer per RedHat. Inoltre sembrerebbe che non viene sviluppato software compatibile con Mac.

Q: **Per utilizzare questi software ho bisogno della connessione ad Internet?**<br/>
A: Assolutamente no.

Q: **E' possibile visualizzare il numero di riga nel pannello di scrittura delle query?**<br/>
A: Sì, vi sono due metodi: 1) Cliccare col tasto destro nell'area a sinistra dell'area di testo e cliccare sull'opzione **Attiva/disattiva numero di riga**; 2) Dal menù superiore, **Strumenti** > **Preferenze...** > **Editor di codice** > **Margine interno riga**, poi abilitare **Mostra numeri di riga**.

Q: **Perchè dopo aver eseguito operazioni sulle tabelle (eliminazione, rinominazione), continuo a vederle come se nulla fosse accaduto?**<br/>
A: SQL Developer spesso dimentica di aggiornare l'interfaccia grafica, per far sì che l'interfaccia si aggiorni, basta cliccare sull'icona dell'aggiornamento (![Aggiornamento](https://i.imgur.com/o5wjezR.jpg)), certe volte è necessario nascondere gli oggetti che si stanno visualizzando, premere il tasto di aggiornamento ed esplodere di nuovo gli oggetti.

Q: **Come mai in SQL Developer mi vengono mostrate tabelle che io non ho creato? Posso rimuoverle?**<br/>
A: Oracle 11g XE crea tabelle tecniche di APEX (che **NON DEVONO ESSERE MAI ELIMINATE** - iniziano col prefisso `APEX$_`) ed inoltre anche alcune tabelle di esempio (iniziano col prefisso `DEMO_`). Anche se possono essere eliminate, sconsiglio di farlo in quanto potrebbero tornare utili per fini personali/didattici, tuttavia però si possono **filtrare** le tabelle (e non solo) da visualizzare, basta cliccare col **tasto destro** sull'elemento da filtrare > **Applica filtro...**, dalla finestra che si aprirà cliccare sul pulsante che ha come icona una '+' verde ed applicare i seguenti filtri: `NAME NOT LIKE APEX$_%`, `NAME NOT LIKE DEMO_%`, `NAME <> EMP`, `NAME <> DEPT`. Come indicato sopra, esplorando gli elementi della connessione è possibile notare che vi sono altri elementi che possono essere filtrati con la stessa tecnica appena descritta.

Q: **Posso installare altre distribuzioni di SQL (MySQL, Microsoft SQL Server)?**<br/>
A: Non vi sono divieti sul cosa si voglia installare sul proprio PC, ma sconsiglio l'installazione di questi software semplicemente perchè non hanno finalità utili nel contesto del corso in quanto il docente utilizza soltanto Oracle SQL.

Q: **Ma nello specifico, cosa sono questi software?**<br/>
A: Oracle 11g XE Release 2 è il server che contiene e rappresenta il nostro RDBMS (DBMS relazionale), mentre SQL Developer è semplicemente un client (proprio come APEX dal browser e SQL Plus da console).

Q: **Se non volessi/potessi installare software, vi è un'alternativa (preferibilmente gratuita)?**<br/>
A: Sì. La Oracle mette a disposizione [LiveSQL](https://livesql.oracle.com) che permette anche di salvare i propri script. Funziona tramite browser web ed accessibile anche da smartphone. Inoltre l'università mette a disposizione lo stesso server che si utilizza in laboratorio che è utilizzabile anch'esso solo dal browser (non tramite SQL Developer per questioni di sicurezza) tramite la piattaforma APEX (Application Express), ma che sconsiglio vivamente di utilizzare in quanto molto lento.

Q: **Durante la registrazione al sito di Oracle mi vengono richiesti dati come l'occupazione e l'azienda, cosa inserisco?**<br/>
A: Credo che sia lecito inserire come occupazione "Studente" e come azienda il nome dell'università.

Q: **E' proprio obbligatorio registrarsi al sito Oracle?**<br/>
A: Per effettuare i download ed utilizzare LiveSQL, assolutamente sì, ma l'iscrizione può tornare molto utile per poter scaricare anche altri contenuti (come la JDK) che al giorno d'oggi, per un programmatore sono una vera necessità.
