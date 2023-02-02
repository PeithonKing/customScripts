if ($args) {
	$loc = $args[0]
}else {
	$loc = Get-Location
}


$main=@"
\documentclass[reprint,amsmath,amssymb,aps]{revtex4-2}

\input{settings.tex}

\begin{document}

    \title{Title of the experiment}

    \author{Aritra Mukhopadhyay}
    \affiliation{
        National Institute of Science Education and Research\\
        Bhubaneswar, Odisha 751005, India\\
        3rd year, Integrated M.Sc. Physics\\
        Roll No.: 2011030
    }
    \date{\today}

    \input{sections/abstract.tex}
    \maketitle

    \input{sections/theory.tex}
    % \input{sections/observations.tex}
    % \input{sections/calculation.tex}
    % \input{sections/error.tex}
    % \input{sections/conclusion.tex}
    

    % \bibliographystyle{apalike}
    \bibliography{ref.bib}
    \nocite{*}
\end{document}
"@

$settings=@"
% % % importing packages
% \usepackage{multicol}  % multiple columns
% \usepackage[utf8]{inputenc}  % input encoding
% % \usepackage{multirow} 		% for tables
% % \usepackage[italicdiff]{physics}  % physics
% % \usepackage{longtable}
% \usepackage{float}  % floating figures
\usepackage{gensymb}  % math symbols
\usepackage{indentfirst}  % indent first line of paragraph
\usepackage{fancyvrb}  % verbatim
\usepackage{mathtools}  % math
\usepackage{xfrac}   % fractions
\usepackage[center]{caption}  % centering captions
\usepackage{amsmath}  		% for math symbols
\usepackage{physics} 		% for physics symbols
\usepackage{amssymb} 		% for math symbols
\usepackage{hyperref}  		% for hyperlinks
\usepackage{graphicx}  % adding pictures
\usepackage{dcolumn}
\usepackage{bm}


% defining new commands
\newcommand{\angstrom}{\textup{\AA}}  % angstrom
\DeclareMathOperator{\taninv}{tan^{-1}}
% \DeclareUnicodeCharacter{2212}{-}
\setlength{\columnsep}{0.5cm}  % column separation

% defining graphics path
% \graphicspath{ {./images/} }

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

$abstract=@"
\begin{abstract}
Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit mollitia illo reiciendis, nam at blanditiis dolore repellat. Placeat nisi, neque odio, debitis et possimus quo obcaecati totam cupiditate omnis culpa labore aut dolor! Ratione minima optio excepturi architecto itaque sint perspiciatis quos, molestiae nobis, porro cumque dolorem harum necessitatibus temporibus!
	\begin{description}
		\item[Lorem] Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit mollitia illo reiciendis, nam at blanditiis dolore repellat. Placeat nisi, neque odio, debitis et possimus quo obcaecati totam cupiditate omnis culpa labore aut dolor! Ratione minima optio excepturi architecto itaque sint perspiciatis quos, molestiae nobis, porro cumque dolorem harum necessitatibus temporibus!
		\item[Ipsum Dolor] Lorem ipsum dolor, sit amet consectetur adipisicing elit. Impedit mollitia illo reiciendis, nam at blanditiis dolore repellat. Placeat nisi, neque odio, debitis et possimus quo obcaecati totam cupiditate omnis culpa labore aut dolor! Ratione minima optio excepturi architecto itaque sint perspiciatis quos, molestiae nobis, porro cumque dolorem harum necessitatibus temporibus!
	\end{description}
\end{abstract}
"@



Write-Output $main > "$loc\main.tex"
Write-Output $settings > "$loc\settings.tex"
Write-Output $ref > "$loc\ref.bib"
mkdir images
mkdir sections
mkdir tables



Write-Output $abstract > "$loc\sections\abstract.tex"

# \input{sections/theory.tex}
Write-Output "\section{Theory}`n`t$lorem $lorem" > "$loc\sections\theory.tex"
# \input{sections/observations.tex}
Write-Output "\section{Observations}`n`t$lorem $lorem" > "$loc\sections\observations.tex"
Write-Output "\section{Calculation}`n`t$lorem $lorem" > "$loc\sections\calculation.tex"
# \input{sections/error.tex}
Write-Output "\section{Error}`n`t$lorem $lorem" > "$loc\sections\error.tex"
# \input{sections/conclusion.tex}
Write-Output "\section{Conclusion}`n`t$lorem $lorem" > "$loc\sections\conclusion.tex"

