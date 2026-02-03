# Analyze physicians' compliance to dosing guidelines: INCREASE DOSE

Evaluate number of times blood counts did not support physicians'
INCREASE DOSE decision

## Usage

``` r
assess_increased_doses(
  input_files_path,
  anc_threshold = NA,
  plt_threshold = NA,
  hb_threshold = NA,
  escalation_factor,
  tolerated_dose_duration
)
```

## Arguments

- input_files_path:

  path to a file or a folder with MT csv files (in quotes).

- anc_threshold:

  Absolute neutrophil count (ANC) value threshold above which doses
  should be increased. NOTE: Ensure that the threshold value is
  represented with same unit as of the input ANC data.

- plt_threshold:

  Platelet (PLT) value threshold above which doses should be increased.
  NOTE: Ensure that the threshold value is represented with same unit as
  of the input PLT data.

- hb_threshold:

  Hemoglobin (HB) value threshold below which doses should be increased.
  NOTE: Ensure that the threshold value is represented with same unit as
  of the input Hb data.

- escalation_factor:

  Percentage of increase from previous tolerated dose to be considered
  as "increased" dose.

- tolerated_dose_duration:

  Number of weeks with ANC, PLT, and Hb values consistently above
  threshold with same dose prescription, following which dose should be
  increased.

## Value

Returns a list with (1) the 'INCREASE DOSE' analysis for each patient as
listed below, (2) analysis summary as dataframe (3) analysis summary as
HTML table in viewer.

1.  Pat ID

2.  Number of decisions where the physician increased dose (a)

3.  Number of times blood counts did not support dose suspension (b)

4.  Discordance (%) = (\\1 - (b/a)\*100)\\

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

[`time_to_first_dose_increase()`](https://tmungle.github.io/allMT/reference/time_to_first_dose_increase.md),
[`assess_reduced_doses()`](https://tmungle.github.io/allMT/reference/assess_reduced_doses.md),
[`assess_stop_doses()`](https://tmungle.github.io/allMT/reference/assess_stop_doses.md)

## Examples

``` r
cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
assess_increased_doses(input_files_path = cohort_path, anc_threshold = 0.75,
                      plt_threshold = 75, hb_threshold = 8,
                      escalation_factor = 25, tolerated_dose_duration = 8)
#> NOTE: Including all files in input folder
#> NOTE: Analysis will be carried out with provided parameters: anc_threshold, plt_threshold and hb_threshold
#> Quitting
#> Bye Bye: Did you know that 1 million Earths can fit into the sun :)?
#> [[1]]
#>        ID Total no. of times counts recommended a dose increase
#> 1   UPN_1                                                     5
#> 2   UPN_2                                                    10
#> 3 UPN_914                                                    10
#> 4 UPN_915                                                    11
#> 5 UPN_916                                                    11
#> 6 UPN_917                                                    12
#> 7 UPN_918                                                    17
#>   Total no. of 'DOSE INCREASE' decisions Discordance (%)
#> 1                                      0            100%
#> 2                                      0            100%
#> 3                                      0            100%
#> 4                                      0            100%
#> 5                                      0            100%
#> 6                                      0            100%
#> 7                                      0            100%
#> 
#> [[2]]
#> 
#> 
#> =====================================================  ==========
#> Parameter                                              Results   
#> =====================================================  ==========
#> No. of patients analyzed                               7         
#> Total no. of times counts recommended a dose increase  76        
#> Total no. of 'DOSE INCREASE' decisions                 0         
#> Recommended 'INCREASE DOSE' decisions: median [IQR]    11 [10-12]
#> No. of 'INCREASE DOSE' decisions: median [IQR]         0 [0-0]   
#> =====================================================  ==========
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'INCREASE DOSE' analysis</td></tr>
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
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>Total no. of times counts recommended a dose increase</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>76</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; text-align: left;'>Total no. of 'DOSE INCREASE' decisions</td>
#> <td style='width: 250px; background-color: #ffffff; text-align: center;'>0</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>Recommended 'INCREASE DOSE' decisions: median [IQR]</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>11 [10-12]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>No. of 'INCREASE DOSE' decisions: median [IQR]</td>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>0 [0-0]</td>
#> </tr>
#> </tbody>
#> </table>
# \donttest{

pat_data = system.file("extdata/processed_data/", "UPN_914.csv", package = "allMT")
assess_increased_doses (input_files_path = pat_data, anc_threshold = 0.75,
                      plt_threshold = 75, hb_threshold = 8,
                      escalation_factor = 15, tolerated_dose_duration = 6)
#> NOTE: Analyzing provided input file only
#> NOTE: Analysis will be carried out with provided parameters: anc_threshold, plt_threshold and hb_threshold
#> Quitting
#> Bye Bye: Did you know that 1 million Earths can fit into the sun :)?
#> [[1]]
#>        ID Total no. of times counts recommended a dose increase
#> 1 UPN_914                                                     3
#>   Total no. of 'DOSE INCREASE' decisions Discordance (%)
#> 1                                      1          66.67%
#> 
#> [[2]]
#> 
#> 
#> =====================================================  =======
#> Parameter                                              Result 
#> =====================================================  =======
#> ID                                                     UPN_914
#> Total no. of times counts recommended a dose increase  3      
#> Total no. of 'DOSE INCREASE' decisions                 1      
#> Discordance (%)                                        66.67% 
#> =====================================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: 'INCREASE DOSE' analysis</td></tr>
#> <tr>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Parameter</th>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Result</th>
#> </tr>
#> </thead>
#> <tbody>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>ID</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>UPN_914</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Total no. of times counts recommended a dose increase</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>3</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>Total no. of 'DOSE INCREASE' decisions</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>1</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: left;'>Discordance (%)</td>
#> <td style='width: 200px; background-color: #e6e6e6; border-bottom: 2px solid grey; text-align: center;'>66.67%</td>
#> </tr>
#> </tbody>
#> </table>

assess_increased_doses(input_files_path = cohort_path,
                      anc_threshold = 0.7, plt_threshold = 60)
#> NOTE: Including all files in input folder
#> NOTE: Analysis will be carried out with provided parameter: anc_threshold and plt_threshold
#> Error
#> <simpleError in doTryCatch(return(expr), name, parentenv, handler): Error: Please provide value for 'escalation_factor' in percentage (Ex: 25% should be entered as 25)>
#> Quitting
#> Bye Bye: Did you know that 1 million Earths can fit into the sun :)?
# }

```
