# Plot summarized maintenance therapy (MT) data to compare two or more cohorts

Create an integrated summary graph facetted (by cohort). Graph
illustrates weighted mean absolute neutrophil count (ANC) and dose
information for each patient.

## Usage

``` r
compare_cohorts(
  input_files_path,
  unit,
  anc_range,
  dose_intensity_threshold,
  method,
  intervention_date,
  group_data_path
)
```

## Arguments

- input_files_path:

  Path to folder with MT csv files (in quotes)

- unit:

  Choose either "million" or "billion".

  million

  :   Million cells/L (x\\10^{6}\\ cells/L or cells/\\\mu\\l)

  billion

  :   Billion cells/L (x\\10^{9}\\ cells/L or x\\10^{3}\\
      cells/\\\mu\\l)

- anc_range:

  Vector with lower and upper thresholds of absolute neutrophil count
  target range: (c(lower threshold, upper threshold))

  Note

  :   Ensure units of anc_range and patient data (unit) match.

- dose_intensity_threshold:

  numeric value of reference drug dose intensity (%).

- method:

  Choose from "M1" or "M2".

  M1

  :   Comparison of cohorts that started MT therapy before or after a
      particular date of intervention (intervention_date).

  M2

  :   Comparison of MT therapy between pre-determined groups.

- intervention_date:

  Only applicable if method = "M1". Provide date in yyyy-mm-dd format
  (in quotes)

- group_data_path:

  Only applicable for method = "M2". Path to EXCEL FILE containing
  "group" information. Ensure "ID" and "Group" columns are present.

## Value

Comparative summary graph

## Note

- Note:

  If more than one chort need to be compared then only "M2" method is
  applicable

## See also

