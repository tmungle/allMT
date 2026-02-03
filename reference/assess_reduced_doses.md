# Analyze physicians' compliance to dosing guidelines: REDUCE DOSE

Evaluate number of times blood counts did not support physicians' REDUCE
DOSE decision

## Usage

``` r
assess_reduced_doses(
  input_files_path,
  anc_range = NA,
  plt_range = NA,
  hb_range = NA,
  reduction_factor
)
```

## Arguments

- input_files_path:

  path to a file or a folder with MT csv files (in quotes).

- anc_range:

  Absolute neutrophil count (ANC) range between which doses should be
  reduce. NOTE: Ensure that values are represented with same unit as of
  the input ANC data.

- plt_range:

  Platelet (PLT) range between which doses should be reduce. NOTE:
  Ensure that values are represented with same unit as of the input PLT
  data.

- hb_range:

  Hemoglobin (HB) range between which doses should be stopped. NOTE:
  Ensure that values are represented with same unit as of the input Hb
  data.

- reduction_factor:

  Percentage of 6MP starting dose (first visit dose) dose that will be
  called as "reduced" dose. Default = 50% of starting dose.

## Value

Returns a list with (1) the 'REDUCE DOSE' analysis for each patient as
listed below, (2) analysis summary as dataframe (3) analysis summary as
HTML table in viewer.

1.  Pat ID

2.  Number of decisions where the physician reduced dose (a)

3.  Number of times blood counts did not support dose reduction (b)

4.  Discordance (%) = (\\(b/a)\*100)\\

\#' @note

1.  Atleast one of the threshold parameters (anc_threshold,
    plt_threshold, hb_threshold) must be provided to carry out analysis.
    Missing threshold parameter will not be considered.

2.  If the function is used for cohort analysis then a and b will be
    represented as median and interquartile range (IQR) (25%-75%). The
    median and IQR is rounded off to upper integer value if decimal
    value is greater or equal to 0.5, else to lower integer value
    Example 1.4-\>1 and 3.75-\>4

3.  User may save the result as a list, if required, to analyze each
    patient separately - use 1st element of list. Please refer to
    examples from
    [assess_anemia](https://tmungle.github.io/allMT/reference/assess_anemia.md)

## See also

[`assess_stop_doses()`](https://tmungle.github.io/allMT/reference/assess_stop_doses.md),
[`assess_increased_doses()`](https://tmungle.github.io/allMT/reference/assess_increased_doses.md)

## Examples

``` r
pat_data <- system.file("extdata/processed_data/", "UPN_915.csv", package = "allMT")
assess_reduced_doses(input_files_path = pat_data,
                     anc_range = c(0.5,0.75), plt_range = c(50,75),
                     hb_range = c(7,8), reduction_factor = 50)
#> NOTE: Analyzing provided input file only
#> NOTE: Analysis will be carried out with provided parameters: anc_range, plt_range and hb_range
#> Quitting
#> Bye Bye: Did you know that sunset on Mars is blue :)?
#> [[1]]
#>        ID No. of 'dose reduce' decisions
#> 1 UPN_915                              1
#>   No. of times the counts did not support dose decision Discordance (%)
#> 1                                                     0              0%
#> 
#> [[2]]
#> 
#> 
#> =====================================================  =======
#> Parameter                                              Result 
#> =====================================================  =======
#> ID                                                     UPN_915
#> No. of 'dose reduce' decisions                         1      
#> No. of times the counts did not support dose decision  0      
#> Discordance (%)                                        0%     
#> =====================================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'REDUCED DOSE' analysis</td></tr>
#> <tr>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Parameter</th>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Result</th>
#> </tr>
#> </thead>
#> <tbody>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>ID</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>UPN_915</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>No. of 'dose reduce' decisions</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>1</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>No. of times the counts did not support dose decision</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>0</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: left;'>Discordance (%)</td>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: center;'>0%</td>
#> </tr>
#> </tbody>
#> </table>

# \donttest{
cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
assess_reduced_doses(input_files_path = cohort_path,
                     anc_range = c(0.5,0.75), plt_range = c(50,75),
                     hb_range = c(7,8), reduction_factor = 50)
#> NOTE: Analyzing provided input file only
#> NOTE: Analysis will be carried out with provided parameters: anc_range, plt_range and hb_range
#> Quitting
#> Bye Bye: Did you know that sunset on Mars is blue :)?
#> [[1]]
#>        ID No. of 'dose reduce' decisions
#> 1   UPN_1                              1
#> 2   UPN_2                              1
#> 3 UPN_914                              0
#> 4 UPN_915                              1
#> 5 UPN_916                              0
#> 6 UPN_917                              0
#> 7 UPN_918                              1
#>   No. of times the counts did not support dose decision Discordance (%)
#> 1                                                     1            100%
#> 2                                                     1            100%
#> 3                                                     0            NaN%
#> 4                                                     0              0%
#> 5                                                     0            NaN%
#> 6                                                     0            NaN%
#> 7                                                     1            100%
#> 
#> [[2]]
#> 
#> 
#> ======================================================  =======
#> Parameter                                               Results
#> ======================================================  =======
#> No. of patients analyzed                                7      
#> Total no. of 'REDUCED DOSE' decisions                   4      
#> Total no. of time counts did not support dose decision  3      
#> 'REDUCED DOSE' decisions: median [IQR]                  1 [0-1]
#> Counts did not support dose decision: median [IQR]      0 [0-1]
#> ======================================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'REDUCED DOSE' analysis</td></tr>
#> <tr>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Parameter</th>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Results</th>
#> </tr>
#> </thead>
#> <tbody>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; text-align: left;'>No. of patients analyzed</td>
#> <td style='width: 250px; background-color: #ffffff; text-align: center;'>7</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>Total no. of 'REDUCED DOSE' decisions</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>4</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; text-align: left;'>Total no. of time counts did not support dose decision</td>
#> <td style='width: 250px; background-color: #ffffff; text-align: center;'>3</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>'REDUCED DOSE' decisions: median [IQR]</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>1 [0-1]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>Counts did not support dose decision: median [IQR]</td>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>0 [0-1]</td>
#> </tr>
#> </tbody>
#> </table>
# }
```
