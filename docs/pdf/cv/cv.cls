\ProvidesClass{cv}[Silvia's CV LaTeX class]
\LoadClass[a4paper, 10pt]{article}

%%%% INCLUDES

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{expl3}
\usepackage{mhchem}

\usepackage{xcolor}
% \usepackage{mathptmx}
\usepackage[]{multibib}
% \usepackage{hyperref}
\usepackage{url}
\usepackage{libertine}

\definecolor{color1}{HTML}{001F3F}
\definecolor{color2}{HTML}{8A360F}
\definecolor{color3}{HTML}{DAA520}
% \definecolor{color4}{HTML}{984ea3}
% \definecolor{color5}{HTML}{ff7f00}

\usepackage[mathletters]{ucs}
\usepackage[utf8x]{inputenc}
% chemical formulas

\newcommand{\bold}[1]{\textcolor{color1}{\textbf{#1}}}
\newcommand{\boldtwo}[1]{\textcolor{color2}{\textbf{#1}}}

%\renewcommand{\familydefault}{\libertine}
\usepackage[left=0.75in,top=1in,right=0.75in,bottom=1in]{geometry} % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{turquoise}{cmyk}{0.65,0,0.1,0.3}
\definecolor{purple}{rgb}{0.65,0,0.65}
\definecolor{dark_green}{rgb}{0, 0.7, 0}
\definecolor{orange}{rgb}{0.8, 0.6, 0.2}
\definecolor{red}{rgb}{0.8, 0.2, 0.2}
\definecolor{darkred}{rgb}{0.6, 0.1, 0.05}
\definecolor{blueish}{rgb}{0.0, 0.3, .6}
\definecolor{light_gray}{rgb}{0.7, 0.7, .7}
\definecolor{pink}{rgb}{1, 0, 1}
\definecolor{greyblue}{rgb}{0.25, 0.25, 1}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{subcaption}
\usepackage{wrapfig}
\usepackage[draft]{graphicx}
\usepackage{changepage}


\usepackage{listings}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Line widths and font sizes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{layouts}
\makeatletter 
% \layoutdetails will insert a table listing the layout sizes and fonts in use
\newcommand{\layoutdetails}{%
\begin{tabular}{ll}
 \texttt{\textbackslash{textwidth}} & \printinunitsof{in}\prntlen{\textwidth} \\
\texttt{\textbackslash{linewidth}} & \printinunitsof{in}\prntlen{\linewidth} \\
Main text font &  \f@size pt \f@family \\
\sffamily \small Caption text font &  \sffamily \small \f@size pt \f@family \\
\end{tabular}%
}
\makeatother 




%%%%% FORMATTING
\usepackage{linegoal}% http://ctan.org/pkg/linegoal
\usepackage{xparse}% http://ctan.org/pkg/xparse
\NewDocumentCommand{\centerrule}{O{0.5ex} O{0.4pt}}{%
  \leavevmode\rule[#1]{\linegoal}{#2}%
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section



\usepackage{needspace}

\newcommand{\cvsectiontitle}[1]{%
\needspace{3\baselineskip} % Ensures there's space for at least 3 lines (can adjust as needed)
\sectionskip
  { \color{color1} \Large{  \bf #1}\qquad \centerrule} % Section title
  \smallskip

%   \sectionlineskip
\vspace{-0.4cm}
}

% General cv items
\newcommand{\basiccvitem}[5]{
    {\bf #1} \hfill {\em \small #2} \\ 
    {\small#3 } \\
    {\em \small #4}
    
    % \smallskip
    \vspace{-0.5cm}
}

\newcommand{\basicaward}[5]{
    {\bf #1} \hfill {\em \small #2} \\ 
    {\small#3 } \,|\, {\em \small #4} \\
    % {\em \small #5}
    % check if #5 is empty
    \ifx&#5& 
    \else
        {\em \small #5}\\
        % \vspace{0.5cm}
    \fi
    
    % \smallskip
    \vspace{-0.5cm}
}

\newcommand{\basicpublication}[3]{
    {\bf #1} \\ %title and year
    {\small#2} \\ % authors
    {\small \it #3} % venue

}

\newcommand{\tinycvitem}[4]{
  {\bf #1} \hfill {\em \small #2} \\
  \ifx&#4& % Check if #4 is empty
    {\small #3}
  \else
    {\small #3 } \,|\, {\it \small #4}
  \fi

}

\newcommand{\cvitemtiny}[2]{
    {\bf #1} \hfill {\em \small #2} \\

    \vspace{-0.5cm}
}



% For general categories
\newcommand{\awards}[5]{ % #1: name, #2: agency, #3: amount, #4: dates, #5: description
\basicaward{#1}{#4}{#2}{#3}{#5}
}
\newcommand{\academicservice}[4]{ % #1: name, #2: position, #3: dates, #4: description
\basiccvitem{#1}{#3}{#2}{#4}{}
}
\newcommand{\departmentalservice}[4]{ % #1: name, #2: position, #3: dates, #4: description
\basiccvitem{#1}{#3}{#2}{#4}{}
}
\newcommand{\education}[4]{ % #1: institution, #2: degree, #3: dates, #4: description
\tinycvitem{#1}{#3}{#2}{#4}
}
\newcommand{\experience}[5]{ % #1: institution, #2: position, #3: dates, #4: supervisor, #5: description
\tinycvitem{#1}{#3}{#2}{#4}
}
\newcommand{\mentoring}[4]{ % #1: name, #2: position, #3: dates, #4: description
\basiccvitem{#1}{#3}{#2}{#4}{}
}
\newcommand{\teaching}[4]{ % #1: name, #2: position, #3: dates, #4: description
\basiccvitem{#1}{#3}{#2}{#4}{}
}
\newcommand{\news}[3]{ % #1: name, #2: dates, #3: description
\tinycvitem{#1}{#2}{#3}{}
}
\newcommand{\organizing}[4]{ % #1: name, #2: position, #3: dates, #4: description
\basiccvitem{#1}{#3}{#2}{#4}{}
}
\newcommand{\refereeservice}[2]{ % #1: name, #2: dates
\cvitemtiny{#1}{#2}
}
\newcommand{\volunteering}[4]{ % #1: name, #2: position, #3: dates, #4: description
\basiccvitem{#1}{#3}{#2}{#4}{}
}
\newcommand{\patents}[3]{ % #1: name, #2: authors, #3: description
\basicpublication{#1}{#2}{#3}
}
\newcommand{\publications}[4]{ % #1: name, #2: authors, #3: venue, #4: description
\basicpublication{#1}{#2}{#3}
}
\newcommand{\software}[3]{ % #1: name, #2: authors, #3: description
\basicpublication{#1}{#2}{#3}
}
\newcommand{\otherpublications}[4]{ % #1: name, #2: authors, #3: venue, #4: description
\basicpublication{#1}{#2}{#3}
}

% For talks
\newcommand{\talktitle}[1]{ % #1: name
\vspace{-0.4cm}

    {\bf #1}\\ %title and year
}
\newcommand{\talkvenue}[4]{ % #1: venue, #2: description, #3: where, #4: when
\noindent {\small #1} \,|\, {\em \small #2} \hfill {\small #3} \,|\, {\em \small #4} \\
% 
% \vspace{-0.5cm}
}

% For feedback
\newcommand{\feedbacktitle}[3]{ % #1: name, #2: date, #3: description
\tinycvitem{#1}{#2}{#3}{}
}
\newcommand{\feedbackitem}[1]{  % #1: text
\begin{adjustwidth}{30pt}{30pt}
  \it \small #1
\end{adjustwidth}

}
