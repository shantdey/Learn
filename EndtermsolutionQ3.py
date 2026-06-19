# Raw candidate input
name       = "  RAHul SHARma  "
email      = "Rahul.Sharma@Quickhire.COM"
skills_raw = "python, Data Analysis,sql ,Power BI, python"
summary    = "i am a data analyst with 3 years of experience."
phone      = "9988001122"

#  Clean the name
clean_name = name.strip().title()
print(f"Cleaned Name     : {clean_name}")

#  Normalise the email and extract domain
clean_email = email.lower()
at_pos      = clean_email.find("@")
domain      = clean_email[at_pos + 1:]            # slicing from @ onwards
print(f"Email (lowercase): {clean_email}")
print(f"Domain           : {domain}")

#  Process and deduplicate skills
skills_list   = [skill.strip().title() for skill in skills_raw.split(",")]
unique_skills = list(set(skills_list))            # remove duplicates
skills_str    = " | ".join(unique_skills)
print(f"Skills           : {skills_str}")

# Fix summary capitalisation and check first word
fixed_summary = summary.capitalize()
starts_with_i = fixed_summary.startswith("I")
print(f"Summary          : {fixed_summary}")
print(f"Starts with 'I'  : {starts_with_i}")

#  Format the phone number using slicing
formatted_phone = f"+91-{phone[:5]}-{phone[5:]}"
print(f"Phone (formatted): {formatted_phone}")
f1 = phone[2:6]
print(f1)
# Build the final profile card
print(f"""
---------- Candidate Profile ----------
Name    : {clean_name}
Email   : {clean_email}
Phone   : {formatted_phone}
Skills  : {skills_str}
Summary : {fixed_summary}
----------------------------------------""")