# hsrmreport
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
Hier eine Auflistung aller Packete die in dieser Vorlage enthalten sind.
% **************************************************
% Color Definitions
% ************************************************** 
	\RequirePackage[dvipsnames,table]{xcolor}
	\RequirePackage{tikz}
	\usetikzlibrary{calc}
% **********************************************
% Mathematik
% **********************************************
	%  ---  Da die Standardschrift für den Mathematikmodus erhalten bleiben soll, wird mathtotext geladen.
	% 		Mit diesem Packet wird dies ermöglicht. Im Anschluss kann eine beliebige Schriftart gewählt werden.
	\ifrep@hsrm@luafont
		\RequirePackage[italic]{mathastext}
	\fi
	\RequirePackage{amsmath} 					% abgesetzte Formeln zentriert in der Zeile
	\RequirePackage{amssymb} 					
	\RequirePackage{amsfonts}
% **********************************************
% Schriftart für Fließtext
% **********************************************
	
	\ifrep@hsrm@lua
		%  ---  fontspec wird benötigt um freie Wahl bei der Schriftart zu haben und wird von LuaLaTeX benötigt.
		\RequirePackage{fontspec}
	\else
		\RequirePackage[utf8]{inputenc}
		\RequirePackage{lmodern}
	\fi
    \RequirePackage[ngerman]{babel}				% Eine Sammlung von verschieden Sprachen, und ermöglicht für diese Sprachen die automatische Worttrennung und die ändert die Bezeichnungen in die jeweilige Sprache. 
													% [ngerman]: Worttrennung nach der neuen Rechtschreibung und deutsche Bezeichnungen. 
	\RequirePackage{datetime}
	\RequirePackage[ngerman]{varioref}			% Sorgt für intelligente Querverweise (http://texdoc.net/texmf-dist/doc/latex/tools/varioref.pdf)
												% [ngerman]: neue deutsche Rechtschreibung 
	\RequirePackage{scrhack}
	\RequirePackage{cancel}						% Text durchstreichen 
	\RequirePackage{ulem}						% Text durchstreichen
	\RequirePackage[right]{eurosym} 			% Ermöglicht das nutzen von \EUR{-Betrag-} (http://www.theiling.de/eurosym.html)
												% [right]: Positionierung des Eurosymbol rechts des Betrags 
	\RequirePackage{blindtext}					% Platzhalter Text (https://ctan.mc1.root.project-creative.net/macros/latex/contrib/blindtext/blindtextpdf)
	\RequirePackage{textcomp}
	
	
	\RequirePackage{setspace}
	\RequirePackage[							% (https://www.namsu.de/Extra/pakete/Siunitx.html)
		locale=DE,
		%per-mode=symbol
		per-mode = fraction
	]{siunitx} 	
	\RequirePackage[							% advanced quotes (https://ctan.net/macros/latex/contrib/csquotes/csquotes.pdf)
		strict=true,							% 	- warning are errors now
		style=german							% 	- german quotes
	]{csquotes}
	%
    % **************************************************
	% Grafiken und Bilder
	% **************************************************
		\RequirePackage[							% modify figure and table captions
			font={small}, 							% 	- small font size
			labelfont={footnotesize,sf,bf},			% 	- 
			textfont={footnotesize,sf},
			labelsep=colon,							% 	- separator: none, colon, period, space, quad, newline, endash
			singlelinecheck=false,					% 	- no centered single-lined captions
			justification=centering
		]{caption}
		\RequirePackage{graphicx}					% Das Standardpaket zum Einbinden von Bildern / Grafiken. 
		\RequirePackage{wrapfig}					% Mit oder von Schrift umflossen Bilder.
		\RequirePackage[ 							% für die Unterbilder %---------
			font={scriptsize,sl},
			captionskip=3pt
		]{subfig}
		\RequirePackage{svg}
	%
	% **************************************************
	% Tabellen
	% **************************************************
		\RequirePackage{tabularx}					% Tabellen mit automatischen Zeilenumbruch.
		\RequirePackage{tabulary}					% Ähnlich wie tabularx, ermöglicht aber das ändern der Ausrichtung der Spalten.
		\RequirePackage{booktabs}					% Schöne Tabellen beziehungsweise sie sehen damit professioneller aus. 
		\RequirePackage{array}
		\RequirePackage{multirow}
		\RequirePackage{multicol}
		\RequirePackage{longtable}					% Tabellen über mehrere Seiten (https://www.namsu.de/Extra/pakete/Longtable.html)
		\RequirePackage{csvsimple}
		\RequirePackage{tablestyles}
	% 
	% **************************************************
	% Listen
	% **************************************************
		\RequirePackage{enumitem}					% for simple list modifications
		\RequirePackage[german,intoc]{nomentbl} 	%vier Spalten bei Formelzeichenverzeichnis (http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/macros/latex/contrib/nomentbl/nomentbl.pdf)		
		\RequirePackage{listings}
		\renewcommand{\lstlistingname}{Code}% Listing -> Algorithm
		\renewcommand{\lstlistlistingname}{Codeverzeichnis}% List of Listings -> List of Algorithms
		%				
		% ---------------------------
		% Textformatierung
		% ---------------------------
		%
	% 
	% **************************************************
	% Aussehen und Gestaltung von Dokumenten
	% **************************************************
		\RequirePackage{geometry}
		\RequirePackage{calc}
		\RequirePackage{scrlayer-scrpage}  
		\RequirePackage{setspace}					% Um den Zeilenabstand zu ändern, e.g. \onehalfspacing
		\RequirePackage[hyphens]{url}
		\appto\UrlBreaks{\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z}
		\appto\UrlBreaks{\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z}
		\appto\UrlBreaks{\do\/\do\_\do\0\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9}
		\RequirePackage[						
			pdftitle={titel},    					%   - title (PDF meta)
			pdfsubject={dokumentenart},				%   - subject (PDF meta)
			pdfauthor={autor},    					%   - author (PDF meta)
			plainpages=false,           			%   -
			colorlinks=true,           				%   - farbige Links
			linkcolor={black},
			anchorcolor={black},
			citecolor={Sec1},
			filecolor={Sec2},
			menucolor={black},
			runcolor={Sec3}, 					%	- same as file color
			urlcolor={Sec3Comp},
			%allcolors=any_color					%	- use this if you want to set all links to the same color
			pdfborder={0 0 0},         	 			%   - 
			breaklinks=true,            			%   - allow line break inside links
			linktoc=all,							% 	- ermöglicht klickbare Links im Inhaltsverzeichnis
			bookmarksnumbered=true,     			%	- 
			bookmarksopen=true          			%	- 
		]{hyperref} 								% Erstellt Verweise innerhalb und nach außerhalb eines PDF Dokumentes.
		\RequirePackage{bookmark}
		\RequirePackage{makeidx}					% Anlegen eines Stichwortverzeichnis.
		\RequirePackage{parallel}					% Ermöglicht Text in mehreren Spalten nebeneinander zu stellen (https://texfaq.org/FAQ-parallel)
		\RequirePackage[
			nonumberlist, 							% keine Seitenzahlen anzeigen
			acronym,      							% ein Abkürzungsverzeichnis erstellen
			toc,          							% Einträge im Inhaltsverzeichnis
			section      							% im Inhaltsverzeichnis auf section-Ebene erscheinen
		]{glossaries}
		\RequirePackage[
			record,
			stylemods,
			style=listgroup
		]{glossaries-extra}
		% \RequirePackage{tablefootnote}				% Für Fußnoten (http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/ctan/macros/latex/contrib/tablefootnote/tablefootnote.pdf)
	% **************************************************
	% Bibliography
	% **************************************************
		\RequirePackage[					% use biblatex for bibliography
			backend=bibtex,      % biber or bibtex
			%,style=authoryear    % Alphabeticalsch
			 style=\hsrm@bibstyle,  % numerical-compressed
			 sorting=none,        % no sorting
			 sortcites=true,      % some other example options ...
			 block=none,
			indexing=false,
			 citereset=none,
			 isbn=true,
			url=true,
			 doi=true,				% prints doi
			 natbib=true,			% if you need natbib functions
		]{biblatex}
		\bibliography{asset/bib/\hsrm@bibfile}
		\DefineBibliographyStrings{ngerman}{%
			andothers = {{et\,al\adddot}}, % 'et al.' instead of 'u.a.'
			backrefpage = {{zitiert auf Seite}},%
			backrefpages = {{zitiert auf den Seiten}},%
		}
	
	