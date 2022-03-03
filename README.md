# hsrmreport
## Optionen 
|Optionsschlüssel    |Optionstype|Standardwert    |Wenn gesetzt wird   |Beschreibung|
|---                 |---        |---      |---     |---|  
|lua                 | boolean   | false   | true   | Wenn das Dokument mit LuaLaTeX compiliert werden soll und die Funktionen von LuaLaTeX benötigt werden.
|luafont             | boolean   | true    | false  | Wenn LuaLaTeX benutzt wird steht die Möglichkeit offen die Schriftart "Source Sans Pro" als Fließtextschriftart zu verwenden.
|thesis              | boolean   | true    | false  | Falls mit dieser Dokumentenklasse eine Thesis erstellt wird kann mit dieser Option alles mögliche gesetzt werden damit das Dokument im Buchdruck verwendent werden kann 
|section             | boolean   | false   | true   | Du möchtest ein kleines Dokument erstellen, dann setze diese Option. Damit wird die Nummerierung von \chapter{} ausgesetzt und man hat mit \section{} die erste nummerierte Hierarchiestufe.
|banner              | boolean   | true    | false  | Falls im Deckblatt der Banner ausgeschalten werden soll.
|backgroundlogo      | boolean   | true    | false  | Falls im Deckblatt das Logo in der unteren rechten Ecke ausgeschalten werden soll.
|coloredheadline     | boolean   | false   | true   | Falls du die Überschriften farbig haben möchtetst.
|listingsforcontent  | boolean   | false   | true   | Falls Abblidungsverzeichnis, Tabellenverzeichnis usw. für dem Inhalt und nach dem Inhaltsverzeichnis dargestellt werden.
|toc                 | boolean   | true    | true   | Falls man das Inhaltsverzeichnis ausschalten möchte muss 'toc=false' setzen.
|lof                 | boolean   | false   | true   | Falls das Abbildungsverzeichnis dargestellt werden soll.
|lot                 | boolean   | false   | true   | Falls das Tabbellenverzeichnis dargestellt werden soll.
|lol                 | boolean   | false   | true   | Falls das Codeverzeichnis dargestllt werden soll.
|bibfile             | string    | bib-refs|        | Hier gibst du den Dateinamen an, von der Bib-Datei. Die Datei wird in 'asset/bib/' abgelegt.
|printbibliography   | boolean   | false   | ture   | Falls du das Literaturverzeichnis darstellen möchtest. 
|bibstyle            | string    |alphabetic|       | Mit welchem Stil das Literaturverzeichnis dargestellt wird. 
