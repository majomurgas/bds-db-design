# bds-db-design
# Application description
Môj projekt sa týka vytvorenia databázy, ktorá má za úlohu udržovanie dát, ktoré sú nevyhnutné pre prevádzku letiska. Aj keď sa jedná len o hrubý návrh, tak som sa snažil brať do úvahy rôzne informačné požiadavky. Zameral som sa hlavne na informácie o jednotlivých pasažieroch a identifikátoroch, ktoré sa využívajú pre overenie totožnosti a spôsobilosti k letu.Týmito identifikátormi sú letenka a palubný lístok. Systém taktiež zastrešuje informácie dôležité pre technickú prevádzku letiska ako sú napríklad údaje o lietadlách alebo geologické  informácie o letisku a prislúchajúce kódové označenia. Databáza obsahuje aj informácie o pilotoch a členoch posádky. Kľúčovou zložkou databázy je tabulka s označením flight, kde sa nachádzajú nevyhnutné údaje o letoch ako je miesto odletu a miesto cieľovej destinácie. Taktiež v nej nájdeme časové údaje prislúchajúce odletom a príletom jednotlivých letov.

# Description of each table
Tabuľka **Pilot**: má za úlohu uchovávať údaje o pilotoch.
Stĺpec **pilot_id** slúži pre identifikáciu pilota. Dátový typ som zvoli Integer pretože sa bude jednať o číselnú hodnotu.
Stĺpec **first_name** slúži pre ukladanie krstného mena. Dátový typ bol zvolený ako Varchar, pretože pôjde o znakové údaje s rozdielnou veľkosťou.
Stĺpec **last_name** má rovnakú funkciu ako stĺpec first_name ale ukladá sa priezvisko pilotov.
Stĺpec **contact_number** slúži na ukladanie kontaktného čísla pilotov. Dátový typ je Varchar z dôvodu rôznych formátov telefónnych čísel.
Stĺpec **pilot_license** slúži na ukladanie dát o licenciách jednotlivých pilotov. Dátový typ je taktiež varchar.
Stĺpec **designation** slúži na informácie označenie pozícií pilotov. Dátový typ je varchar, pretože sa bude jednať o znakové údaje.



Tabuľka **flight** obsahuje nevyhnutné informácie o letoch.
Stĺpec **flight_id** slúži na identifikáciu letov. Dátový typ som zvoli Integer pretože sa bude jednať o číselnú hodnotu.
Stĺpce **from** a **to** slúžia na označenie miesta odletu a cielovej destinácie. Dátový typ som zvolil varchar pretože pôjde o znakový zápis údajov.
Stĺpce **departure** a **arrival** slúžia na ukladanie informácií o odlete a prílete. Dátový typ je v tomto prípade DAYTIME pretože sa bude jednať o časové údaje.


Tabuľka **cabin_crew** slúži na ukladanie informácií o posádke na palube letu.
Nachádza sa tu stĺpec **cabin_crew_id** pre identifikáciu posádky.
Taktiež sa tu nachádzajú stĺpce pre ukladanie základných informácií o posádke. Týmito stĺpcami sú **first_name**, **last_name** , **contact_number** a **designation**.  Pri všetkých bol zvolený dátový typ varchar, pretože pôjde o znakové údaje.


Tabuľka **airline** slúži na uchovávanie informácií o leteckých spoločnostiach.
Tieto informácie sú uchovávané v stĺpcoch **airline_name** , **email** a **adress**. Pri všetkých bol zvolený dátový typ varchar.  
Súčasťou tabulky je samozejme stĺpec **airline_id** pre identifikáciu spoločnosti. Dátový typ je integer.


Tabuľka **airplane** slúži na ukladanie technických informácií o lietadle.
Nachádza sa tu stĺpec **model_num** v ktorom sú uchovávané  modelové čísla lietadla. Dátový typ je varchar, pretože sa nemusí jednať len o číselné hodnoty.


