# Get standard data structure

Convert a maintenance therapy excel sheet created by user into a
standard format for analysis

## Usage

``` r
convert_external_format(
  inputpath_to_excelfolder,
  exportpath_to_csvfolder,
  pat_data_file_path,
  daily_mp_dose = 60,
  weekly_mtx_dose = 20
)
```

## Arguments

- inputpath_to_excelfolder:

  Path to folder containing input excel files (in quotes)

- exportpath_to_csvfolder:

  Path to folder in which to save final output csv files (in quotes)

- pat_data_file_path:

  Path to excel file with patient IDs and corresponding BSA (body
  surface area) values. Column names - "ID", "BSA".

- daily_mp_dose:

  numeric value of DAILY 6-Mercaptopurine dose per \\1m^{2}\\
  (\\mg/m^{2}\\) as per the MT dosing protocol. Default = \\60mg/m^{2}\\
  (as per ICiCLe-ALL-14 protocol)

- weekly_mtx_dose:

  numeric value of WEEKLY absolute Methotrexate dose per \\1m^{2}\\
  (\\mg/m^{2}\\) as per the MT dosing protocol. Default = \\20mg/m^{2}\\
  (as per ICiCLe-ALL-14 protocol)

## Value

Folder with converted csv files

## Note

If MT excel files are missing in the input folder for any patient IDs
provided in the pat_data_file ID column, the function will show a
message of missing IDs but will continue to convert the available files.

## See also

[`convert_tmc_format()`](https://tmungle.github.io/allMT/reference/convert_tmc_format.md)

## Examples

``` r
# As per ICiCLe-ALL-14 protocol (Reference PMID - 35101099):
path_to_excel = paste0(system.file("extdata/external_data/", package = "allMT"), "/")
save_path = paste0(tempdir(),"/")
path_to_bsa = system.file("extdata/external_data/", "BSA.xlsx", package = "allMT")
convert_external_format(inputpath_to_excelfolder = path_to_excel,
                   exportpath_to_csvfolder = save_path,
                   pat_data_file_path = path_to_bsa,
                   daily_mp_dose = 60,
                   weekly_mtx_dose = 20)
#> NOTE: Using following values for 6-MP and MTX doses:
#>  daily_mp_dose = 60 weekly_mtx_dose = 20
#> Reading UPN_1.csv
#> Writing UPN_1.csv
#> Format switch complete
#> Reading UPN_2.csv
#> Writing UPN_2.csv
#> Format switch complete
#> Quitting
#> Bye Bye: Did you know that Uranus spins sideways :)?
# \donttest{
# As per ICiCLe-ALL-14 protocol (Reference PMID - 35101099):
convert_external_format(inputpath_to_excelfolder = "../csv_trial/",
                   exportpath_to_csvfolder = save_path,
                   pat_data_file_path = "BSAFile.xlsx")
#> NOTE: Using following values for 6-MP and MTX doses:
#>  daily_mp_dose = 60 weekly_mtx_dose = 20
#> Error
#> <simpleError: `path` does not exist: ‘BSAFile.xlsx’>
#> Quitting
#> Bye Bye: Did you know that Uranus spins sideways :)?

# As per BFM protocol (Reference PMID - 15902295):
convert_external_format(inputpath_to_excelfolder = "../csv_trial/",
                   exportpath_to_csvfolder = save_path,
                   pat_data_file_path = "BSAFile.xlsx",
                   daily_mp_dose = 50,
                   weekly_mtx_dose = 20)
#> NOTE: Using following values for 6-MP and MTX doses:
#>  daily_mp_dose = 50 weekly_mtx_dose = 20
#> Error
#> <simpleError: `path` does not exist: ‘BSAFile.xlsx’>
#> Quitting
#> Bye Bye: Did you know that Uranus spins sideways :)?

# As per St Jude protocol (Reference PMID - 15902295):
convert_external_format(inputpath_to_excelfolder = "../csv_trial/",
                   exportpath_to_csvfolder = save_path,
                   pat_data_file_path = "BSAFile.xlsx",
                   daily_mp_dose = 75,
                   weekly_mtx_dose = 40)
#> NOTE: Using following values for 6-MP and MTX doses:
#>  daily_mp_dose = 75 weekly_mtx_dose = 40
#> Error
#> <simpleError: `path` does not exist: ‘BSAFile.xlsx’>
#> Quitting
#> Bye Bye: Did you know that Uranus spins sideways :)?
# }
```
