library(RTCGA.clinical) # survival times
library(RTCGA.rnaseq) # genes' expression
library(dplyr)

survivalTCGA(BRCA.clinical, 
             HNSC.clinical) -> BRCA_HNSC.surv

expressionsTCGA(
   BRCA.rnaseq, HNSC.rnaseq,
   extract.cols = c("ABCD4|5826")) %>%
   rename(cohort = dataset,
          ABCD4 = `ABCD4|5826`) %>%
   filter(substr(bcr_patient_barcode, 14, 15) == "01") %>% 
   # only cancer samples
   mutate(bcr_patient_barcode = 
             substr(bcr_patient_barcode, 1, 12)) -> BRCA_HNSC.rnaseq

BRCA_HNSC.surv %>%
   left_join(BRCA_HNSC.rnaseq,
             by = "bcr_patient_barcode") ->
   BRCA_HNSC.surv_rnaseq

BRCA_HNSC.surv_rnaseq <- BRCA_HNSC.surv_rnaseq %>%
   filter(!is.na(cohort))