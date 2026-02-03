# Analyze Acute Lymphoblastic Leukemia Maintenance Therapy

------------------------------------------------------------------------

## Introduction

***Acute Lymphoblastic Leukemia*** (ALL)

ALL treatment is broadly divided into 2 phases - Intensive Phase and
Maintenance Phase. The intensive phase of treatment is further divided
into 4 sub-phases – induction, consolidation, interim maintenance and
delayed intensification [\[1\]](#ref-das2022protocol).

Maintenance therapy (MT), the longest phase of ALL treatment consists of
~2 years (96 weeks or 8 cycles - 12 weeks per cycle)
[\[1\]](#ref-das2022protocol). Patients are advised to visit hospital
every alternate week (every two weeks) for consultation and on a weekly
basis in case of toxicities (neutropenia, thrombocytopenia or any
other). Overall, a patient should ideally have a minimum of 48 visits
during MT. During each visit, patient’s blood report is examined for the
following parameters - absolute neutrophil count (ANC), platelet count
(PLT) and hemoglobin (HB) to ***adjust*** (or dose titrations) the
drugs: 6-mercaptopurine (6MP) and Methotrexate (MTX) that are prescribed
on weekly basis.

------------------------------------------------------------------------

## Package

ALL studies, across the globe, have shown that delivering optimal MT is
crucial to achieve better treatment outcomes
[\[2\]](#ref-schmiegelow2014mercaptopurine). Delivering optimal MT is
ensured by prescribing maximum tolerated 6MP and MTX doses that are
adjusted patient’s hospital visit. In view of this, the package was
created to analyse and visualize the ALL MT data
(ANC/PLT/HB/6MP/MTX)[¹](#fn1). The use of package would assist
physicians to evaluate MT for a given patient or a cohort at any center.
Although, the package was developed considering the ICiCLe-ALL-14
protocol [\[1\]](#ref-das2022protocol) as default, it can be used to
analyze data from centers with different MT protocols. In case of
different protocol, the user will need to alter the defined parameters
specific to protocol as function arguments.

Using this package the user may:

1.  Convert maintenance sheets (Tata Medical Center Kolkata, India
    format or user dependent) into a cleaner, single csv with
    longitudinal data for each patient.

2.  Analyze MT

    - At an individual patient level

      - To track patient’s MT progression during or after therapy
        [\[3\]](#ref-mungle2020modelling).

      - To track patient’s cycle-by-cycle MT progression during or after
        the therapy using summary measure (SM) weighted mean (6MP\*MTX)
        vs weighted mean ANC parameters in a scatterplot.

    - At cohort level

      - SM plot to analyze MT for a given cohort defined by the user. SM
        is evaluated for each patient and plotted together to represent
        the entire cohort [\[3\]](#ref-mungle2020modelling).

      - Compare SM for two different cohort defined by the user to
        evaluate MT practice. Cohort comparisons can include clinical
        interventions, year-wise practice evolution, patients treated by
        two different set of physicians, or as user see it fit
        [\[3\]](#ref-mungle2020modelling).

3.  Evaluate real time dosing decisions (stop, reduce or increase) by
    the physicians during MT based on MT dosing guidelines for the
    individual patient or cohort [\[3\]](#ref-mungle2020modelling).

4.  Evaluate hematological toxicities - neutropenia, thrombocytopenia
    and anemia during MT for the individual patient or cohort.

5.  Evaluate/plot median time to first 6MP dose increase for the
    individual patient or cohort [\[3\]](#ref-mungle2020modelling).

``` r
# library(allMT)
```

------------------------------------------------------------------------

## Data

1.  The data recording sheet used by TMC can be downloaded/copied as

    ``` r
    # Uncomment below line before running the snippet
    # library(allMT)
    pat_data <- system.file("extdata/tmc_data/", "UPN_916.xls", package = "allMT")
    dest_path <- getwd() # user may choose a different destination 
    file.copy(pat_data, dest_path)
    #> [1] TRUE
    ```

2.  To use functions of the package, the data needs to be in a specific
    format as described in below example. Sample data[²](#fn2) for 3
    individual patient is available as UPN_914, UPN_915, and UPN_916 as
    rda with the library for viewing. Additionally, UPN_914, UPN_915,
    UPN_916, UPN_917 and UPN_918 are present under the folder
    “/extdata/processed_data/” as csv format to run any examples.

    Data can be checked or saved as

    ``` r
    # Below code should work for any user independent of OS
    # pat_data <- system.file("extdata/processed_data/", "UPN_916.csv", package = "allMT")
    # pat_df <- utils::read.csv(pat_data, header = TRUE, sep = ",")
    # # head(pat_df)
    ```

------------------------------------------------------------------------

## Functions

### Convert Data

- [`convert_tmc_format()`](https://tmungle.github.io/allMT/reference/convert_tmc_format.md) -
  Convert information recorded in the TMC datasheet format to a format
  that will be used by package functions.

- [`convert_external_format()`](https://tmungle.github.io/allMT/reference/convert_external_format.md) -
  Convert MT information (user defined) to a format that will be used by
  package functions.  
  **Note:** User need to ensure the MT information is stored in an excel
  or csv with column names as - Dates, ANC, PLT, MP, MTX. The function
  will convert this sheet into required format.

The output of both the functions will result in standard patient csv
files (as described Data section) saved in a folder defined by the user.

### Analyze MT Data

#### At individual patient level

- [`plot_progression()`](https://tmungle.github.io/allMT/reference/plot_progression.md) -
  Plot line graph showing historical longitudinal trends of ANC, 6MP and
  MTX for a single patient. This function can be use by the doctors
  during the MT clinic to monitor patients’ MT dose prescription and
  treatment response in real time.

- [`summarize_cycle_progression()`](https://tmungle.github.io/allMT/reference/summarize_cycle_progression.md) -
  Plot SM data per cycle for given patient data. Utility as above.

#### At cohort level

- [`summarize_cohortMT()`](https://tmungle.github.io/allMT/reference/summarize_cohortMT.md) -
  Plot scatter plot (SM) for all the patients from user defined cohort.

- [`compare_cohorts()`](https://tmungle.github.io/allMT/reference/compare_cohorts.md) -
  Plot scatter plot (SM) for all the patients present in user defined
  multiple cohorts (more than 1 cohort) . Two methods of cohort
  comparison can be considered for analysis as mentioned below:

  - Method 1 - Comparison between cohorts that began MT before and after
    a particular user-provided date.

  - Method 2 - Comparison between more than 1 cohorts pre-determined by
    the user.

### Evaluate Physicians’ Dosing Decisions

- [`assess_stop_doses()`](https://tmungle.github.io/allMT/reference/assess_stop_doses.md) -
  The function evaluates the incidence of ‘No Dose’ physician’s
  decisions that are NOT supported by protocol-based target blood
  counts.

- [`assess_reduced_doses()`](https://tmungle.github.io/allMT/reference/assess_reduced_doses.md) -
  The function evaluates the incidence of ‘Reduce Dose’ physician’s
  decisions that are NOT supported by protocol-based target blood
  counts.

- [`assess_increased_doses()`](https://tmungle.github.io/allMT/reference/assess_increased_doses.md) -
  The function evaluates the incidence of ‘Increase Dose’ physician’s
  decisions that are NOT supported by protocol-based target blood
  counts.

  **Note:** Depending upon value provided for the argument
  ‘input_files_path’ as a

  1.  path to a file for single patient csv - resulting output will be
      analysis for single patient
  2.  path to a folder (cohort) with multiple csv - resulting output
      will be analysis carried for the cohort of patients’ csv files
      present in the folder

### Evaluate Hematological Toxicities

- [`assess_neutropenia()`](https://tmungle.github.io/allMT/reference/assess_neutropenia.md) -
  The function evaluates number of neutropenia episodes as per the
  neutropenia definition provided in ‘anc_range’ argument - c(a,b). a is
  defined as highest value of ANC threshold for neutropenic condition,
  and b is defined as ANC value above which neutropenic condition is
  said to be recovered.

- [`assess_thrombocytopenia()`](https://tmungle.github.io/allMT/reference/assess_thrombocytopenia.md) -
  The function evaluates number of thrombocytopenia episodes as per the
  thrombocytopenia definition provided in ‘plt_range’ argument - c(a,b).
  a is defined as highest value of PLT threshold for thrombocytopenia
  condition, and b is defined as PLT value above which thrombocytopenic
  condition is said to be recovered.

- [`assess_anemia()`](https://tmungle.github.io/allMT/reference/assess_anemia.md) -
  The function evaluates number of anemia episodes as per the anemia
  definition provided in ‘hb_range’ argument - c(a,b). a is defined as
  highest value of Hb threshold for anemia condition, and b is defined
  as Hb value above which anemic condition is said to be recovered.

**Note:** Depending upon value provided for the argument
‘input_files_path’ as a

1.  path to a file for single patient csv - resulting output will be
    analysis for single patient
2.  path to a folder (cohort) with multiple csv - resulting output will
    analysis be carried for the cohort of patients’ csv files present in
    the folder

### Time to First-Dose-Increase

- [`time_to_first_dose_increase()`](https://tmungle.github.io/allMT/reference/time_to_first_dose_increase.md) -
  Plot the graph showing median time to first 6MP dose increase for the
  cohort (if input file is an individual patient instead of cohort,
  function displays value for an individual patient in question)

------------------------------------------------------------------------

## References

\[1\]

N. Das *et al.*, “Protocol for ICiCLe-ALL-14 (InPOG-ALL-15-01): A
prospective, risk stratified, randomised, multicentre, open label,
controlled therapeutic trial for newly diagnosed childhood acute
lymphoblastic leukaemia in india,” *Trials*, vol. 23, no. 1, pp. 1–20,
2022.

\[2\]

K. Schmiegelow, S. N. Nielsen, T. L. Frandsen, and J. Nersting,
“Mercaptopurine/methotrexate maintenance therapy of childhood acute
lymphoblastic leukemia: Clinical facts and fiction,” *Journal of
pediatric hematology/oncology*, vol. 36, no. 7, p. 503, 2014.

\[3\]

T. D. Mungle, “Modelling clinical decision processes to optimise
maintenance chemotherapy in children with acute lymphoblastic
leukaemia,” PhD thesis, IIT Kharagpur, 2020.

------------------------------------------------------------------------

1.  The work was initiated as part of Tushar Mungle’s PhD at IIT
    Kharagpur [\[3\]](#ref-mungle2020modelling) and then continued at
    TTCRC, Tata Medical Center, Kolkata.

2.  Ethics approval statement: The anonymized clinical data set refers
    to patients treated on the ICiCLe-ALL-14 treatment protocol at the
    Tata Medical Center Kolkata (institutional review board approval
    EC/TMC/12/13 for the treatment protocol). Funding support for the
    ICiCLe-ALL-14 clinical study (Clinical Trials Registry-India
    reference CTRI/2015/12/006434) was provided by the National Cancer
    Grid (2016/001; 2016-) and the Indian Council of Medical Research
    (79/159/2015/NCD-III; 2017-19).
