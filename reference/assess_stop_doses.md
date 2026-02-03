# Analyze physicians' compliance to dosing guidelines: STOP DOSE

Evaluate number of times blood counts did not support physicians' STOP
DOSE decision

## Usage

``` r
assess_stop_doses(
  input_files_path,
  anc_threshold = NA,
  plt_threshold = NA,
  hb_threshold = NA
)
```

## Arguments

- input_files_path:

  path to a file or a folder with MT csv files (in quotes).

- anc_threshold:

  Absolute neutrophil count (ANC) value threshold below which doses
  should be stopped. NOTE: Ensure that the threshold value is
  represented with same unit as of the input ANC data.

- plt_threshold:

  Platelet (PLT) value threshold below which doses should be stopped.
  NOTE: Ensure that the threshold value is represented with same unit as
  of the input PLT data.

- hb_threshold:

  Hemoglobin (HB) value threshold below which doses should be stopped.
  NOTE: Ensure that the threshold value is represented with same unit as
  of the input Hb data.

## Value

Returns a list with (1) the 'STOP DOSE' analysis for each patient as
listed below, (2) analysis summary as dataframe (3) analysis summary as
HTML table in viewer.

1.  Pat ID

2.  Number of decisions where the physician stopped dose (a)

3.  Number of times blood counts did not support dose suspension (b)

4.  Discordance (%) = (\\(b/a)\*100)\\

## Note

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

[`assess_reduced_doses()`](https://tmungle.github.io/allMT/reference/assess_reduced_doses.md),
[`assess_increased_doses()`](https://tmungle.github.io/allMT/reference/assess_increased_doses.md)

## Examples

``` r
pat_data <- system.file("extdata/processed_data/", "UPN_915.csv", package = "allMT")
assess_stop_doses(input_files_path = pat_data,
                  anc_threshold = 0.5, plt_threshold = 50, hb_threshold = 7)
#> NOTE: Analyzing provided input file only
#> NOTE: Analysis will be carried out with provided parameters: anc_threshold, plt_threshold and hb_threshold
#> Quitting
#> Bye Bye: Did you know that Earth is 3rd planet from sun :)?
#> [[1]]
#>        ID No. of 'dose stop' decisions
#> 1 UPN_915                            7
#>   No. of times the counts did not support dose decision Discordance (%)
#> 1                                                     3          42.86%
#> 
#> [[2]]
#> 
#> 
#> =====================================================  =======
#> Parameter                                              Result 
#> =====================================================  =======
#> ID                                                     UPN_915
#> No. of 'dose stop' decisions                           7      
#> No. of times the counts did not support dose decision  3      
#> Discordance (%)                                        42.86% 
#> =====================================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'STOP DOSE' analysis</td></tr>
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
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>No. of 'dose stop' decisions</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>7</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>No. of times the counts did not support dose decision</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>3</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: left;'>Discordance (%)</td>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: center;'>42.86%</td>
#> </tr>
#> </tbody>
#> </table>

# \donttest{
assess_stop_doses(input_files_path = pat_data,
                  anc_threshold = 0.5)
#> NOTE: Analyzing provided input file only
#> NOTE: Analysis will be carried out with provided parameter: anc_threshold
#> Quitting
#> Bye Bye: Did you know that Earth is 3rd planet from sun :)?
#> [[1]]
#>        ID No. of 'dose stop' decisions
#> 1 UPN_915                            7
#>   No. of times the counts did not support dose decision Discordance (%)
#> 1                                                     5          71.43%
#> 
#> [[2]]
#> 
#> 
#> =====================================================  =======
#> Parameter                                              Result 
#> =====================================================  =======
#> ID                                                     UPN_915
#> No. of 'dose stop' decisions                           7      
#> No. of times the counts did not support dose decision  5      
#> Discordance (%)                                        71.43% 
#> =====================================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'STOP DOSE' analysis</td></tr>
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
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>No. of 'dose stop' decisions</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>7</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>No. of times the counts did not support dose decision</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>5</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: left;'>Discordance (%)</td>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: center;'>71.43%</td>
#> </tr>
#> </tbody>
#> </table>

cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
assess_stop_doses(input_files_path = cohort_path,
                  anc_threshold = 0.5,plt_threshold = 50, hb_threshold = 7)
#> NOTE: Including all files in input folder
#> NOTE: Analysis will be carried out with provided parameters: anc_threshold, plt_threshold and hb_threshold
#> Quitting
#> Bye Bye: Did you know that Earth is 3rd planet from sun :)?
#> [[1]]
#>        ID No. of 'dose stop' decisions
#> 1   UPN_1                            4
#> 2   UPN_2                            4
#> 3 UPN_914                            3
#> 4 UPN_915                            7
#> 5 UPN_916                            6
#> 6 UPN_917                            6
#> 7 UPN_918                            4
#>   No. of times the counts did not support dose decision Discordance (%)
#> 1                                                     4            100%
#> 2                                                     4            100%
#> 3                                                     1          33.33%
#> 4                                                     3          42.86%
#> 5                                                     2          33.33%
#> 6                                                     2          33.33%
#> 7                                                     4            100%
#> 
#> [[2]]
#> 
#> 
#> ======================================================  =======
#> Parameter                                               Results
#> ======================================================  =======
#> No. of patients analyzed                                7      
#> Total no. of 'STOP DOSE' decisions                      34     
#> Total no. of time counts did not support dose decision  20     
#> 'STOP DOSE' decisions: median [IQR]                     4 [4-6]
#> Counts did not support dose decision: median [IQR]      3 [2-4]
#> ======================================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'STOP DOSE' analysis</td></tr>
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
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>Total no. of 'STOP DOSE' decisions</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>34</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; text-align: left;'>Total no. of time counts did not support dose decision</td>
#> <td style='width: 250px; background-color: #ffffff; text-align: center;'>20</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>'STOP DOSE' decisions: median [IQR]</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>4 [4-6]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>Counts did not support dose decision: median [IQR]</td>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>3 [2-4]</td>
#> </tr>
#> </tbody>
#> </table>
# }
```
