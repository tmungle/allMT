# Plot the time taken for FIRST 6-Mercaptopurine (6MP) dose increase in cohort

Evaluate median time (in weeks) to first 6MP dose increase for the
cohort using Kaplan-Meier cumulative incidence estimator using
[ggsurvplot](https://rdrr.io/pkg/survminer/man/ggsurvplot.html) package

## Usage

``` r
time_to_first_dose_increase(input_files_path, escalation_factor)
```

## Arguments

- input_files_path:

  Path to folder with MT csv files (in quotes)

- escalation_factor:

  Percentage of increase from first dose to be considered as an
  "increased" dose.

## Value

Median time (in weeks) to first 6MP dose increase plot

## See also

[`assess_increased_doses()`](https://tmungle.github.io/allMT/reference/assess_increased_doses.md)

## Examples

``` r
cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
time_to_first_dose_increase(input_files_path = cohort_path,
                escalation_factor = 10)
#> NOTE: Analyzing provided input files
#> Call: survfit(formula = survival::Surv(Weeks, status) ~ 1, data = DoseInc)
#> 
#>      n events median 0.95LCL 0.95UCL
#> [1,] 7      5     52       9      NA
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • colour : ""

#> Time to dose increase graph created
#> Quitting
#> Bye Bye: Question - Is Pluto a planet? :)
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • fill : ""
#> Ignoring unknown labels:
#> • colour : ""


```
