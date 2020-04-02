#' CEFAGE-UE journals' ranking
#'
#' A dataset containing the ranking of scientific journals, 4th Edition
#' (2016-2019), authored and provided by the
#' \href{http://www.cefage.uevora.pt}{Center for Advanced Studies in Management
#' and Economics (CEFAGE)}, University of Évora, Portugal.
#'
#' This dataset has been obtained by parsing the original source (PDF).
#'
#' @format A data frame with 913 rows (journals) and 6 variables:
#' \describe{
#'   \item{journal}{Journal name.}
#'   \item{ISSN}{Journal's
#'   \href{https://en.wikipedia.org/wiki/International_Standard_Serial_Number}{International
#'   Standard Serial Number (ISSN)}.}
#'   \item{eISSN}{Journal's
#'   \href{https://en.wikipedia.org/wiki/International_Standard_Serial_Number#Electronic_ISSN}{electronic
#'   International Standard Serial Number (eISSN)}.}
#'   \item{publishing_press_abbr}{Journal's publishing press abbreviation. See
#'   dataset \code{\link[cjr]{publishing_presses}} for the full name of each
#'   publishing press.}
#'   \item{scientific_field_abbr}{Journal's scientific field abbreviation. See
#'   dataset \code{\link[cjr]{scientific_fields}} for the full name of each
#'   scientific discipline(s).}
#'   \item{rate}{Journal's rating according to CEFAGE. See dataset
#'   \code{\link[cjr]{rates}} for the meaning of each rate.}
#' }
#' @source \url{http://www.cefage.uevora.pt/en/content/download/5988/71181/version/1/file/RankingCEFAGE-4ed.pdf}
"journals"

#' CEFAGE-UE journals' rates
#'
#' A dataset containing the different rates used to classify each journal.
#' This rating system is by the \href{http://www.cefage.uevora.pt}{Center for
#' Advanced Studies in Management and Economics (CEFAGE)}, University of Évora,
#' Portugal.
#'
#' This dataset has been obtained by parsing the original source (PDF).
#'
#' @format A data frame with 6 rows (rates) and 2 variables:
#' \describe{
#'   \item{rate}{Rate value.}
#'   \item{description}{Rate description.}
#' }
#' @source \url{http://www.cefage.uevora.pt/en/content/download/5988/71181/version/1/file/RankingCEFAGE-4ed.pdf}
"rates"

#' Scientific fields
#'
#' A dataset containing the different scientific fields and its abbreviations.
#'
#' This dataset has been obtained by parsing the original source (PDF).
#'
#' @format A data frame with 32 rows (scientific fields) and 2 variables:
#' \describe{
#'   \item{scientific_field_abbr}{Abbreviation of scientific field(s).}
#'   \item{scientific_field}{Scientific field(s).}
#' }
#' @source \url{http://www.cefage.uevora.pt/en/content/download/5988/71181/version/1/file/RankingCEFAGE-4ed.pdf}
"scientific_fields"

#' Publishing presses
#'
#' A dataset containing the different publishing presses and its abbreviations.
#'
#' This dataset has been obtained by parsing the original source (PDF).
#'
#' @format A data frame with 34 rows (publishing presses) and 2 variables:
#' \describe{
#'   \item{publishing_press_abbr}{Abbreviation of publishing press.}
#'   \item{publishing_press}{Publishing press.}
#' }
#' @source \url{http://www.cefage.uevora.pt/en/content/download/5988/71181/version/1/file/RankingCEFAGE-4ed.pdf}
"publishing_presses"