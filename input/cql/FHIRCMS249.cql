library AppropriateDXAScansForWomenUnder65FHIR version '0.0.001'

/*
This content is a work in progress and should not be considered a final specification
or recommendation for guidance.
*/

using QICore version '4.1.1'

include FHIRHelpers version '4.1.000' called FHIRHelpers
include QICoreCommon version '1.2.000' called QICoreCommon
include MATGlobalCommonFunctionsQICore4 version '7.0.000' called Global
include SupplementalDataElementsQICore4 version '3.0.000' called SDE
include StatusFHIR version '1.0.0' called Status
include CumulativeMedicationDurationQICore4 version '2.0.000' called CMD
include HospiceQICore4 version '3.0.000' called Hospice

codesystem "LOINC": 'http://loinc.org' 
codesystem "ObservationCategoryCodes": 'http://terminology.hl7.org/CodeSystem/observation-category' 

valueset "Amenorrhea": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1022' 
valueset "Ankylosing Spondylitis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1045' 
valueset "Aromatase Inhibitors": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1265' 
valueset "Bilateral Oophorectomy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.471' 
valueset "Bone Marrow Transplant": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.336' 
valueset "Chemotherapy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.485' 
valueset "Chronic Liver Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1035' 
valueset "Chronic Malnutrition": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1036' 
valueset "Cushings Syndrome": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.117.12.1009' 
valueset "DXA (Dual energy Xray Absorptiometry) Scan": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1051' 
valueset "Eating Disorders": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1039' 
valueset "Ehlers Danlos Syndrome": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1047' 
valueset "End Stage Renal Disease": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.353' 
valueset "Evidence of Bilateral Oophorectomy": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1048' 
valueset "Gastric Bypass Surgery": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1050' 
valueset "Glucocorticoids (oral only)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1266' 
valueset "History of hip fracture in parent": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1040' 
valueset "Hyperparathyroidism": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.117.12.1016' 
valueset "Hyperthyroidism": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.117.12.1015' 
valueset "Kidney Transplant": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.109.12.1012' 
valueset "Lupus": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.117.12.1010' 
valueset "Major Transplant": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.198.12.1075' 
valueset "Malabsorption Syndromes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1050' 
valueset "Marfan's Syndrome": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1048' 
valueset "Multiple Myeloma": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1011' 
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001' 
valueset "Online Assessments": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1089' 
valueset "Osteogenesis Imperfecta": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1044' 
valueset "Osteopenia": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1049' 
valueset "Osteoporosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1038' 
valueset "Osteoporotic Fractures": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1050' 
valueset "Outpatient Consultation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1008' 
valueset "Premature Menopause": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1013' 
valueset "Preventive Care Services Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025' 
valueset "Preventive Care Services Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023' 
valueset "Psoriatic Arthritis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1046' 
valueset "Rheumatoid Arthritis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.113.12.1005' 
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080' 
valueset "Type 1 Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1020' 
valueset "Unilateral Oophorectomy Left": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1028' 
valueset "Unilateral Oophorectomy Right": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1032' 
valueset "Unilateral Oophorectomy, Unspecified Laterality": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1035'

code "Alcoholic drinks per drinking day - Reported": '11287-0' from "LOINC" display 'Alcoholic drinks per drinking day - Reported'
code "Body mass index (BMI) [Ratio]": '39156-5' from "LOINC" display 'Body mass index (BMI) [Ratio]'
code "Female": 'F' from "AdministrativeGender" display 'Female'
code "Left (qualifier value)": '7771000' from "SNOMEDCT" display 'Left (qualifier value)'
code "Major osteoporotic fracture 10-year probability [Likelihood] Fracture Risk Assessment": '90265-0' from "LOINC" display 'Major osteoporotic fracture 10-year probability [Likelihood] Fracture Risk Assessment'
code "Osteoporosis Index of Risk panel": '98133-2' from "LOINC" display 'Osteoporosis Index of Risk panel'
code "Osteoporosis Risk Assessment Instrument": '98139-9' from "LOINC" display 'Osteoporosis Risk Assessment Instrument'
code "Osteoporosis Self-Assessment Tool": '98146-4' from "LOINC" display 'Osteoporosis Self-Assessment Tool'
code "Right (qualifier value)": '24028007' from "SNOMEDCT" display 'Right (qualifier value)'
code "Unlisted preventive medicine service": '99429' from "CPT" display 'Unlisted preventive medicine service'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"

define "Initial Population":
  AgeInYearsAt(date from start of "Measurement Period")in Interval[50, 63]
      and Patient.gender = 'female'
      and exists "Qualifying Encounter"

