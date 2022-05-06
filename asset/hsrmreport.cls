\NeedsTeXFormat{LaTeX2e}
\LoadClass[%
	  paper=A4,               	% Dokumentengröße
	  %twoside,           		% Einseitig oder Zweiseitig (oneside/twoside)
	  openright,                % doublepage cleaning ends up right side
	  parskip=half,           	% spacing value / method for paragraphs
	  %chapterprefix=true,     	% prefix for chapter marks
	  12pt,                   	% Schriftgröße
	  headings=normal,        	% size of headings
	  bibliography=totoc,     	% include bib in toc
	  listof=totoc,           	% include listof entries in toc
	  titlepage=on,           	% own page for each title page
	  captions=tableabove,    	% display table captions above the float env
	  chapterprefix=false,    	% do not display a prefix for chapters
	  appendixprefix=false,   	% but display a prefix for appendix chapter
	  draft=false,            	% value for draft version
	  numbers=noenddot
	]{scrreprt}
	\ProvidesClass{asset/hsrmreport}[2020/03/29 Class file for homework assignments]
	
	
	% **************************************************
	% Packages (https://www.namsu.de/Extra/latex-pakete.html)
	% **************************************************
		\RequirePackage{xpatch}					%
		\RequirePackage{xkeyval}				%
		\RequirePackage{xifthen}				% Für die Möglichkeit If-Abfragen zu erstellen (http://ctan.ebinger.cc/tex-archive/macros/latex/contrib/xifthen/xifthen.pdf)
		\RequirePackage{kvoptions} 				% http://www.tug.org/tugboat/tb30-1/tb94wright-keyval.pdf
		\SetupKeyvalOptions{
			family=hsrm,
			prefix=hsrm@
		}
		% **********************************************
		% Definition aller Optionen für diese Klasse
		% **********************************************
			%  -- mögliche Optionen:
			% 		bibfile (string) 		-> default = bib-refs
			% 		thesis (boolean) 		-> default = false
			% 		section (boolean) 		-> default = false
			% 		banner (boolean) 		-> default = true
			% 		backgroundlogo (boolean)-> default = true
			% 		toc (boolean) 			-> default = true
			% 		lof (boolean) 			-> default = false
			% 		lot (boolean) 			-> default = false
			% 		lol (boolean) 			-> default = false
			% 		printbib (boolean) 		-> default = false
			% 		bibstyle (string) 		-> default = alphabetic
			%
			%	[bibfile] 	Gibt den Name der Bibliothek an die Standardmäßig eingebunden ist.
			%	[thesis] 	Ändert das Dokument so ab, dass die PDFs für einen Buchdruck ausgerichtet werden.
			%				Der Name der Option ist aus der Ursprünglichen Dokumentenklasse und kann auch geändert werden.
			%				z.B. towside
			%	[section]	Schält die Nummerierung um. Es werden die Kapitelnummern ignoriert.
			%				Anwendung wenn, ein kleines Dokument erstellt wird, in dem nicht viele Kapitel sind oder diese nicht sonderlich groß sind.
			% 	[toc]		Ermöglicht es das Inhaltsverzeichnis aus zu blenden.
			% 	[lof]		Ermöglicht es das Abbildungsverzeichnis einzublenden.
			%	[lot]		Ermöglicht es das Tabellenverzeichnis einzublenden.
			% 	[lol]		Ermöglicht es das Programmcodeverzeichnis einzublende.
			%	[printbib]	Stellt die benutze Zitate am Endes des Dokuments in dem Literaturverzeichnis dar.
			%	[bibstyle]	Nach welchem Stil das Literaturverzeichnis aufgebaut werden soll.
	
	
			% OPTION bibfile
			% --> values = file name of your bibtex file
			\define@key[rep]{hsrm}{bibfile}[bib-refs]{\def\hsrm@bibfile{#1}}
			\setkeys[rep]{hsrm}{bibfile=bib-refs}

			% OPTION thesis
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{lua}[true]{}
			\setkeys[rep]{hsrm}{lua=false}

			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{svg}[true]{}
			\setkeys[rep]{hsrm}{svg=false}

			\define@boolkey[rep]{hsrm}{luafont}[true]{}
			\setkeys[rep]{hsrm}{luafont=false}

			\define@boolkey[rep]{hsrm}{emoji}[true]{}
			\setkeys[rep]{hsrm}{emoji=false}
			% OPTION thesis
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{thesis}[true]{}
			\setkeys[rep]{hsrm}{thesis=false}
	
			% OPTION Ignore Chapter numbering
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{section}[true]{}
			\setkeys[rep]{hsrm}{section=false}

			% OPTION Ignore Chapter numbering
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{banner}[false]{}
			\setkeys[rep]{hsrm}{banner=true}
			
			% OPTION Ignore Chapter numbering
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{backgroundlogo}[false]{}
			\setkeys[rep]{hsrm}{backgroundlogo=true}

			% OPTION Ignore Chapter numbering
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{coloredheadline}[true]{}
			\setkeys[rep]{hsrm}{coloredheadline=false}

			% OPTION Ignore Chapter numbering
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{listingsforcontent}[true]{}
			\setkeys[rep]{hsrm}{listingsforcontent=false}
	
			% OPTION tableofcontent
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{toc}[false]{}
			\setkeys[rep]{hsrm}{toc=true}
	
			% OPTION listoffigures
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{lof}[true]{}
			\setkeys[rep]{hsrm}{lof=false}
	
			% OPTION listoftables
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{lot}[true]{}
			\setkeys[rep]{hsrm}{lot=false}
			
			% OPTION listoflistings
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{lol}[true]{}
			\setkeys[rep]{hsrm}{lol=false}
	
			% OPTION printbibliography
			% --> Werte = true|false
			\define@boolkey[rep]{hsrm}{printbib}[true]{}
			\setkeys[rep]{hsrm}{printbib=false}
	
			% OPTION bibstyle
			% --> values = biblatex style options
			\define@key[rep]{hsrm}{bibstyle}[alphabetic]{\def\hsrm@bibstyle{#1}}
			\setkeys[rep]{hsrm}{bibstyle=alphabetic}
	
			% Verarbeitung der nicht zuweisbaren Optionen
			\DeclareOptionX*{
				\PackageWarning{hsrmreport}{Unknown option ‘\CurrentOption’}%
			}
			
			\ProcessOptionsX[rep]<hsrm>
			
			% Checks if bib file exists, if not we throw an error
			\IfFileExists{asset/bib/\hsrm@bibfile.bib}{}{\PackageError{hsrm}{Es ist mir nicht möglich die BibTeX-Datei mit dem Namen:"\hsrm@bibfile.bib" zu finden! Bitte stell sicher das eine BibTeX-Datei im Hauptverzeichnis zu finden ist.}{}}
			
			% Prüft ob das Hochschul Logo vorhanden ist
			\IfFileExists{asset/logo/banner.svg}{}{\PackageError{hsrm}{Es war mir nicht die Datei "banner.svg" im Ordner "asset/logo" zu finden! Bitte stell sicher, dass der Ordner "asset/logo" im aktuellen Projekt zu finden ist. Du kannst aus einem älternen Projekt diese Datei oder auch Ordner kopieren.}{Falls denoch Probleme auftauchen melde dich bei: timjonas.wechler@student.hs-rm.de}}
			% Prüft ob das Hochschul Logo vorhanden ist
			\IfFileExists{asset/logo/banner.png}{}{\PackageError{hsrm}{Es war mir nicht die Datei "banner.svg" im Ordner "asset/logo" zu finden! Bitte stell sicher, dass der Ordner "asset/logo" im aktuellen Projekt zu finden ist. Du kannst aus einem älternen Projekt diese Datei oder auch Ordner kopieren.}{Falls denoch Probleme auftauchen melde dich bei: timjonas.wechler@student.hs-rm.de}}

			% Prüft ob Hintergrund vorhanden ist 
			\IfFileExists{asset/logo/background.pdf}{}{\PackageError{hsrm}{Es war mir nicht die Datei "background.pdf" im Ordner "asset/logo" zu finden! Bitte stell sicher, dass der Ordner "asset/logo" im aktuellen Projekt zu finden ist. Du kannst aus einem älternen Projekt diese Datei oder auch Ordner kopieren.}{Falls denoch Probleme auftauchen melde dich bei: timjonas.wechler@student.hs-rm.de}}
	
		%
	%
	% **************************************************
	% Color Definitions
	% ************************************************** 
		\RequirePackage[dvipsnames,table]{xcolor}
		\RequirePackage{tikz}
		\usetikzlibrary{calc}
	
		% **********************************************
		% Definition aller Farben
		% **********************************************	
			\definecolor{gray}{cmyk}{0,0,0,.8}
			\definecolor{red}{cmyk}{0,1,1,0}
			\definecolor{reddark}{cmyk}{0,1,.9,.41}
			\definecolor{graylight}{gray}{.8}
			\definecolor{graylighter}{gray}{.95}
	
			% --> footer colors
				\colorlet{ctcolorfooterpage}{black}
				\colorlet{ctcolorfooterline}{gray}
				\colorlet{ctcolorfootermark}{black}
				\colorlet{ctcolorfootertitle}{gray}
	
			% --> sectioning colors
				\colorlet{ctcolortitle}{black}
				\colorlet{ctcolorpartnum}{black}
				\colorlet{ctcolorpartline}{black}
				\colorlet{ctcolorparttext}{black}
				\colorlet{ctcolorchapternum}{gray}
				\colorlet{ctcolorchapterline}{black}
	
			% --> text colors
				\colorlet{ctcolorfloatlabel}{gray}
				\colorlet{ctcolorlistlabel}{black}
	
			% --> Primary Colors
				\definecolor{Prim}{rgb}{0.882352941,0,0.098039216}
				\definecolor{PrimDark}{rgb}{0.588235294,0,0.058823529}
				\definecolor{WarmGreyDark}{rgb}{0.274509804,0.254901961,0.235294118}
				\definecolor{WarmGreyLight}{rgb}{0.666666667,0.647058824,0.62745098}
	
			% --> Secondary Colors
				\definecolor{Sec1}{rgb}{0,0.588235294,0.509803922}
				\definecolor{Sec1Dark}{rgb}{0,0.392156863,0.31372549}
				\definecolor{Sec1Comp}{rgb}{0.294117647,0.745098039,0.882352941}
				\definecolor{Sec1CompDark}{rgb}{0.196078431,0.490196078,0.568627451}
	
				\definecolor{Sec2}{rgb}{0.607843137,0.764705882,0.156862745}
				\definecolor{Sec2Dark}{rgb}{0.411764706,0.490196078,0.098039216}
				\definecolor{Sec2Comp}{rgb}{0.254901961,0.156862745,0.509803922}
				\definecolor{Sec2CompDark}{rgb}{0.176470588,0.098039216,0.333333333}
	
				\definecolor{Sec3}{rgb}{0.509803922,0.078431373,0.31372549}
				\definecolor{Sec3Dark}{rgb}{0.338345865,0.058823529,0.196078431}
				\definecolor{Sec3Comp}{rgb}{1,0.509803922,0}
				\definecolor{Sec3CompDark}{rgb}{0.666666667,0.333333333,0}
	
	%
	% **************************************************
	% Sprachen und Schrift
	% **************************************************
	
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
				\RequirePackage[T1]{fontenc}
			\fi
			
			\ifrep@hsrm@luafont
				% ------------------------------------------
				% Setzen der gewünschten Schriftarten
				% ------------------------------------------
					\newfontfamily{\ExtraLight}{SourceSansPro}[
						UprightFont=*-ExtraLight,
						ItalicFont=*-ExtraLightItalic,
						BoldFont=*-Light,
						BoldItalicFont=*LightItalic,
					]
					\newfontfamily{\Light}{SourceSansPro}[
						UprightFont=*-Light,
						ItalicFont=*LightItalic,
						BoldFont=*-Regular,
						BoldItalicFont=*-Italic,
					]%
					\newfontfamily{\HeadlineFont}{SourceSansPro}[
						UprightFont=*-SemiBold,
						ItalicFont=*-SemiBoldItalic,
						BoldFont=*-Bold,
						BoldItalicFont=*-BoldItalic,
					]
					\setmainfont{SourceSansPro}[
						UprightFont=*-Regular,
						ItalicFont=*-Italic,
						BoldFont=*-SemiBold,
						BoldItalicFont=*-SemiBoldItalic,
					]%
				%
			\fi
		%
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
		\RequirePackage{blindtext}					% Platzhalter Text (https://ctan.mc1.root.project-creative.net/macros/latex/contrib/blindtext/blindtext.pdf)
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
		% \RequirePackage{emoji}
		% \setemojifont{Twemoji Mozilla}
		%
		% ---------------------------
		% Textformatierung
		% ---------------------------
			\setlength{\parindent}{0em}			% Um in einem neuen Abschnitt den Text nicht einrücken zu lassen.
			\clubpenalty = 10000				% prevent single lines at the beginning of a paragraph (Schusterjungen)
			\widowpenalty = 10000				% prevent single lines at the end of a paragraph (Hurenkinder)
			\displaywidowpenalty = 10000		%
	
						
			\newcommand{\fontfooterpagenumber}{%
				\color{ctcolorfooterpage}%
				\ifrep@hsrm@lua\ifrep@hsrm@lua\Light\else\normalfont\fi\fi\normalsize\selectfont%
			}
			\newcommand{\fontfootertext}{%
				\color{ctcolorfootertitle}%
				\ifrep@hsrm@lua\ifrep@hsrm@lua\Light\else\normalfont\fi\fi\footnotesize\selectfont%
			}
			%
			% Inhaltsverzeichnis Tiefe bis zu SubSection
			\setcounter{secnumdepth}{\subsectionnumdepth}
	
		%
		% ---------------------------
		% Abschnitte Formatieren
		% ---------------------------
			% -- modifications regarding sectioning (structural) commands,
			%    i.e. \part, \chapter, \section, \subsection, \subsubsection, \paragraph
			%
			% 		Koma-Script Dokumentation (https://komascript.de/~mkohm/scrguide.pdf) S. 514
			% 
			% [font]: 		die Formatierung die man im Fließtext sieht
			% [tocindent]: 	wie weit der TOC-Eintrag eingerückt ist 
			% [innerskip]:	Abstand zwischen Prefixzeile und Kapitel, Abschnitt, ...
			% [toc...]: 	alles was den Prefix "toc" hat betrifft das Inhaltsverzeichnis.
			% 				Diese Angaben sind wichtig da sie andere Standardwerte haben. 
			%				Möchte man den Standard von der KOMA-Klasse einfach die Einträge auskommentieren.
			%
			% > formats: \part
			
				\renewcommand*{\partpagestyle}{empty}
				\RedeclareSectionCommand[
					font=\ifrep@hsrm@luafont\Light\else\normalfont\fi\Huge,
					prefixfont=\ifrep@hsrm@luafont\HeadlineFont\else\fontfamily{pbk}\mdseries\color{WarmGreyDark}\fi\fontsize{80}{80}\selectfont,
					tocindent=0pt,
					tocentryformat=\ifrep@hsrm@luafont\Light\else\normalfont\fi\Large\selectfont,
					tocpagenumberformat=\ifrep@hsrm@luafont\Light\else\normalfont\fi\Large\selectfont,
					innerskip=-0.2\baselineskip,
				]{part}
				\renewcommand*{\partformat}{%
					\tikz[remember picture]\node[inner ysep=-0.4em,inner xsep=0.3em](partnumber)
						{\raisebox{.7em}{\MakeUppercase{\partname}\nobreakspace \fontsize{120}{120}\selectfont{\thepart\autodot}}};%	
				}
		
			%
			% > formats: \chapter
				\RedeclareSectionCommand[
					font=\ifrep@hsrm@luafont\HeadlineFont\else\normalfont\fi\ifrep@hsrm@coloredheadline\color{Prim}\fi\huge\selectfont,
					tocnumwidth = 2em,
					tocentryformat=\ifrep@hsrm@luafont\Light\else\normalfont\bfseries\fi\large\selectfont
				]{chapter}
				\renewcommand*\chapterheadstartvskip{\vspace*{-8.5em}}
				\renewcommand*\chapterheadendvskip{\vspace*{2\baselineskip}}
				\renewcommand*{\chapterformat}{%
					\chapternumber{\thechapter}%
				}
				\renewcommand{\chapterlinesformat}[3]{%
					\chaptertitle{#3}%
					#2\par%
				}
	
				\newcommand{\chapternumber}[1]{%
					\usekomafont{chapter}%
					\begin{minipage}[t]{0.3\textwidth}%
						\raggedleft{%
							{\vspace*{-0.5cm}\color{ctcolorchapterline}\rule[0pt]{2pt}{5.5cm}}%
							\quad%
							{\ifrep@hsrm@luafont\normalfont\else\bfseries\fi\fontsize{60}{60}\color{ctcolorchapternum}\selectfont#1}%
						}%
					\end{minipage}%
				}
				\newcommand{\chaptertitle}[1]{%
					\usekomafont{chapter}%
					\begin{minipage}[t]{0.7\textwidth}%
						\vspace*{5.85em}%
						\raggedright%
						#1%
					\end{minipage}%
				}
			%
			% > formats: \section
				\RedeclareSectionCommand[
					font=\ifrep@hsrm@luafont\HeadlineFont\else\normalfont\fi\ifrep@hsrm@coloredheadline\color{Prim}\fi\LARGE,
					tocindent =2em,
					tocentryformat=\ifrep@hsrm@luafont\Light\else\normalfont\fi\selectfont
				]{section}
			%
			% > formats: \subsection
				\RedeclareSectionCommand[
					font=\ifrep@hsrm@luafont\HeadlineFont\else\normalfont\fi\ifrep@hsrm@coloredheadline\color{Prim}\fi\Large\selectfont,
					tocindent = 4.25em,
					tocentryformat=\ifrep@hsrm@luafont\Light\else\normalfont\fi\small\selectfont
				]{subsection}
			%
			% > formats: \subsection
			\RedeclareSectionCommand[
				font=\ifrep@hsrm@luafont\HeadlineFont\else\normalfont\fi\ifrep@hsrm@coloredheadline\color{Prim}\fi\large\selectfont,
			]{subsubsection}
			%
			% > formats: \paragraph
				\RedeclareSectionCommand[
					font=\ifrep@hsrm@luafont\HeadlineFont\else\normalfont\fi\ifrep@hsrm@coloredheadline\color{Prim}\fi\bfseries\selectfont
				]{paragraph}
			%
			
		%
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
		\ifrep@hsrm@lua
			\RequirePackage{emoji}
			\setemojifont{Twemoji Mozilla}
		\fi
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
		
		% ---------------------------
		% Weitere Einstellungen für den Seitenaufbau
		% ---------------------------
			\clearpairofpagestyles
			\geometry{
				%showframe, % <========================================================
				tmargin=25mm,        % top    
				rmargin=25mm,       % right (outer)
				heightrounded,
				includeheadfoot=false,
				inner=25mm,
				outer=25mm,
				headheight=7mm,     % 
				headsep=9mm,        % 
				foot=40pt,          %
				footskip=40mm,
				bottom=25mm,
				marginparsep=2mm,   % 
				marginparwidth=18mm % 
			}
			\ifrep@hsrm@thesis
				\geometry{
					twoside
					%,showframe
					}
			\fi
		%
		% ---------------------------
		% Header Footer Definition
		% ---------------------------
			\automark[section]{chapter}         % automatically marks sections as rightmark
			% and chapters as leftmark
			\setlength{\footheight}{80pt}
			\pagestyle{scrheadings}
				% the outer border
			\setkomafont{pagefoot}{\fontfootertext}           % font for footer
			\setkomafont{pagenumber}{\fontfooterpagenumber}   % font for page numbers
	
			%% Redefinition of the chaptermark (used for footer mark on even (left) pages)
			\renewcommand{\chaptermark}[1]{%
				\markboth{%
				\ifnum\value{chapter}>0
					\fontfootertext
					% use \@chapapp instead of \chaptername to avoid
					% 'Chapter A Appendix ...', thanks to @farbverlust (issue #47)
					{\color{WarmGreyDark}\textbf{\@chapapp\ \thechapter\;}}%
					%\hspace{.25cm}%
					\begin{minipage}[t]{.84\linewidth}%
						#1%
					\end{minipage}%
				\fi
				}{}%
			}
	
			%% Redefinition of the sectionmark (used for footer mark on odd (right) pages)
			\renewcommand{\sectionmark}[1]{%
				\markright{%
				\ifnum\c@secnumdepth>\@ne
						\fontfootertext
						\raggedleft%
						{\color{ctcolorfootermark}\textbf{\thesection}}%
					\hspace{.25cm}%
					\begin{minipage}[t]{\minof{\widthof{#1}}{.7\textwidth}}%
						#1%
					\end{minipage}%			
				\fi
				}%  
			}
	
			%% Vertical line in the footer (between page number and mark)
			\newcommand{\footerline}{%
				\color{ctcolorfooterline}\rule[-35pt]{1.25pt}{45pt}%
			}
			%% Page number for odd (right) pages
			\newcommand{\footerrightpagenumber}{%
				\hfill {\footerline\hspace*{5pt} \pagemark}
			}
	
			%% Page number for even (left) pages
			\newcommand{\footerleftpagenumber}{%
				\hfill {\footerline\hspace*{5pt} \pagemark}
				%\llap{\pagemark\hspace*{5pt}\footerline}
			}
	
	
			%\lehead[\clearscrheadfoot]{\rightmark}
			%\lehead[\clearscrheadfoot]{\rightmark}
			\lehead{}
			\cehead{}
			\rehead{}
			\ifrep@hsrm@thesis\else 
				\lohead{\leftmark}
			\fi
			\cohead{}
			\rohead{}
			\lefoot[%   > plain
				\footerleftpagenumber%
			]{%         > srcheadings
				\hspace{-2cm}
				\footerleftpagenumber%
				\hspace{0.75cm}%
				\headmark%
			}
			\cefoot{}
			\refoot{}
			\lofoot{}
			\cofoot{}
			\rofoot[%   > plain
				\footerrightpagenumber%
			]{%         > srcheadings
				\headmark%
				\hspace*{0.75cm}%
				\footerrightpagenumber%
			}
			% \lohead[\clearpairofpagestyles]{\leftmark}
	
			
			% \refoot[\footerrightpagenumber]{\footerrightpagenumber} 
			% \rofoot[\footerrightpagenumber]{\footerleftpagenumber}
			
			
			
		%
	% 
	
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
	
	
	
	%
	% **************************************************
	% New Commands
	% **************************************************
		% TODO command
		\definecolor{color_todo}{rgb}{.6,.8,.2}
		\newcommand{\todo}[1]{{\color{color_todo}\textbf{[TODO #1]}}}
		%
		%
		% ref commands, e.g. for images, tables and text labels
		% --------------------------------------------------
		% RESULT = (siehe Tab. 12.4)
		\newcommand{\tabref}[1]{(siehe Tab.~\ref{#1})}
		%
		% RESULT = (siehe Tab. 12.4 Seite 12)
		\newcommand{\tableref}[1]{(siehe Tab.~\ref{#1}, Seite~\pageref{#1})}
		%
		% --------------------------------------------------
		% RESULT = (siehe 3.4)
		\newcommand{\tref}[1]{(siehe \ref{#1})}
		%
		% RESULT = Abschnitt 3.4
		\newcommand{\treft}[1]{Abschnitt~\ref{#1}}
		%
		% RESULT = (siehe 3.4, Seite 12)
		\newcommand{\textref}[1]{(siehe \ref{#1}, Seite~\pageref{#1})}
		%
		% RESULT = Abschnitt 3.4 (siehe Seite 12)
		\newcommand{\textreft}[1]{Abschnitt~\ref{#1} (siehe Seite~\pageref{#1})}
		%
		% --------------------------------------------------
		% RESULT = (siehe Abb. 10.4)
		\newcommand{\fref}[1]{(siehe Abb.~\ref{#1})}
		%
		% RESULT = (siehe Abb. 10.4 b)
		\newcommand{\frefadd}[2]{(siehe Abb.~\ref{#1}~#2)}
		%
		% RESULT = (siehe Abb. 10.4, Seite 12)
		\newcommand{\figref}[1]{(siehe Abb.~\ref{#1}, Seite~\pageref{#1})}
		%
		% RESULT = (siehe Abb. 10.4 b, Seite 12)
		\newcommand{\figrefadd}[2]{(siehe Abb.~\ref{#1}~#2, Seite~\pageref{#1})}
		%
		% RESULT = Abbildung 10.4
		\newcommand{\figreft}[1]{Abbildung~\ref{#1}}
		%
		% RESULT = Abbildung 10.4 b
		\newcommand{\figrefaddt}[2]{Abbildung~\ref{#1}~#2}
		%
		% --------------------------------------------------
		% RESULT = (siehe Seite 12)
		\newcommand{\seepage}[1]{(siehe Seite~\pageref{#1})}
	
		\renewcommand{\tt}[1]{\texttt{\color{red}{#1}}}
	
		\renewcommand{\bf}[1]{\textbf{#1}}
		
	
	
	% **************************************************
	% Titelseite
	% **************************************************
	
		\newcommand{\frontpage}{
			\pagestyle{empty}	

				% Erstellt in der Übersicht der PDF-Datei den Eintrag "Titelseite"
				\pdfbookmark[0]{Titleseite}{Titleseite}
				{
					\ifrep@hsrm@lua\else\sffamily\fi
					\ifrep@hsrm@banner
						\ifrep@hsrm@svg
							\begin{tikzpicture}[remember picture,overlay,every node/.style={inner sep=0,outer sep=0}]
								\node (back names) [shape=rectangle, minimum height=50mm, minimum width=\paperwidth, anchor=north west] at (current page.north west) {\includesvg[width=\paperwidth]{asset/logo/banner.svg}};
							\end{tikzpicture}
						\else
							\begin{tikzpicture}[remember picture,overlay,every node/.style={inner sep=0,outer sep=0}]
								\node (back names) [shape=rectangle, minimum height=50mm, minimum width=\paperwidth, anchor=north west] at (current page.north west) {\includegraphics[width=\paperwidth]{asset/logo/banner.png}};
							\end{tikzpicture}
						\fi
					\fi
					\ifrep@hsrm@backgroundlogo
						\begin{tikzpicture}[remember picture,overlay,every node/.style={inner sep=0,outer sep=0}]
							\node (back names) [shape=rectangle, minimum height=50mm, minimum width=0.5\paperwidth, anchor=south east] at (current page.south east) {\includegraphics[width=0.5\paperwidth]{./asset/logo/background.pdf}};
						\end{tikzpicture}
					\fi
					\centering
					\ifrep@hsrm@banner
						\vspace{3cm}
					\fi
					\centering
					
					% Das Logo mit Namen wird eingefügt
					% \includegraphics[width=6cm]{asset/logo/logo_hsrm} \\[-1mm]
					\text{Fachbereich \fachbereich} \\
					% Die Folgende angaben sind aus den Variablen in der main.tex zu entnehmen
					\text{Studiengang \studiengang} \\
					\text{Studienrichtung \studienrichtung} \\ [35mm]

					\text{\large \dokumentenart} \\[5mm]
					\text{\LARGE \textbf{\titel}}\par\smallskip
					\text{\large \textbf{\kurs}}\par\medskip
					\ifrep@hsrm@thesis\else
						{Versuchsdurchführung: \versuchsdurchfuehrungDatum}
					\fi
				
					\vfill
					\ifrep@hsrm@thesis
						% Angaben zu den Autoren des Dokuments 
						\begin{tabular}[\textwidth]{rl}
							\textit{Student}&{\Large \studentA }\ \matStudentA\\
							\textit{Referent:in}&{ \Referent }\ \\
							\smallskip\textit{Korreferent:in}&{ \Korreferent}\ \\
						\end{tabular} \\[10mm]
					\else
						% Angaben zu den Autoren des Dokuments 
						\begin{tabular}[\textwidth]{rl}
							\textit{Studierende}&{\Large \studentA }\ \matStudentA\\
												&{\Large \studentB }\ \matStudentB\\
												&{\Large \studentC }\ \matStudentC\\
							\smallskip			&{\Large \studentD }\ \matStudentD\\
						\end{tabular} \\[10mm]
					\fi
								
					\begin{center}
						\AbgabeOrt, \datum
					\end{center}
									
				}	
			\newpage
		}
	
	\AtBeginDocument{
		% Title 
		\frontpage
	
		%Römischen Seitenzahl
		\pagenumbering{Roman}
	
		%Inhaltsverzeichnis
		\ifrep@hsrm@toc
			\begingroup		
			\pagestyle{plain}
			\tableofcontents
			\cleardoublepage
			\endgroup
			\newpage
		\fi

		\ifrep@hsrm@listingsforcontent
			%Abbildungsverzeichnis
			\ifrep@hsrm@lof
				\begingroup		
				\pagestyle{plain}
				\listoffigures
				\cleardoublepage
				\endgroup
			\fi
		
			%Tabellenverzeichnis
			\ifrep@hsrm@lot
				\begingroup		
				\pagestyle{plain}
				\listoftables
				\cleardoublepage
				\endgroup
			\fi	
			
			%Codeverzeichnis
			\ifrep@hsrm@lol
				\begingroup		
				\pagestyle{plain}
				\lstlistoflistings
				\cleardoublepage
				\endgroup
			\fi	
		\fi
		
	
		%Normale Seitenzahlen
		\pagenumbering{arabic}
	
		%Das Seitenlayout mit Kapitel und Unterkapitel im Header jeder Seite des Berichts
		\pagestyle{scrheadings}
	
		%Tabellenverzeichnis
		\ifrep@hsrm@section
			\renewcommand*\thesection{\arabic{section}}
		\fi	
	
	}
	\AtEndDocument{
	
		\ifrep@hsrm@printbib
			\printbibliography
		\fi
		\ifrep@hsrm@listingsforcontent
		\else
			%Abbildungsverzeichnis
			\ifrep@hsrm@lof
				\begingroup		
				\pagestyle{plain}
				\listoffigures
				\cleardoublepage
				\endgroup
			\fi
		
			%Tabellenverzeichnis
			\ifrep@hsrm@lot
				\begingroup		
				\pagestyle{plain}
				\listoftables
				\cleardoublepage
				\endgroup
			\fi	
			
			%Codeverzeichnis
			\ifrep@hsrm@lol
				\begingroup		
				\pagestyle{plain}
				\lstlistoflistings
				\cleardoublepage
				\endgroup
			\fi	
		\fi
	}