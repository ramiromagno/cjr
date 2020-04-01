# Title: CEFAGE Journal Ranking 4th Edition (2016-2019).
# Source: CEFAGE (http://www.cefage.uevora.pt/en/scientific_resources/ranking_de_revistas_cientificas).
# Last download date: 01 April 2020.
# How to run: just source this file.
# Documentation source: R/data.R

# Output: This script generates four tibbles:
#   - rank_classes
#   - subject_areas
#   - presses
#   - journals_ranking

# All four tibbles are saved to two files each:
#   - data-raw/<dataset_tbl>.csv
#   - data/<dataset_tbl>.rda

library(here)
library(pdftools)
library(purrr)
library(tibble)
library(janitor)
library(stringr)
library(glue)
library(readr)
library(dplyr)

path <- here('data-raw')
cjr_path <- file.path(path, 'RankingCEFAGE-4ed.pdf')
cjr_txt <- pdf_text(cjr_path)

# Rank classes
tbl01_txt <- cjr_txt[[3]] %>%
  str_split('\n') %>%
  `[[`(1) %>%
  `[`(5:11) %>%
  trimws() %>%
  str_split('\\s+')

rank_classes <-
  tibble(map_chr(tbl01_txt, ~ .x[1]),
         map_chr(tbl01_txt, ~ paste(.x[-1], collapse = ' '))) %>%
  row_to_names(row_number = 1L)

# Subject Areas
tbl02_txt <- cjr_txt[[3]] %>%
  str_split('\n') %>%
  `[[`(1) %>%
  `[`(13:47) %>%
  trimws() %>%
  str_split('\\s+') %>%
  map_chr(~ paste(.x, collapse = ' '))

tbl02_txt[11] <- paste(tbl02_txt[11], tbl02_txt[12])
tbl02_txt[32] <- paste(tbl02_txt[32], tbl02_txt[33])
tbl02_txt <- tbl02_txt[-c(12, 33)]
tbl02_txt <- str_split(tbl02_txt, '\\s+')

subject_areas <-
  tibble(map_chr(tbl02_txt, ~ .x[1]),
         map_chr(tbl02_txt, ~ paste(.x[-1], collapse = ' '))) %>%
  row_to_names(row_number = 1L)

# Presses
tbl03_txt <- cjr_txt[[4]] %>%
  str_split('\n') %>%
  `[[`(1) %>%
  `[`(2:36) %>%
  trimws() %>%
  str_split('\\s+')

presses <-
  tibble(map_chr(tbl03_txt, ~ .x[1]),
         map_chr(tbl03_txt, ~ paste(.x[-1], collapse = ' '))) %>%
  row_to_names(row_number = 1L)

#
# journals ranking
#

parse_table <- function(txt_lines, col_widths,
                        colnames = c('Journal', 'ISSN', 'eISSN', 'Press', 'Area', 'Rate')) {

  start <- cumsum(c(1, col_widths[-length(col_widths)] + 1))
  end <- cumsum(col_widths + 1)

  map(txt_lines, ~ str_sub(.x, start = start, end = end)) %>%
    map(~ matrix(.x, nrow = 1, byrow = TRUE)) %>%
    unlist() %>%
    matrix(ncol = length(col_widths), byrow = TRUE) %>%
    `colnames<-`(colnames)
}

tbl04_txt <- cjr_txt[5:38] %>%
  map(~ str_split(.x, '\n'))

pg01 <- parse_table(tbl04_txt[[1]][[1]], col_widths = c(53, 9, 9, 9, 11, 4)) %>%
  `[`(-c(1, 2, 55, 56), )

pg02 <- parse_table(tbl04_txt[[2]][[1]], col_widths =  c(57, 9, 9, 9, 11, 4)) %>%
  `[`(-c(1, 57, 58), )

pg03 <- parse_table(tbl04_txt[[3]][[1]], col_widths =  c(65, 9, 9, 9, 11, 4)) %>%
  `[`(-c(1, 60, 61), )

pg04 <- parse_table(tbl04_txt[[4]][[1]], col_widths = c(61, 9, 9, 9, 11, 4)) %>%
  `[`(-c(1, 61, 62), )