define "Qualifying Encounter":
  ( ["Encounter": "Office Visit"]
      union ["Encounter": "Preventive Care Services Established Office Visit, 18 and Up"]
      union ["Encounter": "Unlisted preventive medicine service"]
      union ["Encounter": "Preventive Care Services Initial Office Visit, 18 and Up"]
      union ["Encounter": "Outpatient Consultation"]
      union ["Encounter": "Online Assessments"]
      union ["Encounter": "Telephone Visits"] ) ValidEncounters
      where QICoreCommon."ToInterval"(ValidEncounters.period) during day of "Measurement Period"

define "Denominator":
  "Initial Population"

define "Denominator Exclusions":
  "Has Risk Factor Active During the Measurement Period"
      or "Has Risk Factor Any Time in History Prior to Measurement Period"
      or "Has Risk Factor Any Time in History Prior to Measurement Period and Do Not Need to be Active During Measurement Period"
      or "Has Risk Factor Any Time in History or During Measurement Period"

define "Has Risk Factor Active During the Measurement Period":
  "First BMI in Measurement Period Less Than or Equal to 20 kg m2" is not null
      or "First Average Number of Drinks Assessment Indicating More Than Two Per Day" is not null

define "First BMI in Measurement Period Less Than or Equal to 20 kg m2":
  "First BMI in Measurement Period" FirstBMI
              where FirstBMI.value as Quantity <= 20 'kg/m2'

define "First BMI in Measurement Period":
   First((Status."Final Survey Observation"(["observation-bmi"])) BMI
                where QICoreCommon."ToInterval"(BMI.effective)during "Measurement Period"
                  and BMI.value as Quantity is not null
                sort by start of QICoreCommon."ToInterval"(effective)
            )

define "First Average Number of Drinks Assessments Indicating More Than Two Per Day":
  First((Status."Final Survey Observation"([Observation: "Average Number of Drinks per Drinking Day"])) AverageDrinks
                where start of QICoreCommon."ToInterval"(AverageDrinks.effective)during "Measurement Period"
                  and AverageDrinks.value as Quantity > 2 '{drinks}/d'
                sort by start of QICoreCommon."ToInterval"(effective)
            )

define "Has Risk Factor Any Time in History Prior to Measurement Period":
  "Has Osteoporosis Before Measurement Period"
      or "Has Osteopenia Before Measurement Period"

define "Has Osteoporosis Before Measurement Period":
  exists [Condition: "Osteoporosis"] OsteoporosisDiagnosis
              where QICoreCommon."ToPrevalenceInterval" ( OsteoporosisDiagnosis ) starts before start of "Measurement Period"

define "Has Osteopenia Before Measurement Period":
  exists ["Condition": "Osteopenia"] OsteopeniaDiagnosis
      where QICoreCommon."ToPrevalenceInterval"( OsteopeniaDiagnosis ) starts before start of "Measurement Period"

define "Has Risk Factor Any Time in History Prior to Measurement Period and Do Not Need to be Active During Measurement Period":
  exists ( ( (Status."Completed Procedure"(["Procedure": "Gastric Bypass Surgery"])) GastricBypass
          where QICoreCommon."ToInterval" ( GastricBypass.performed ) ends before start of "Measurement Period"
      )
        union ( (Status."Active Medication"(["MedicationRequest": "Aromatase Inhibitors"])) AromataseInhibitorActive
            where QICoreCommon."ToInterval" ( AromataseInhibitorActive.dosageInstruction.timing T return T.event ) starts before start of "Measurement Period"
            or QICoreCommon."ToInterval" ( AromataseInhibitorActive.dosageInstruction.timing T return T.repeat.bounds as Period ) starts before start of "Measurement Period"
        )
        union ( (Status."Active or Completed Medication Request"(["MedicationRequest": "Aromatase Inhibitors"])) AromataseInhibitorOrder
            where QICoreCommon."ToInterval"(AromataseInhibitorOrder.authoredOn) before start of "Measurement Period"
        )
        union "Parent History of Hip Fracture Assessment"
    )

define "Parent History of Hip Fracture Assessment":
  (Status."Final Survey Observation"([Observation: "History of hip fracture in parent"])) ParentFractureHistory
              where start of QICoreCommon."ToInterval" ( ParentFractureHistory.effective ) before start of "Measurement Period"

define "Has Risk Factor Any Time in History or During Measurement Period":
  "Has 90 or More Active Glucocorticoid Medication Days"
      or exists ( "DiagnosisInPatientHistory"(["Condition": "Osteoporotic Fractures"]
            union ["Condition": "Malabsorption Syndromes"]
            union ["Condition": "Chronic Malnutrition"]
            union ["Condition": "Chronic Liver Disease"]
            union ["Condition": "Rheumatoid Arthritis"]
            union ["Condition": "Hyperthyroidism"]
            union ["Condition": "Type 1 Diabetes"]
            union ["Condition": "End Stage Renal Disease"]
            union ["Condition": "Osteogenesis Imperfecta"]
            union ["Condition": "Ankylosing Spondylitis"]
            union ["Condition": "Psoriatic Arthritis"]
            union ["Condition": "Ehlers Danlos Syndrome"]
            union ["Condition": "Cushings Syndrome"]
            union ["Condition": "Hyperparathyroidism"]
            union ["Condition": "Marfan's Syndrome"]
            union ["Condition": "Lupus"]
            union ["Condition": "Multiple Myeloma"]
            union ["Condition": "Premature Menopause"]
            union ["Condition": "Eating Disorders"]
            union ["Condition": "Amenorrhea"]
        )
      )
      or exists "ProcedureInPatientHistory"(["Procedure": "Chemotherapy"])
      or "Has Double or Bilateral Oophorectomy"
      or "Has Organ Transplants"

