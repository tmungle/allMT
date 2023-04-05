#' @title Sample data for a patient with unique patient number (UPN) 915
#'
#' @description Data for the patient consists of a \code{dataframe} that is used for viewing data
#'
#'
#' @format A \code{dataframe} with 10 columns
#' \enumerate{
#'        \item{Cycle: 96 weeks of maintenance therapy (MT) is divided into 8 cycles. The column represents the cycles number for the patient with new assessment}
#'        \item{Date: Patient's new assessment date when doses were prescribed}
#'        \item{Weeks: MT consist of 96 weeks. Column represent week number for new assessment}
#'        \item{ANC: Absolute neutrophil count (ANC) values for new assessment}
#'        \item{ANC: Absolute neutrophil count (ANC) values for new assessment}
#'        \item{PLT: Platelet count (PLT) values for new assessment}
#'        \item{Hb: Hemoglobin (Hb) values for new assessment}
#'        \item{MP: 6-mercaptopurine (MP or 6MP) doses for new assessment}
#'        \item{MTX: Methotraxate (MTX) doses for new assessment}
#'        \item{MP_adj: MP dose intensity. Dose intensity is calculated as (\eqn{(MP dose prescribed on new assessment/Body surface area adjusted MP doses)*100)}}
#'        \item{MTX_adj: MTX dose intensity. Dose intensity is calculated similar to MP_adj}
#' }
#' @note For running examples you need to read the patient data as csv. The data (rda) is for viewing only
#'
"UPN_915"


