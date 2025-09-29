# importing libaries
import csv 
from pathlib import Path 


# creating a new folder and the specifing the path of the csv
workspace = Path("workspace_files")
workspace.mkdir(exist_ok=True)
csv_path = workspace / "contact.csv"
csv_path
# define the column header for the csv files
fieldnames = ["Name", "Age", "Phone", "Track"]

#function to save participant dictionary to csv file
def save_participant(csv_path,  participant_dict):
    if type(participant_dict) == dict:
        participant_dict = [participant_dict]
    if csv_path.exists():
         with open(csv_path,"a",newline="",encoding="utf-8" ) as f:
            write = csv.DictWriter(f,fieldnames=fieldnames)
            write.writerows(participant_dict)
    else:
        print(f"File{csv_path} doesn\'t exist, Creating now!")
        with open(csv_path,"w",newline="",encoding="utf-8") as f:
            write = csv.DictWriter(f,fieldnames=fieldnames)
            write.writeheader()
            write.writerows(participant_dict)

                  
print("Participant details written to CSV file")

#function to load participant details from csv
def load_participant(csv_path):
    print("\nReading CSV file:")
    if csv_path.exists():
        with open(csv_path, "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            
            for row_number, row in enumerate(reader):
                if row_number == 0:  # Header row
                    print(f"Headers: {' | '.join(row)}")
                    print("-" * 40)
                else:  # Data rows
                    name, age, phone, track = row
                    print(f"{name} {age}  {phone} {track}")
    else:
        print("No Participant saved yet.")