define "Has 90 or More Active Glucocorticoid Medication Days":
  "Glucocorticoid Active Medication Days" >= 90

define "Glucocorticoid Active Medication Days":
  "Glucocorticoid Active Medication Duration in Days"

define "Glucocorticoid Active Medication Duration in Days":
  CMD."CumulativeDuration" ( ( (Status."Active Medication"([MedicationRequest: "Glucocorticoids (oral only)"])) OralGlucocorticoid
              where CMD."MedicationRequestPeriod" ( OralGlucocorticoid ) starts before 
                end of "Measurement Period" ) Glucocorticoid
              return CMD."MedicationRequestPeriod" ( Glucocorticoid )
                intersect Interval[Patient.birthDate, date from 
                end of "Measurement Period"])

define "Has Organ Transplants":
  exists "ProcedureInPatientHistory"(["Procedure": "Major Transplant"]
        union ["Procedure": "Kidney Transplant"]
        union ["Procedure": "Bone Marrow Transplant"]
    )

define "Has Double or Bilateral Oophorectomy":
  exists ( "ProcedureInPatientHistory"(["Procedure": "Bilateral Oophorectomy"]))
      or exists ( "ProcedureInPatientHistory"(["Procedure": "Evidence of Bilateral Oophorectomy"]))
      or ( exists ( "ProcedureInPatientHistory"((["Procedure": "Unilateral Oophorectomy, Unspecified Laterality"] UnilateralOophorectomy
                where UnilateralOophorectomy.bodySite ~ "Right (qualifier value)"
            )
              union ["Procedure": "Unilateral Oophorectomy Right"]
          )
        )
          and exists ( "ProcedureInPatientHistory"((["Procedure": "Unilateral Oophorectomy, Unspecified Laterality"] UnilateralOophorectomy
                  where UnilateralOophorectomy.bodySite ~ "Left (qualifier value)"
              )
                union ["Procedure": "Unilateral Oophorectomy Left"]
            )
          )
      )

define "Osteoporotic Fracture from Patient History":
  [Condition: "Osteoporotic Fractures"] PathologicalFracture
              where QICoreCommon."ToPrevalenceInterval" ( PathologicalFracture ) starts on or before day of 
              end of "Measurement Period"

define "Numerator":
  exists "DXA Scan Order During Measurement Period"

define "DXA Scan Order During Measurement Period":
  (Status."Completed or Ongoing Service Request"(["ServiceRequest": "DXA (Dual energy Xray Absorptiometry) Scan"])) DXA
      where QICoreCommon."ToInterval"(DXA.authoredOn) during "Measurement Period"
      sort by authoredOn asc

define "Numerator Exclusion":
  exists "Osteoporosis Fracture Risk Assessment Prior to First DXA Scan"

define "Osteoporosis Fracture Risk Assessment Prior to First DXA Scan":
  ( ( (Status."Final Survey Observation"(["Observation": "Major osteoporotic fracture 10-year probability [Likelihood] Fracture Risk Assessment"])) FRAX
        where FRAX.value >= 8.4 '%'
    )
      union ( (Status."Final Survey Observation"(["Observation": "Osteoporosis Risk Assessment Instrument"])) ORAI
          where ORAI.value >= 9
      )
      union ( (Status."Final Survey Observation"(["Observation": "Osteoporosis Index of Risk panel"])) OSIRIS
          where OSIRIS.value < 1.0
      )
      union ( (Status."Final Survey Observation"(["Observation": "Osteoporosis Self-Assessment Tool"])) OST
          where OST.value < 2.0
      ) ) RiskAssessment
      where start of QICoreCommon."ToInterval" ( RiskAssessment.effective ) before First("DXA Scan Order During Measurement Period").authoredOn

define function "ProcedureInPatientHistory"(Procedure List<"Procedure, Performed"> ):
  (Status."Completed Procedure"(Procedure)) Proc
    where QICoreCommon."ToInterval" ( Proc.performed ) ends on or before day of 
    end of "Measurement Period"

define function "DiagnosisInPatientHistory"(Diagnosis List<"Diagnosis"> ):
  Diagnosis Dx
    where QICoreCommon."ToPrevalenceInterval"(Dx) starts on or before day of 
    end of "Measurement Period"
