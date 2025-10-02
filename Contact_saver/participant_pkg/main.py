
# importing libaries
from pathlib import Path 
import file_ops
import csv
# define workspace
workspace = Path("workspace_files")
csv_path = workspace / "contact_saved.csv"

# function to get name of particioant with validation
def get_namme():
    while True:
        try:
            name = input("Enter your name: ").strip() # collects user's input and removes whitespace
            if (len(name) == 0) or (name.isdigit() == True): #validates user's input
                print("Name can\'t be empty or number.\nEnter a name.") # error message
            else:
                return name # valid name
        except ValueError:
            print("\nName can\'t be a number")
        except Exception:
            print("\nAn Error occured")

# function to get age of particioant with validation
def get_age():
    while True:
        try:
            age = input("Enter your Age: ").strip() # collects user's input and remove whitespace
            if not age.isnumeric():#validates user's input, confirms the in put is numeric
                print("Age can only be a number.") #error message
            else:
                age_int = int(age) #changes the age to an interger
                if age_int <= 17: #set age restriction
                    print("Too young to register\nMust be 18years and above to register") #error message
                else:
                    return age_int #returns valid age
        except Exception:
            print("\nAn Error occured")

# function to get number of participant with validation
def get_phone():
    while True:
        try:
            phone = input("Enter your phone number: ").strip() # collects user's input and remove whitespace
            if not phone.isnumeric():#validates user's input, confirms the in put is numeric
                print("Phone number can only be digits") #error message
            elif len(phone) != 11: # confirms the length of number is 11
                print("Enter a valid number") #error message
            else:
                return phone #returns valid number
        except Exception:
            print("\nAn Error occured")

# function to get track of participant with validation
def get_track():
    while True:
        try:
            track = input("Enter your track: ").strip()# collects user's input and remove whitespace
            if (len(track) == 0) or (track.isdigit() == True):#validates user's input, confirms it's not empty or numbers
                print("track can\'t be empty or number.\nEnter a track.") #error message
            else:
                return track # returns valid track
        except Exception:
            print("\nAn Error occured")


def main():
    while True:
        print("Welcome to Tee's 3-day Tech workshop,where you can learn about Tech and different Tech careers path.\nHow to get started, How to pivot from one path to another, how to position yourself and how thread through the tech workspace.\nWe promise to ensure the event is exciting and educative. Bring all your question and doubts, let's answer it and help you get started on your tech career")
        try:
            name = get_namme()
            age = get_age()
            phone = get_phone()
            track = get_track()   

            participant_dict = {"Name":name, "Age":age, "Phone":phone, "Track":track}
            try:
                file_ops.save_participant(csv_path, participant_dict)
                print("Participant details saved to csv file")
                add_another = input("Do you want to add another participant? yes or no: ")
                if add_another == "no":
                    print("participant saved")
                    file_ops.load_participant(csv_path)
                    break
                
            except Exception:
                print("An error occured while trying to save  the contact")
        except Exception as e:
            print("An unexpected error occured:",e)

if __name__ == "__main__":
    main()






            