pg05 <- parse_table(tbl04_txt[[5]][[1]], col_widths = c(51, 9, 9, 9, 9, 4)) %>%
  `[`(-c(1, 57, 58), )

pg06 <- parse_table(tbl04_txt[[6]][[1]], col_widths = c(60, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 60, 61), )

pg07 <- parse_table(tbl04_txt[[7]][[1]], col_widths =  c(55, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 60, 61), )

pg08 <- parse_table(tbl04_txt[[8]][[1]], col_widths =  c(60, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 61, 62), )

pg09 <- parse_table(tbl04_txt[[9]][[1]], col_widths =  c(61, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 60, 61), )

pg10 <- parse_table(tbl04_txt[[10]][[1]], col_widths =  c(50, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 57, 58), )

pg11 <- parse_table(tbl04_txt[[11]][[1]], col_widths =  c(51, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 57, 58), )

pg12 <- parse_table(tbl04_txt[[12]][[1]], col_widths =  c(59, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 59, 60), )

pg13 <- parse_table(tbl04_txt[[13]][[1]], col_widths =  c(58, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 60, 61), )

pg14 <- parse_table(tbl04_txt[[14]][[1]], col_widths =  c(62, 9, 9, 12, 10, 4)) %>%
  `[`(-c(1, 59, 60), )

pg15 <- parse_table(tbl04_txt[[15]][[1]], col_widths =  c(59, 9, 9, 12, 9, 4)) %>%
  `[`(-c(1, 60, 61), )

pg16 <- parse_table(tbl04_txt[[16]][[1]], col_widths = c(59, 9, 9, 9, 9, 4)) %>%
  `[`(-c(1, 59, 60), )

pg17 <- parse_table(tbl04_txt[[17]][[1]], col_widths = c(62, 9, 9, 9, 10, 4)) %>%
  `[`(-c(1, 52, 53), )

tbl04 <-
  rbind(
    pg01,
    pg02,
    pg03,
    pg04,
    pg05,
    pg06,
    pg07,
    pg08,
    pg09,
    pg10,
    pg11,
    pg12,
    pg13,
    pg14,
    pg15,
    pg16,
    pg17)

tbl04[str_detect(tbl04, pattern = '^\\s*$')] <- NA_character_

tbl04_1 <- tbl04
i <- 1
while (i <= nrow(tbl04_1) - 2L) {

  if (!is.na(tbl04_1[i, 1]) && all(is.na(tbl04_1[i, -1])) &&
      is.na(tbl04_1[i + 1, 1]) && any(!is.na(tbl04_1[i + 1, -1])) &&
      !is.na(tbl04_1[i + 2, 1]) && all(is.na(tbl04_1[i + 2, -1]))
  ) {

    tbl04_1[i, 1] <- glue('{tbl04_1[i, 1]} {tbl04_1[i + 2, 1]}')
    tbl04_1[i, -1] <- tbl04_1[i + 1, -1]

    tbl04_1[i + c(1, 2), ] <- NA_character_

    i <- i + 3
    next()
  }

  i <- i + 1
}

journals_ranking <- as_tibble(tbl04_1) %>%
  remove_empty("rows") %>%
  mutate_all(trimws) %>%
  mutate(Rate = factor(Rate, levels = c('D', 'C', 'B', 'A', 'AA', 'AAA'), ordered = TRUE))


#
# Exported data
#

# Rank classes
readr::write_csv(rank_classes, file.path(path, 'rank_classes.csv'))
usethis::use_data(rank_classes, compress = "xz", overwrite = TRUE, version = 2)

# Subject Areas
readr::write_csv(subject_areas, file.path(path, 'subject_areas.csv'))
usethis::use_data(subject_areas, compress = "xz", overwrite = TRUE, version = 2)

# presses
readr::write_csv(presses, file.path(path, 'presses.csv'))
usethis::use_data(presses, compress = "xz", overwrite = TRUE, version = 2)

# journals_ranking
readr::write_csv(journals_ranking, file.path(path, 'journals_ranking.csv'))
usethis::use_data(journals_ranking, compress = "xz", overwrite = TRUE, version = 2)















