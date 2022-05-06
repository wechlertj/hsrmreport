# hsrmreport
Hi 👋, ich bin TJ. Ich studiere an der Hochschule RheinMain angewandte Physik. 
Durch mein Studium bin ich in Kontakt mit LaTeX gekommen und habe gelernt welches Potential es besitzt. 

In diesem Repo befindet sich eine von mir selbst erstellte Dokumentenklasse.  In erster Linie ist diese für Studiernden der Hochschule RheinMain ausgelegt. 
Durch Anregungen von Kommilitonen und Anwendungen, wird diese Dokumentenklasse nach und nach erweitert oder überarbeitet.

Diese Dokumentenklasse soll sowohl für Ausarbeitungen wie Laborberichte, Praktikumsberichte und größere Hausarbeiten, wie auch für eine Bachelor- oder Masterthesis verwendet werden können.
Wie ihr damit arbeiten könnt und welche Funktionen die Klasse hat werde ich in den nächsten Abschnitten näher bringen.

*Hinweis: Bei der folgenden Anleitung setze ich ein Grundverständnis für LaTeX voraus.*

## Inhalt
- [#How to use]
- [#Optionen]
- [#Packete]

## How to use
Sobald ihr euch die Dokumentenklasse als zip-Datei herruntergeladen habt (über den grünen Buttonen "Code"), könnt ihr den Ordner `hsrmreport` kopieren.
Diesen Ordner könnt ihr umbenennen, in `Bericht1` oder ähnliches. So das ihr ihn wieder findet. 

Öffnet nun diesen Ordner mit eurem LaTeX-Editor des Vertrauen. Es wird euch wenn alles richtig lief folgende Ordnerstruktur angezeigt:

```
├─── README.md  
├─── asset/ 
│    ├─── bib/ 
│    │    └─── bib-refs.bib  
│    ├─── fonts/ 
│    │    ├───  SourceSansPro-Black.ttf  
│    │    ├───  SourceSansPro-BlackItalic.ttf  
│    │    ├───  SourceSansPro-Bold.ttf  
│    │    ├───  SourceSansPro-BoldItalic.ttf  
│    │    ├───  SourceSansPro-ExtraLight.ttf  
│    │    ├───  SourceSansPro-ExtraLightItalic.ttf  
│    │    ├───  SourceSansPro-Italic.ttf  
│    │    ├───  SourceSansPro-Light.ttf  
│    │    ├───  SourceSansPro-LightItalic.ttf  
│    │    ├───  SourceSansPro-Regular.ttf  
│    │    ├───  SourceSansPro-SemiBold.ttf  
│    │    └───  SourceSansPro-SemiBoldItalic.ttf    
│    ├─── logo/  
│    │    ├─── Plakat Ringvorlesung Endfassung.pdf  
│    │    ├─── background.pdf  
│    │    ├─── banner.png  
│    │    ├─── banner.svg  
│    │    ├─── logo.png  
│    │    └─── logo.svg  
│    └─── hsrmreport.cls  
├─── code/ 
├─── content/ 
│    └─── content.tex  
├─── fig/   
│    └─── plots/ 
└─── main.tex  
```
Lasst euch bei der Ordnerstruktur von den Dateien .gitkeep und .gitignore nicht irritieren. Ihr könnt sie ignorieren oder falls sie euch stören könnt ihr diese auch löschen.
In der Datei `main.tex` wird das Dokument erstellt. 
Ihr findet hier Variablen beispielhaft ausgefüllt und könnt diese an eure Bedürfnisse anpassen. 
Die Verzeichnisse (z.B. Inhaltsverzeichnis oder Abbildungsverzeichnis) könnt ihr über Optionen die Ihr der Dokumentenklasse übergebt ein oder ausschalten. 
## Optionen 
|Optionsschlüssel    |Optionstype|Standardwert    |Wenn gesetzt wird   |Beschreibung|
|---                 |---        |---      |---     |---|  
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
|lua                 | boolean   | false   | true   | Wenn das Dokument mit LuaLaTeX compiliert werden soll und die Funktionen von LuaLaTeX benötigt werden.
|luafont             | boolean   | true    | false  | Wenn LuaLaTeX benutzt wird steht die Möglichkeit offen die Schriftart "Source Sans Pro" als Fließtextschriftart zu verwenden.

## Packete 