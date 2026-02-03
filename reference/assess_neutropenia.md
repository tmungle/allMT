# Assess hematological toxicities: Neutropenia

Evaluate number of neutropenia episodes and their duration for a given
patient or cohort

## Usage

``` r
assess_neutropenia(input_files_path, anc_range, duration_anc = NA)
```

## Arguments

- input_files_path:

  path to a file or a folder with MT csv files (in quotes).

- anc_range:

  Absolute neutrophil count (ANC) value range of c(Neutropenic ANC
  threshold, recovered ANC threshold). NOTE: Ensure that units are the
  same as unit of ANC in the input data.

- duration_anc:

  numeric duration (in weeks) that is used to categorize event as "long
  duration neutropenia" (optional)

## Value

Returns a list with (1) the neutropenia information for each patient as
listed below, (2) analysis summary as dataframe (3) analysis summary as
HTML table.

1.  Pat ID

2.  Number of particular toxicity episodes

3.  Duration of particular toxicity (in weeks)

4.  Number of long duration toxicity episodes

5.  Duration of long duration toxicity (in weeks)

## Note

1.  If the function is used for cohort analysis then values are
    represented as median and interquartile range (IQR) (25%-75%). The
    median and IQR is rounded off to upper integer value if decimal
    value is greater or equal to 0.5, else to lower integer value.
    Example 1.4-\>1 and 3.75-\>4

2.  Long duration toxicity is only analyzed if "duration_anc" is
    included in provided arguments

3.  User may save the result as a list, if required, to analyze each
    patient neutropenia analysis by analyzing 1st element of list

## See also

[`assess_anemia()`](https://tmungle.github.io/allMT/reference/assess_anemia.md),
[`assess_thrombocytopenia()`](https://tmungle.github.io/allMT/reference/assess_thrombocytopenia.md)

## Examples

``` r
pat_data = system.file("extdata/processed_data/", "UPN_915.csv", package = "allMT")
assess_neutropenia(input_files_path = pat_data,
                      anc_range = c(0.5, 0.75), duration_anc = 3)
#> NOTE: Analyzing provided input file only
#> Quitting
#> Bye Bye: Did you know that Earth is spherical in shape :)?
#> [[1]]
#>        ID Number of episodes Duration (weeks)
#> 1 UPN_915                  2                2
#>   Number of long duration toxicity episodes Duration of long duration toxicity
#> 1                                         0                                  0
#> 
#> [[2]]
#> 
#> 
#> =========================================  =======
#> Parameter                                  Result 
#> =========================================  =======
#> ID                                         UPN_915
#> Number of episodes                         2      
#> Duration (weeks)                           2      
#> Number of long duration toxicity episodes  0      
#> Duration of long duration toxicity         0      
#> =========================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: Neutropenia analysis</td></tr>
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
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Number of episodes</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>2</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>Duration (weeks)</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>2</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Number of long duration toxicity episodes</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>0</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>Duration of long duration toxicity</td>
#> <td style='width: 200px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>0</td>
#> </tr>
#> </tbody>
#> </table>

# \donttest{

cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
assess_neutropenia(input_files_path = cohort_path,
                      anc_range = c(0.5, 0.75), duration_anc = 3)
#> NOTE: Including all files in input folder
#> Quitting
#> Bye Bye: Did you know that Earth is spherical in shape :)?
#> [[1]]
#>        ID Number of episodes Duration (weeks)
#> 1   UPN_1                  0                0
#> 2   UPN_2                  0                0
#> 3 UPN_914                  1                3
#> 4 UPN_915                  2                2
#> 5 UPN_916                  3               10
#> 6 UPN_917                  3                8
#> 7 UPN_918                  0                0
#>   Number of long duration toxicity episodes Duration of long duration toxicity
#> 1                                         0                                  0
#> 2                                         0                                  0
#> 3                                         1                                  3
#> 4                                         0                                  0
#> 5                                         3                                 10
#> 6                                         1                                  4
#> 7                                         0                                  0
#> 
#> [[2]]
#> 
#> 
#> =========================================  =======
#> Parameter                                  Result 
#> =========================================  =======
#> Number of patients analyzed                7      
#> Number of episodes                         1 [0-3]
#> Duration (weeks)                           2 [0-6]
#> Number of long duration toxicity episodes  0 [0-1]
#> Duration of long duration toxicity         0 [0-4]
#> =========================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: Neutropenia analysis</td></tr>
#> <tr>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Parameter</th>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Result</th>
#> </tr>
#> </thead>
#> <tbody>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>Number of patients analyzed</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>7</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Number of episodes</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>1 [0-3]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>Duration (weeks)</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>2 [0-6]</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Number of long duration toxicity episodes</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>0 [0-1]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>Duration of long duration toxicity</td>
#> <td style='width: 200px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>0 [0-4]</td>
#> </tr>
#> </tbody>
#> </table>


result <- assess_neutropenia(input_files_path = pat_data,
                      anc_range = c(0.5, 0.75), duration_anc = 3)
#> NOTE: Analyzing provided input file only
#> Quitting
#> Bye Bye: Did you know that Earth is spherical in shape :)?
print(result[[1]])
#>        ID Number of episodes Duration (weeks)
#> 1 UPN_915                  2                2
#>   Number of long duration toxicity episodes Duration of long duration toxicity
#> 1                                         0                                  0
print(result[[2]])
#> 
#> 
#> =========================================  =======
#> Parameter                                  Result 
#> =========================================  =======
#> ID                                         UPN_915
#> Number of episodes                         2      
#> Duration (weeks)                           2      
#> Number of long duration toxicity episodes  0      
#> Duration of long duration toxicity         0      
#> =========================================  =======
print(result[[3]])
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: Neutropenia analysis</td></tr>
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
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Number of episodes</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>2</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; text-align: left;'>Duration (weeks)</td>
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>2</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: left;'>Number of long duration toxicity episodes</td>
#> <td style='width: 200px; background-color: #e6e6e6; text-align: center;'>0</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 200px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>Duration of long duration toxicity</td>
#> <td style='width: 200px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>0</td>
#> </tr>
#> </tbody>
#> </table>
# }
```
