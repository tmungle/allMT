
<!-- README.md is generated from README.Rmd. Please edit that file -->

# allMT

<!-- badges: start -->

[![R-CMD-check](https://github.com/tmungle/allMT/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tmungle/allMT/actions/workflows/R-CMD-check.yaml)
[![Travis build
status](https://travis-ci.com/tmungle/allMT.svg?branch=master)](https://travis-ci.com/tmungle/allMT)

<!-- badges: end -->

## Introduction

Studies across the globe have shown that delivering optimal maintenance
therapy (MT) is crucial to achieve better treatment outcomes in acute
lymphoblastic leukemia (ALL)
[\[1\]](#ref-schmiegelow2014mercaptopurine). In view of this, the
*allMT* package was created to analyse and visualize the MT data
(ANC/PLT/HB/6MP/MTX) at any given center[^1]. The package was developed
considering the ICiCLe-ALL-14 protocol [\[3\]](#ref-das2022protocol) as
default, it can be used to analyze data from centers with different MT
protocols.

## Package

In these cases, the user will need to alter the defined parameters.

Using this package the user may:

1.  Convert maintenance sheets (Tata Medical Center Kolkata, India
    format or user dependent) into a cleaner, single csv with
    longitudinal data for each patient.

2.  Analyze MT [\[2\]](#ref-mungle2020modelling)

    - At an individual patient level

      - To track patient’s MT progression during or after therapy.

      - To track patient’s cycle-by-cycle MT progression during or after
        the therapy using summary measure (SM) weighted mean (6MP\*MTX)
        vs weighted mean ANC parameters in a scatterplot.

    - At cohort level

      - SM plot to analyze MT for a given cohort defined by the user. SM
        is evaluated for each patient and plotted together to represent
        the entire cohort.

      - Compare SM for two different cohort defined by the user to
        evaluate MT practice. Cohort comparisons can include clinical
        interventions, year-wise evolution, patients treated by two
        different set of physicians, or as user see it fit.

      - Plot depicting median time to first 6-MP dose increase for the
        cohort.

3.  Evaluate real time dosing decisions (stop, reduce or increase) by
    the physicians during MT based on MT dosing guidelines
    [\[2\]](#ref-mungle2020modelling)

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/v1/examples>. -->

## Installation

You can install the development version of allMT from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tmungle/allMT")
```

## References

<div id="refs" class="references csl-bib-body">

<div id="ref-schmiegelow2014mercaptopurine" class="csl-entry">

<span class="csl-left-margin">\[1\] </span><span
class="csl-right-inline">K. Schmiegelow, S. N. Nielsen, T. L. Frandsen,
and J. Nersting, “Mercaptopurine/methotrexate maintenance therapy of
childhood acute lymphoblastic leukemia: Clinical facts and fiction,”
*Journal of pediatric hematology/oncology*, vol. 36, no. 7, p. 503,
2014.</span>

</div>

<div id="ref-mungle2020modelling" class="csl-entry">

<span class="csl-left-margin">\[2\] </span><span
class="csl-right-inline">T. D. Mungle, “Modelling clinical decision
processes to optimise maintenance chemotherapy in children with acute
lymphoblastic leukaemia,” PhD thesis, IIT Kharagpur, 2020.</span>

</div>

<div id="ref-das2022protocol" class="csl-entry">

<span class="csl-left-margin">\[3\] </span><span
class="csl-right-inline">N. Das *et al.*, “Protocol for ICiCLe-ALL-14
(InPOG-ALL-15-01): A prospective, risk stratified, randomised,
multicentre, open label, controlled therapeutic trial for newly
diagnosed childhood acute lymphoblastic leukaemia in india,” *Trials*,
vol. 23, no. 1, pp. 1–20, 2022.</span>

</div>

</div>

[^1]: The work was initiated as part of Tushar Mungle’s PhD work at IIT
    Kharagpur [\[2\]](#ref-mungle2020modelling) and then continued at
    TTCRC, Tata Medical Center, Kolkata.
