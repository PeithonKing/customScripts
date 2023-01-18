if ($args) {
	$loc = $args[0]
}else {
	$loc = Get-Location
}


$main=@"
\documentclass[reprint,amsmath,amssymb,aps]{revtex4-2}
\input{settings.tex}

\begin{document}

    \title{Title}

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

    \input{sections/aim&aparatus.tex}
    \input{sections/theory.tex}
    \input{sections/observations.tex}
    \input{sections/calculation.tex}
    \input{sections/error.tex}
    \input{sections/conclusion.tex}
    


    \bibliographystyle{apalike}
    \bibliography{ref.bib}
    \nocite{*}
\end{document}

"@

$settings=@"
% importing packages
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
\setlength{\columnsep}{0.5cm}  % column separation

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

$clean=@"
import os

# white_files = [
#    
# ]

white_ext = [
    ".py",
    ".ipynb",
    ".pdf",
    ".xlsx",
    ".csv",
    ".tex",
    ".bib",
]

l = os.listdir()


def keep(file):
    if os.path.isdir(file):
        return True
    if sum(map(lambda x: file.endswith(x), white_ext)):
        return True
    # if file in white_files:
    #     return True
    return False

n = 0
for file in l:
    if not keep(file):
        # print('Removing: ' + file)
        os.remove(file)
        n += 1

# if n == 0:
#     print('No files removed.')
# else:
#     print(f'{n} files removed.')
"@

$keepup=@"
import os
import time

files = []

for file in os.listdir():
    if file.endswith(".tex"):
        files.append(file)

for file in os.listdir("sections"):
    if file.endswith(".tex"):
        files.append("sections/"+file)

def get_file(file):
	with open(file) as f:
		return f.read()

data = {file:get_file(file) for file in files}
# data = {file:"" for file in files}

while True:
    for file in files:
        with open(file) as f:
            text = f.read()
            if data[file] != text:
                print(f"Change in {file} detected at {time.ctime()}. Compiling project... ", end="")
                # print(list(difflib.ndiff(data[file], text)))
                data[file] = text
                t0 = time.time()
                os.system("pdflatex main.tex --quiet")
                print(f"Done in {(time.time() - t0):.2f}s!")
                os.system("python clean.py")
                break
    
    time.sleep(2)
"@







Write-Output $main > "$loc\main.tex"
Write-Output $settings > "$loc\settings.tex"
Write-Output $ref > "$loc\ref.bib"
Write-Output $clean > "$loc\clean.py"
Write-Output $keepup > "$loc\keep_up.py"
mkdir images
mkdir sections
mkdir tables

Write-Output $abstract > "$loc\sections\abstract.tex"
Write-Output "\section{Aim \& Aparatus}`n`t$lorem" > "$loc\sections\aim&aparatus.tex"
Write-Output "\section{Theory}`n`t$lorem $lorem" > "$loc\sections\theory.tex"
Write-Output "\section{Observations}`n`t$lorem $lorem" > "$loc\sections\observations.tex"
Write-Output "\section{Calculation}`n`t$lorem $lorem" > "$loc\sections\calculation.tex"
Write-Output "\section{Error}`n`t$lorem $lorem" > "$loc\sections\error.tex"
Write-Output "\section{Conclusion}`n`t$lorem $lorem" > "$loc\sections\conclusion.tex"