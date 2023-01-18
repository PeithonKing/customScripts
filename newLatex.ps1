if ($args) {
	$loc = $args[0]
}else {
	$loc = Get-Location
}


$main=@"
\documentclass[10pt]{article}
\input{settings.tex}

\title{\textbf{Name of the Experiment}}
\author{Aritra Mukhopadhyay\\(Roll. No.: 2011030)}
\date{}

\begin{document}
    \maketitle
    
    \begin{multicols*}{2}
        \input{sections/aim&aparatus.tex}
        \input{sections/theory.tex}
        \input{sections/observations.tex}
        \input{sections/calculation.tex}
        \input{sections/error.tex}
        \input{sections/conclusion.tex}

        \bibliographystyle{apalike}
        \bibliography{ref.bib}
        \nocite{*}
    \end{multicols*}

    \newpage

\end{document}
"@

$settings=@"
% importing packages
\usepackage[left=1.6cm, right= 1.6cm, top=1.0cm, bottom=1.36cm]{geometry}  % page margins
\usepackage{multicol}  % multiple columns
\usepackage[utf8]{inputenc}  % input encoding
\usepackage{gensymb}  % math symbols
\usepackage{indentfirst}  % indent first line of paragraph
\usepackage{graphicx}  % adding pictures
\usepackage{float}  % floating figures
\usepackage{fancyvrb}  % verbatim
\usepackage{mathtools}  % math
\usepackage{xfrac}   % fractions
% \usepackage[italicdiff]{physics}  % physics
\usepackage[center]{caption}  % centering captions
\usepackage{hyperref}  		% for hyperlinks
\usepackage{amsmath}  		% for math symbols
\usepackage{physics} 		% for physics symbols
\usepackage{multirow} 		% for tables
\usepackage{amssymb} 		% for math symbols
\usepackage{longtable}


% defining new commands
\newcommand{\angstrom}{\textup{\AA}}  % angstrom
\DeclareMathOperator{\taninv}{tan^{-1}}
\DeclareUnicodeCharacter{2212}{-}
\setlength{\columnsep}{0.5cm}  % column separation

% defining graphics path
\graphicspath{ {./images/} }

% the next 5 lines help in removing the ugly
% boxes around links and making them look better
\hypersetup{
	colorlinks = true,
	urlcolor = black,
	linkcolor = black,
	citecolor = black,
}
"@

$ref=@"
@article{manual,
    title   = {Lab Manual},
    author  = {SPS},
    note    = {\url{https://...}},
    year    = {2022},
    journal = {Website}
  }
"@

$lorem = "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit mollitia illo reiciendis, nam at blanditiis dolore repellat. Placeat nisi, neque odio, debitis et possimus quo obcaecati totam cupiditate omnis culpa labore aut dolor! Ratione minima optio excepturi architecto itaque sint perspiciatis quos, molestiae nobis, porro cumque dolorem harum necessitatibus temporibus!"

Write-Output $main > "$loc\main.tex"
Write-Output $settings > "$loc\settings.tex"
Write-Output $ref > "$loc\ref.bib"
mkdir images
mkdir sections
mkdir tables

Write-Output "\section{Aim \& Aparatus}`n`t$lorem" > "$loc\sections\aim&aparatus.tex"
Write-Output "\section{Theory}`n`t$lorem $lorem" > "$loc\sections\theory.tex"
Write-Output "\section{Observations}`n`t$lorem $lorem" > "$loc\sections\observations.tex"
Write-Output "\section{Calculation}`n`t$lorem $lorem" > "$loc\sections\calculation.tex"
Write-Output "\section{Error}`n`t$lorem $lorem" > "$loc\sections\error.tex"
Write-Output "\section{Conclusion}`n`t$lorem $lorem" > "$loc\sections\conclusion.tex"