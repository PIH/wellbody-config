-- This file is used to set up Physical Exam form

set @concept_id = 0;

-- Physical Exam concept set
call ensure_concept(@concept_id, '62f8a311-5ced-43f1-8d25-312dff60209b', 'Physical exam','Physical exam', 'N/A', 'ConvSet', true);
set @physical_exam_concept_id = @concept_id;

-- Add "Physical Exam" to "All Observation Templates" concept set
call ensure_concept(@concept_id, '7eb83ffc-e42f-11e5-8c3e-08002715d519', 'All Observation Templates','All Observation Templates', 'N/A', 'ConvSet', true);
set @obs_templates_concept_id = @concept_id;
call ensure_concept_set_members(@obs_templates_concept_id, @physical_exam_concept_id, 3);

-- 1. Exam ConvSet
call ensure_concept(@concept_id, '41BA03B8-3FFB-4B76-B5C2-168D6E78DF8F', 'Exam','Exam', 'N/A', 'ConvSet', true);
set @examm_concept_id = @concept_id;
call ensure_concept_set_members(@physical_exam_concept_id, @examm_concept_id, 1);
-- HEENT data
call ensure_concept(@concept_id, '3cd75b86-26fe-102b-80cb-0017a47871b2', 'HEENT data','HEENT', 'N/A', 'Concept Details', true);
set @heent_data_concept_id = @concept_id;
call ensure_concept_set_members(@examm_concept_id, @heent_data_concept_id, 1);

-- Status
call ensure_concept(@concept_id, 'ABB8A739-32CA-436D-B260-0E512A4797EB', 'Status','Status', 'Coded', 'Misc', false);
set @status_concept_id = @concept_id;
call ensure_concept_set_members(@heent_data_concept_id, @status_concept_id, 1);
-- Normal
call ensure_concept(@concept_id, '3cd750a0-26fe-102b-80cb-0017a47871b2', 'Normal','Normal', 'N/A', 'Misc', false);
set @normal_concept_id = @concept_id;
call ensure_concept_answer (@status_concept_id, @normal_concept_id, 1);
-- Abnormal
call ensure_concept(@concept_id, '3cd75230-26fe-102b-80cb-0017a47871b2', 'Abnormal','Abnormal', 'N/A', 'Misc', false);
set @abnormal_concept_id = @concept_id;
call ensure_concept_answer (@status_concept_id, @abnormal_concept_id, 2);
-- N/A
call ensure_concept(@concept_id, '313780DC-B884-40A8-B939-DDAD1A5CEE3B', 'Not Applicable','N/A', 'N/A', 'Misc', false);
set @n_a_concept_id = @concept_id;
call ensure_concept_answer (@status_concept_id, @n_a_concept_id, 3);


