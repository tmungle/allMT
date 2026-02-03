# Assess hematological toxicities: Anemia

Evaluate number of anemia episodes and their duration for a given
patient or cohort

## Usage

``` r
assess_anemia(input_files_path, hb_range, duration_hb = NA)
```

## Arguments

- input_files_path:

  path to a file or a folder with MT csv files (in quotes).

- hb_range:

  Hemoglobin (HB) value range of c(Anemic HB threshold, recovered HB
  threshold). NOTE: Ensure that units are the same as unit of HB in the
  input data.

- duration_hb:

  numeric duration (in weeks) that is used to categorize event as "long
  duration anemia" (optional)

## Value

Returns a list with (1) the anemia information for each patient as
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

2.  Long duration toxicity is only analyzed if "duration_hb" is included
    in provided arguments

3.  User may save the result as a list, if required, to analyze each
    patient seperatly please use 1st element of list

## See also

[`assess_neutropenia()`](https://tmungle.github.io/allMT/reference/assess_neutropenia.md),
[`assess_thrombocytopenia()`](https://tmungle.github.io/allMT/reference/assess_thrombocytopenia.md)

## Examples

``` r
pat_data = system.file("extdata/processed_data/", "UPN_915.csv", package = "allMT")
assess_anemia(input_files_path = pat_data,
                      hb_range = c(7, 8), duration_hb = 3)
#> NOTE: Analyzing provided input file only
#> Quitting
#> Bye Bye: Did you know that sun rises in the east :)?
#> [[1]]
#>        ID Number of episodes Duration (weeks)
#> 1 UPN_915                  2                3
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
#> Duration (weeks)                           3      
#> Number of long duration toxicity episodes  0      
#> Duration of long duration toxicity         0      
#> =========================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: Anemia analysis</td></tr>
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
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>3</td>
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
assess_anemia(input_files_path = cohort_path,
                      hb_range = c(7, 8), duration_hb = 3)
#> NOTE: Including all files in input folder
#> Quitting
#> Bye Bye: Did you know that sun rises in the east :)?
#> [[1]]
#>        ID Number of episodes Duration (weeks)
#> 1   UPN_1                  0                0
#> 2   UPN_2                  0                0
#> 3 UPN_914                  0                0
#> 4 UPN_915                  2                3
#> 5 UPN_916                  0                0
#> 6 UPN_917                  0                0
#> 7 UPN_918                  0                0
#>   Number of long duration toxicity episodes Duration of long duration toxicity
#> 1                                         0                                  0
#> 2                                         0                                  0
#> 3                                         0                                  0
#> 4                                         0                                  0
#> 5                                         0                                  0
#> 6                                         0                                  0
#> 7                                         0                                  0
#> 
#> [[2]]
#> 
#> 
#> =========================================  =======
#> Parameter                                  Result 
#> =========================================  =======
#> Number of patients analyzed                7      
#> Number of episodes                         0 [0-0]
#> Duration (weeks)                           0 [0-0]
#> Number of long duration toxicity episodes  0 [0-0]
#> Duration of long duration toxicity         0 [0-0]
#> =========================================  =======
#> 
#> [[3]]
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: Anemia analysis</td></tr>
#> <tr>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Parameter</th>
#> <th style='background-color: #e6e6e6; border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>Result</th>
#> </tr>
#> </thead>
#> <tbody>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; text-align: left;'>Number of patients analyzed</td>
#> <td style='width: 250px; background-color: #ffffff; text-align: center;'>7</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>Number of episodes</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>0 [0-0]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; text-align: left;'>Duration (weeks)</td>
#> <td style='width: 250px; background-color: #ffffff; text-align: center;'>0 [0-0]</td>
#> </tr>
#> <tr style='background-color: #e6e6e6;'>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: left;'>Number of long duration toxicity episodes</td>
#> <td style='width: 250px; background-color: #e6e6e6; text-align: center;'>0 [0-0]</td>
#> </tr>
#> <tr style='background-color: #ffffff;'>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: left;'>Duration of long duration toxicity</td>
#> <td style='width: 250px; background-color: #ffffff; border-bottom: 2px solid grey; text-align: center;'>0 [0-0]</td>
#> </tr>
#> </tbody>
#> </table>

result <- assess_anemia(input_files_path = pat_data,
                      hb_range = c(7, 8), duration_hb = 3)
#> NOTE: Analyzing provided input file only
#> Quitting
#> Bye Bye: Did you know that sun rises in the east :)?
print(result[[1]])
#>        ID Number of episodes Duration (weeks)
#> 1 UPN_915                  2                3
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
#> Duration (weeks)                           3      
#> Number of long duration toxicity episodes  0      
#> Duration of long duration toxicity         0      
#> =========================================  =======
print(result[[3]])
#> <table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
#> <thead>
#> <tr><td colspan='2' style='text-align: left;'>
#> Table: Anemia analysis</td></tr>
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
#> <td style='width: 200px; background-color: #ffffff; text-align: center;'>3</td>
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
