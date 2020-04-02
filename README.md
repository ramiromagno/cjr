
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cjr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/ramiromagno/cjr.svg?branch=master)](https://travis-ci.org/ramiromagno/cjr)
<!-- badges: end -->

cjr (CEFAGE-UE Journal Ranking) is an R data package that provides
[CEFAGE](http://www.cefage.uevora.pt)’s journal ranking. CEFAGE-UE
stands for *Center for Advanced Studies in Management and Economics*, a
research centre from the University of Évora, Portugal.

This package contains four datasets:

  - `journals`: CEFAGE-UE journals’ ranking
  - `rates`: CEFAGE-UE journals’ rate categories
  - `scientific_fields`: Journals’ scientific fields
  - `publishing_presses`: Journals’ publishing presses

## Installation

You can install cjr with:

``` r
# Install the development version from GitHub
devtools::install_github("ramiromagno/cjr")
```

## Data source

The datasets here provided are for the 4th edition (2016-2019):
<http://www.cefage.uevora.pt/en/scientific_resources/ranking_de_revistas_cientificas>.

## Usage

### CEFAGE-UE ranking of journals

The main dataset, i.e., `journals`, contains the ranking of 903 journals
in the field of Economics, Management, and other social sciences, for
the period of 2016 thru 2019:

``` r
library(cjr)
journals
#> # A tibble: 913 x 6
#>    journal            ISSN    eISSN  publishing_press_… scientific_field_… rate 
#>    <chr>              <chr>   <chr>  <chr>              <chr>              <ord>
#>  1 Academy of Manage… 0363-7… 1930-… AOM                GenMan             AAA  
#>  2 Administrative Sc… 0001-8… <NA>   Sage               GenMan             AAA  
#>  3 American Economic… 0002-8… 1944-… AEA                GenEcon            AAA  
#>  4 Econometrica       0012-9… 1468-… Wiley              GenEcon            AAA  
#>  5 Journal of Finance 0022-1… 1540-… Wiley              Fin                AAA  
#>  6 Journal of Politi… 0022-3… 1537-… Chicago            GenEcon            AAA  
#>  7 Quarterly Journal… 0033-5… 1531-… Oxford             GenEcon            AAA  
#>  8 Review of Economi… 0034-6… 1467-… Wiley              GenEcon            AAA  
#>  9 Academy of Manage… 0001-4… 1948-… AOM                GenMan             AA   
#> 10 Accounting Review  0001-4… 1558-… AAA                AccAud             AA   
#> # … with 903 more rows
```

Sort journals by rate within scientific domain:

``` r
library(dplyr)
arrange(journals, scientific_field_abbr, desc(rate))
#> # A tibble: 913 x 6
#>    journal               ISSN   eISSN  publishing_press… scientific_field… rate 
#>    <chr>                 <chr>  <chr>  <chr>             <chr>             <ord>
#>  1 Accounting Review     0001-… 1558-… AAA               AccAud            AA   
#>  2 Journal of Accountin… 0165-… <NA>   Elsevier          AccAud            AA   
#>  3 Journal of Accountin… 0021-… 1475-… Wiley             AccAud            AA   
#>  4 Accounting, Organiza… 0361-… <NA>   Elsevier          AccAud            A    
#>  5 Contemporary Account… 0823-… 1911-… Wiley             AccAud            A    
#>  6 Review of Accounting… 1380-… 1573-… Springer          AccAud            A    
#>  7 ABACUS - A Journal o… 0001-… 1467-… Wiley             AccAud            C    
#>  8 Accounting and Busin… 0001-… 2159-… Taylor            AccAud            C    
#>  9 Accounting Horizons   0888-… 1558-… AAA               AccAud            C    
#> 10 Auditing - A Journal… 0278-… 1558-… AAA               AccAud            C    
#> # … with 903 more rows
```

### Rates

The rates defined by CEFAGE-UE to rank journals are listed in `rates`:

``` r
rates
#> # A tibble: 6 x 2
#>   rate  description                                                             
#>   <chr> <chr>                                                                   
#> 1 AAA   Top general Economics or Management journal                             
#> 2 AA    Top field journal or excellent general Economics or Management journal  
#> 3 A     Excellent field journal or very good general Economics or Management jo…
#> 4 B     Very good international peer-review journal                             
#> 5 C     Good international peer-review journal                                  
#> 6 D     Other well-known international peer-review journal
```

### Journals’ scientific fields

Journals’ scientific domains abbreviations used in `journals` are
provided in `scientific_fields`:

``` r
scientific_fields
#> # A tibble: 32 x 2
#>    scientific_field_ab… scientific_field                                        
#>    <chr>                <chr>                                                   
#>  1 AccAud               Accounting, Auditing                                    
#>  2 AgrEnvEn             Agricultural, Environmental and Energy Economics        
#>  3 DevTrans             Development and Transition Economics                    
#>  4 EconStat             Econometrics, Applied Statistics                        
#>  5 Fin                  General Finance, Financial Economics, Corporate Finance…
#>  6 GenEcon              General Economics                                       
#>  7 GenMan               General Management                                      
#>  8 Health               Health Economics, Management and Policy                 
#>  9 History              History of Economic Thought, Business and Economic Hist…
#> 10 HRM                  Human Resource Management, Industrial Relations, Manage…
#> # … with 22 more rows
```

### Journals’ publishing presses

Journals’ publishing presses abbreviations used in `journals` are
provided in `publishing_presses`:

``` r
publishing_presses
#> # A tibble: 34 x 2
#>    publishing_press_abbr publishing_press                   
#>    <chr>                 <chr>                              
#>  1 AAA                   American Accounting Association    
#>  2 ACM                   Association for Computing Machinery
#>  3 AEA                   American Economic Association      
#>  4 AIS                   Association for Information Systems
#>  5 AMA                   American Marketing Association     
#>  6 AOM                   Academy of Management              
#>  7 APA                   American Psychological Association 
#>  8 AR                    Annual Reviews                     
#>  9 ASCE                  American Society of Civil Engineers
#> 10 Boeck                 De Boeck Supérior                  
#> # … with 24 more rows
```
