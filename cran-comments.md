## **CRAN Submission Issue**

1.  Replaced \dontrun{} by \donttest{} as few examples takes \> 5 secs or are extra examples provided for users.
2.  Removed rm(list = ls()) from convert_tmc_format.R and convert_external_format.R as it clears out global environment for the user.
3.  For references, [*we feel*]{.underline} given the package functionality, adding references (that we have used) to the DESCRIPTION file would be completely unnecessary.

## CRAN Submission Issue

Replaced absolute path (path.expand('\~')) for save_path argument (convert_tmc_format.R and convert_external_format.R) with tempdir().

## R CMD check results (First submission)

0 errors \| 0 warnings \| 1 note

-   checking CRAN incoming feasibility ... NOTE Maintainer: 'Tushar Mungle \<tushar.mungle\@gmail.com\>'

    New submission

    Note 1 relates to new submission.