Tabuľka **airplane_type** obsahuje informácie o typoch jednotlivých dostupných lietadiel.
Nachádza sa tu stĺpec **description** , v ktorom sa ukladajú jednotlivé typy lietadiel a stĺpec **identifier**, ktorý slúži na identifikáciu, konkrétneho lietadla. Pri oboch som zvoli dátový typ varchar, pretože pôjde o znakové záznamy.

Tabuľka **airport** uchováva informácie, ktoré sú dôležité pre identifikáciu letiska.


Nachádzajú sa tu stĺpce **iata** a **icao** , kde sa ukladajú medzinárodné kódové označenia letísk a taktiež sa tu nachádza stĺpec name, kde sa uchováva názov letiska od ktorého sú tieto kódové označenia odvodené. Všetky záznamy budú znakového charakteru preto som zvolil dátový typ varchar pri všetkých stĺpcoch. 


Tabuľka **airpot_geo** slúží na ukladanie geologických informácii o letisku.
Nachádzajú sa tu stĺpce **city** a **country** , do ktorých sa ukladajú informácie o lokalite letiska.Dátový typ pri oboch stĺpcoch je varchar.


Tabuľka **boarding_pass** slúži na ukladanie informácií dôležitých pri nástupe na palubu lietadla.
Stĺpec **gate** uchováva infomácie o bráne pre odbavovanie pred odletom.
Stĺpec **meal** uchováva informácie o type jedla, ktoré si cestujúci objednal.
Stĺpec **baggage** hovorí o type batožiny, ktorú si cestujúci určil.
Všetky stĺpce majú dátový typ varchar, pretože pôjde o znakové záznamy.


Tabuľka **pasenger** obsahuje základné informácie pre identifikáciu pasažiera.
Nachádzajú sa tu stĺpce **first_name** a **lastname**. Ktoré majú dátový typ varchar.
Ďalším stĺpcom je **passportnum**, ktorý uchováva číslo pasu. Dátový typ je v tomto prípade integer, pretože pôjde len o číselné hodnoty.


Tabuľka **passenger_details** rozširuje tabulku **passenger** o ďalšie informácie o pasažieroch, ktoré ale nie sú nevyhntné na identifikáciu.
Stĺpec **birthdate** uchováva informácie o dátume narodenia.
Stĺpec **sex** uchováva informácie o pohlaví.
Stĺpec **phone_num** obsahuje telefonické údaje.
Stĺpec **emailadress** obsahuje emailovú adresu pasažiera.
Stĺpce **city**, **country** a **street** uchovávajú informácie o trvalom bydlisku pasažierov.
Všetky stĺpce majú dátový typ varchar , okrem stĺpca passenger_details_id, ktorý slúži na identifikáciu a uchováva číselné hodnoty.


Tabuľka **ticket** obsahuje informácie dôležité pre identifikáciu pasažiera pri predložení letenky.
Obsahuje stĺpce from a to,v ktorých nájdeme informácie o mieste odletu a príletu.
Nachádza sa tu aj stĺpec **currency**, ktorý informuje o mene ktorá bola použitá pri zaplatení letenky.
Pri všetkých stĺpcoch je nastavený dátový typ varchar, pretože pôjde o znakové záznamy až na stĺpec invoice_num, ktorý slúží na uchovávanie čísla faktúry a preto je dátový typ nastavený na integer.


Tabuľka **passenger_has_ticket** sprostredkúva many to many relationship medzi tabulkami passenger a ticket.
Obsahuje stĺpce **ticket_id** a **passenger_id**, ktoré slúžia na identifikáciu pasažiera a letenky a ich vzájomné pridelenie. Jedná sa o číselné hodnoty a preto majú dátový typ integer.


# Description why do you think that your database is in 3rd normal form?
Moja datábaza spĺňa podmienky treťej normálovej formy, pretože všetky atribúty, ktoré obsahuje sú funkcionálne závislé len na primárnych kľúčoch.
