module DeterminingPriorityForCd4CountTesting
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.CD4_test_for_patients_with_suspected_ART_drug_failure(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Suspected ART drug failure', 'is', 'present', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Order', 'CD4 count test', 'CD4 test for patients with suspected ART drug failure']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + CD4_test_for_patients_with_suspected_ART_drug_failure(patient)
		alerts
	end
end
