# Graphical representation of maintenance therapy data for single patient

Creates a line graph (trends) for absolute neutrophil count (ANC),
6-Mercaptopurine (6MP) and Methotrexate (MTX) doses across all visits
for the given patient

## Usage

``` r
plot_progression(input_file_path, anc_range, unit)
```

## Arguments

- input_file_path:

  Path to input csv file for the patient (in quotes)

- anc_range:

  ANC target range as per the protocol: (c(lower threshold, upper
  threshold)). NOTE: Ensure that units are the same as unit of ANC in
  the input data.

- unit:

  Choose either "million" or "billion".

  - "million" = million cells/L (x\\10^{6}\\ cells/L or cells/\\\mu\\l)

  - "billion" = billion cells/L (x\\10^{9}\\ cells/L or x\\10^{3}\\
    cells/\\\mu\\l)

## Value

plot image

## Note

- If there is only one threshold for anc_range parameter, please specify
  the respective value and keep the other threshold as NA. eg : c(2000,
  NA)

- Horizontal dotted lines on the graph indicate anc_range thresholds and
  starting doses for 6MP and MTX as a reference (colour coded to
  corresponding parameter)

## See also

[`summarize_cycle_progression()`](https://tmungle.github.io/allMT/reference/summarize_cycle_progression.md)

## Examples

``` r
pat_data = system.file("extdata/processed_data/", "UPN_915.csv", package = "allMT")
plot_progression(input_file_path = pat_data, anc_range = c(0.75,1.5), unit = "billion")
#> NOTE: Analyzing provided input file
#> Maintenance therapy progression graph for the patient has been created
#> Quitting
#> Bye Bye: Did you know that Jupiter is biggest planet in our solar system :)?
#> Warning: log-10 transformation introduced infinite values.
#> Warning: log-10 transformation introduced infinite values.


# \donttest{
# As per BFM protocol (Reference PMID - 15902295):
plot_progression(input_file_path = "../UPN1.csv", anc_range = c(2, NA), unit = "billion")
#> Error
#> <simpleError in doTryCatch(return(expr), name, parentenv, handler): Please provide a valid file path for the 'input_file_path' argument>
#> Quitting
#> Bye Bye: Did you know that Jupiter is biggest planet in our solar system :)?

# As per St Jude protocol (Reference PMID - 15902295):
plot_progression(input_file_path = "../../UPN1.csv", anc_range = c(0.3, 1), unit = "billion")
#> Error
#> <simpleError in doTryCatch(return(expr), name, parentenv, handler): Please provide a valid file path for the 'input_file_path' argument>
#> Quitting
#> Bye Bye: Did you know that Jupiter is biggest planet in our solar system :)?
# }
```