[`summarize_cohortMT()`](https://tmungle.github.io/allMT/reference/summarize_cohortMT.md)

## Examples

``` r
cohort_path = paste0(system.file("extdata/processed_data/", package = "allMT"), "/")
compare_cohorts(input_files_path = cohort_path,
        method = "M1", intervention_date = "2020-12-01",
        unit = "billion", anc_range = c(0.75, 1.5), dose_intensity_threshold = 100)
#> NOTE: Including all files in input folder
#> Warning
#> <warning/lifecycle_warning_deprecated>
#> Warning:
#> Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.
#> ℹ The deprecated feature was likely used in the allMT package.
#>   Please report the issue at <https://github.com/tmungle/allMT/issues>.
#> ---
#> Backtrace:
#>      ▆
#>   1. └─pkgdown::build_site_github_pages(new_process = FALSE, install = FALSE)
#>   2.   └─pkgdown::build_site(...)
#>   3.     └─pkgdown:::build_site_local(...)
#>   4.       └─pkgdown::build_reference(...)
#>   5.         ├─pkgdown:::unwrap_purrr_error(...)
#>   6.         │ └─base::withCallingHandlers(...)
#>   7.         └─purrr::map(...)
#>   8.           └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
#>   9.             ├─purrr:::with_indexed_errors(...)
#>  10.             │ └─base::withCallingHandlers(...)
#>  11.             ├─purrr:::call_with_cleanup(...)
#>  12.             └─pkgdown (local) .f(.x[[i]], ...)
#>  13.               ├─base::withCallingHandlers(...)
#>  14.               └─pkgdown:::data_reference_topic(...)
#>  15.                 └─pkgdown:::run_examples(...)
#>  16.                   └─pkgdown:::highlight_examples(code, topic, env = env)
#>  17.                     └─downlit::evaluate_and_highlight(...)
#>  18.                       └─evaluate::evaluate(code, child_env(env), new_device = TRUE, output_handler = output_handler)
#>  19.                         ├─base::withRestarts(...)
#>  20.                         │ └─base (local) withRestartList(expr, restarts)
#>  21.                         │   ├─base (local) withOneRestart(withRestartList(expr, restarts[-nr]), restarts[[nr]])
#>  22.                         │   │ └─base (local) doWithOneRestart(return(expr), restart)
#>  23.                         │   └─base (local) withRestartList(expr, restarts[-nr])
#>  24.                         │     └─base (local) withOneRestart(expr, restarts[[1L]])
#>  25.                         │       └─base (local) doWithOneRestart(return(expr), restart)
#>  26.                         ├─evaluate:::with_handlers(...)
#>  27.                         │ ├─base::eval(call)
#>  28.                         │ │ └─base::eval(call)
#>  29.                         │ └─base::withCallingHandlers(...)
#>  30.                         ├─base::withVisible(eval(expr, envir))
#>  31.                         └─base::eval(expr, envir)
#>  32.                           └─base::eval(expr, envir)
#>  33.                             └─allMT::compare_cohorts(...)
#>  34.                               ├─base::tryCatch(...)
#>  35.                               │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
#>  36.                               │   ├─base (local) tryCatchOne(...)
#>  37.                               │   │ └─base (local) doTryCatch(return(expr), name, parentenv, handler)
#>  38.                               │   └─base (local) tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
#>  39.                               │     └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
#>  40.                               │       └─base (local) doTryCatch(return(expr), name, parentenv, handler)
#>  41.                               └─allMT (local) Graph(...)
#>  42.                                 └─ggplot2::geom_hline(...)
#>  43.                                   └─ggplot2::layer(...)
#>  44.                                     └─ggplot2:::deprecate_warn0(...)
#> Quitting
#> Bye Bye: Did you know that space is silent :)?

# \donttest{
group_path = system.file("extdata/grouped_data/group_data.xlsx", package = "allMT")
compare_cohorts(input_files_path = cohort_path,
       method = "M2", group_data_path = group_path,
       unit = "billion", anc_range = c(0.75, 1.5), dose_intensity_threshold = 80)
#> NOTE: Including all files in input folder
#> Joining with `by = join_by(Pat_ID)`
#> Warning
#> <warning/lifecycle_warning_deprecated>
#> Warning:
#> The `size` argument of `element_rect()` is deprecated as of ggplot2 3.4.0.
#> ℹ Please use the `linewidth` argument instead.
#> ℹ The deprecated feature was likely used in the allMT package.
#>   Please report the issue at <https://github.com/tmungle/allMT/issues>.
#> ---
#> Backtrace:
#>      ▆
#>   1. └─pkgdown::build_site_github_pages(new_process = FALSE, install = FALSE)
#>   2.   └─pkgdown::build_site(...)
#>   3.     └─pkgdown:::build_site_local(...)
#>   4.       └─pkgdown::build_reference(...)
#>   5.         ├─pkgdown:::unwrap_purrr_error(...)
#>   6.         │ └─base::withCallingHandlers(...)
#>   7.         └─purrr::map(...)
#>   8.           └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
#>   9.             ├─purrr:::with_indexed_errors(...)
#>  10.             │ └─base::withCallingHandlers(...)
#>  11.             ├─purrr:::call_with_cleanup(...)
#>  12.             └─pkgdown (local) .f(.x[[i]], ...)
#>  13.               ├─base::withCallingHandlers(...)
#>  14.               └─pkgdown:::data_reference_topic(...)
#>  15.                 └─pkgdown:::run_examples(...)
#>  16.                   └─pkgdown:::highlight_examples(code, topic, env = env)
#>  17.                     └─downlit::evaluate_and_highlight(...)
#>  18.                       └─evaluate::evaluate(code, child_env(env), new_device = TRUE, output_handler = output_handler)
#>  19.                         ├─base::withRestarts(...)
#>  20.                         │ └─base (local) withRestartList(expr, restarts)
#>  21.                         │   ├─base (local) withOneRestart(withRestartList(expr, restarts[-nr]), restarts[[nr]])
#>  22.                         │   │ └─base (local) doWithOneRestart(return(expr), restart)
#>  23.                         │   └─base (local) withRestartList(expr, restarts[-nr])
#>  24.                         │     └─base (local) withOneRestart(expr, restarts[[1L]])
#>  25.                         │       └─base (local) doWithOneRestart(return(expr), restart)
#>  26.                         ├─evaluate:::with_handlers(...)
#>  27.                         │ ├─base::eval(call)
#>  28.                         │ │ └─base::eval(call)
#>  29.                         │ └─base::withCallingHandlers(...)
#>  30.                         ├─base::withVisible(eval(expr, envir))
#>  31.                         └─base::eval(expr, envir)
#>  32.                           └─base::eval(expr, envir)
#>  33.                             └─allMT::compare_cohorts(...)
#>  34.                               ├─base::tryCatch(...)
#>  35.                               │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
#>  36.                               │   ├─base (local) tryCatchOne(...)
#>  37.                               │   │ └─base (local) doTryCatch(return(expr), name, parentenv, handler)
#>  38.                               │   └─base (local) tryCatchList(expr, names[-nh], parentenv, handlers[-nh])
#>  39.                               │     └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
#>  40.                               │       └─base (local) doTryCatch(return(expr), name, parentenv, handler)
#>  41.                               └─allMT (local) Graph(...)
#>  42.                                 ├─ggplot2::theme(...)
#>  43.                                 │ └─ggplot2:::find_args(..., complete = NULL, validate = NULL)
#>  44.                                 │   └─base::mget(args, envir = env)
#>  45.                                 └─ggplot2::element_rect(...)
#>  46.                                   └─ggplot2:::deprecate_warn0("3.4.0", "element_rect(size)", "element_rect(linewidth)")
#> Quitting
#> Bye Bye: Did you know that space is silent :)?
# }
```
