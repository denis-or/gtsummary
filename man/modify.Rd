% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modify.R
\name{modify}
\alias{modify}
\alias{modify_header}
\alias{modify_footnote}
\alias{modify_spanning_header}
\alias{show_header_names}
\title{Modify column headers, footnotes, and spanning headers}
\usage{
modify_header(
  x,
  update = NULL,
  stat_by = NULL,
  text_interpret = c("md", "html"),
  ...
)

modify_footnote(x, update, abbreviation = FALSE)

modify_spanning_header(x, update)

show_header_names(x = NULL)
}
\arguments{
\item{x}{a gtsummary object}

\item{update}{list of formulas or a single formula specifying the updated
column header, footnote, or spanning header.
The LHS specifies the column(s) to be updated, and the RHS is the updated text.
Use the \code{show_header_names()} to see the column names that can be modified.}

\item{stat_by}{Used with \code{tbl_summary(by=)} objects with a \verb{by=} argument.
String specifying text to include above the summary statistics.
The following fields are available for use in the
headers:
\itemize{
\item \code{{n}} number of observations in each group,
\item \code{{N}} total number of observations,
\item \code{{p}} percentage in each group,
\item \code{{level}} the 'by' variable level,
}

Syntax follows \code{\link[glue:glue]{glue::glue()}},
e.g. \code{stat_by = "**{level}**, N = {n} ({style_percent(p)}\%)"}.}

\item{text_interpret}{String indicates whether text will be interpreted with
\code{\link[gt:md]{gt::md()}} or \code{\link[gt:html]{gt::html()}}. Must be \code{"md"} (default) or \code{"html"}.}

\item{...}{Specify a column and updated column label,
e.g. \code{modify_header(p.value = "Model P-values")}. This is provided as an alternative to the
\verb{update=} argument. They accomplish the same goal of updating column headers.}

\item{abbreviation}{Logical indicating if an abbreviation is being updated.}
}
\value{
Updated gtsummary object
}
\description{
These functions assist with updating or adding column headers
(\code{modify_header()}), footnotes (\code{modify_footnote()}), and spanning
headers (\code{modify_spanning_header()}). Use \code{show_header_names()} to learn
the column names.
}
\section{Example Output}{

\if{html}{Example 1}

\if{html}{\figure{modify_ex1.png}{options: width=45\%}}

\if{html}{Example 2}

\if{html}{\figure{modify_ex2.png}{options: width=45\%}}

\if{html}{Example 3}

\if{html}{\figure{modify_ex3.png}{options: width=35\%}}
}

\examples{
# create summary table
tbl <- trial[c("age", "grade", "trt")] \%>\%
  tbl_summary(by = trt, missing = "no") \%>\%
  add_p()

# print the column names that can be modified
show_header_names(tbl)

# Example 1 ----------------------------------
# updating column headers and footnote
modify_ex1 <- tbl \%>\%
  modify_header(
    update = list(label ~ "**Variable**",
                  p.value ~ "**P**")
  ) \%>\%
  modify_footnote(
    update = starts_with("stat_") ~ "median (IQR) for Age; n (\%) for Grade"
  )

# Example 2 ----------------------------------
# using `stat_by=` argument to update headers, remove all footnotes, add spanning header
modify_ex2 <- tbl \%>\%
  modify_header(stat_by = "**{level}**, N = {n} ({style_percent(p)}\%)") \%>\%
  # use `modify_footnote(everything() ~ NA, abbreviation = TRUE)` to delete abbrev. footnotes
  modify_footnote(update = everything() ~ NA) \%>\%
  modify_spanning_header(starts_with("stat_") ~ "**Treatment Received**")

# Example 3 ----------------------------------
# updating an abbreviation in table footnote
modify_ex3 <-
  glm(response ~ age + grade, trial, family = binomial) \%>\%
  tbl_regression(exponentiate = TRUE) \%>\%
  modify_footnote(ci ~ "CI = Credible Interval", abbreviation = TRUE)

}
\seealso{
Other tbl_summary tools: 
\code{\link{add_n}()},
\code{\link{add_overall}()},
\code{\link{add_p.tbl_summary}()},
\code{\link{add_q}()},
\code{\link{add_stat_label}()},
\code{\link{bold_italicize_labels_levels}},
\code{\link{inline_text.tbl_summary}()},
\code{\link{inline_text.tbl_survfit}()},
\code{\link{tbl_merge}()},
\code{\link{tbl_stack}()},
\code{\link{tbl_summary}()}

Other tbl_regression tools: 
\code{\link{add_global_p.tbl_regression}()},
\code{\link{add_nevent.tbl_regression}()},
\code{\link{add_q}()},
\code{\link{bold_italicize_labels_levels}},
\code{\link{combine_terms}()},
\code{\link{inline_text.tbl_regression}()},
\code{\link{tbl_merge}()},
\code{\link{tbl_regression}()},
\code{\link{tbl_stack}()}

Other tbl_uvregression tools: 
\code{\link{add_global_p.tbl_uvregression}()},
\code{\link{add_nevent.tbl_uvregression}()},
\code{\link{add_q}()},
\code{\link{bold_italicize_labels_levels}},
\code{\link{inline_text.tbl_uvregression}()},
\code{\link{tbl_merge}()},
\code{\link{tbl_stack}()},
\code{\link{tbl_uvregression}()}
}
\author{
Daniel D. Sjoberg
}
\concept{tbl_regression tools}
\concept{tbl_summary tools}
\concept{tbl_uvregression tools}
