module ManagingFirstLineRegimenInChildrenXx
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.prescribing_triomune_baby(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('weight', '<', '10', patient, 'kg') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Eligible for ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'Triomune baby', 'prescribing triomune baby']
	
		end
		actions
	end
				
		
	def self.when_triomune_baby_is_unavailable(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('weight', '<', '10', patient, 'kg') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Eligible for ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Drug is NOT available', 'is', 'Triomune baby', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'Split T30', 'when triomune baby is unavailable']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + prescribing_triomune_baby(patient)
		alerts = alerts + when_triomune_baby_is_unavailable(patient)
		alerts
	end
end
