# Parent Class
class Person:
    def __init__(self, name, age, city):
        self.name = name
        self.age = age
        self.city = city

    def get_details(self):
        return f"{self.name} | Age: {self.age} | {self.city}"

# Child Class
class Patient(Person):
    # Class attributes
    WALKIN, APPOINTMENT = range(2)

    def __init__(self, patient_type, patient_id, *args, **kwargs):
        # Instance attributes
        self.patient_type = patient_type
        self.patient_id = patient_id
        self.treatments = []
        # Call parent constructor
        super(Patient, self).__init__(*args, **kwargs)

    def add_treatment(self, treatment):
        self.treatments.append(treatment)
        print(f"{self.name} enrolled for: {treatment}")

    def get_patient_profile(self):
        type_label = "Walk-in" if self.patient_type == 0 else "Appointment"
        return f"{self.get_details()} - {type_label} | ID: {self.patient_id}"

# Creating and using a Patient object
rohan = Patient(Patient.WALKIN, "CWC2024001", "Rohan Mehta", 29, "Mumbai")
print(rohan.get_patient_profile())   # Uses both parent and child methods
rohan.add_treatment("Blood Test")
rohan.add_treatment("ECG")
print(f"Treatments received: {', '.join(rohan.treatments)}")