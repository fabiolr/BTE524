//: Playground - noun: a place where people can play
import Foundation // Needed for Dates

// Formattinf Date to interpret Strings in data dump
let dateFormatter = NSDateFormatter()
dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
dateFormatter.dateFormat = "MM/dd/yyyy"

// some globals needed to pass data out of future loops
var ssn: String!
var days: Int!
var email: String!
var age: Int!
let userCalendar = NSCalendar.currentCalendar()
let today = NSDate()



// data dump

var patientNames = [ "John Lennon", "Paul McCartney", "George Harrison", "Ringo Starr" ];
var patientEmails = [ "jlennon@beatles.com",
    "pmccartney@another.edu", "george@something.com", "drummer@beatles.org" ];
var patientSSN = [ "123-45-6789", "333-22-1123", "567-39-9282", "888-88-8888" ];
var patientBirthDates = [ "05/01/1951", "06/23/1964", "09/05/1955", "02/28/2001" ];
var doctorNames = ["John Smith", "Jane Doe", "Mary Jones", "Beth Garcia" ];
var doctorEmails = [ "jsmith@doc.com", "jdoe@doc.com",
    "mjones@doc.com", "bgarcia@doc.com" ];
var doctorSSN = [ "445-25-3382", "582-10-9983", "180-38-0038",
    "343-34-9875" ];
var doctorBirthDates = [ "06/03/1941", "10/10/1950",
    "12/25/1965", "07/19/1964" ];

// enumaration for specialties

enum Specialty {
    
    case General_Medicine, Pediatrics, Oncology
}

var spec: Specialty!


// a class used same class for doctor or patient, as fields are similar

class Person {
    
    var name = ""
    var email = ""
    var ssn = ""
    var birthday: NSDate
    var specialty: Specialty?
    
    init(name: String, email: String, ssn: String, birthday:NSDate) {
        self.name = name
        self.email = email
        self.ssn = ssn
        self.birthday = birthday
        
    }
}


// create empty containers

var patients: [Person] = []
var doctors: [Person] = []

// pour data into containers

for var i = 0; i < patientNames.count; i++
    
{
    var newDate = dateFormatter.dateFromString(patientBirthDates[i])
    var patient = Person(name: patientNames[i], email: patientEmails[i], ssn: patientSSN[i], birthday: newDate!)
    newDate = dateFormatter.dateFromString(doctorBirthDates[i])
    var doctor = Person(name: doctorNames[i], email: doctorEmails[i], ssn: doctorSSN[i], birthday: newDate!)
    
    patients.append(patient)
    doctors.append(doctor)
}


// manually add specialties

doctors[0].specialty = Specialty.General_Medicine
doctors[1].specialty = Specialty.Pediatrics
doctors[2].specialty = Specialty.General_Medicine
doctors[3].specialty = Specialty.Oncology

// dump visits data

var schedule = [

["John Lennon", "John Smith", "03/11/2013"],
["John Lennon", "John Smith", "04/11/2013"],
["Ringo Starr", "Jane Doe", "03/25/2013"],
["Jane Doe", "John Smith", "03/11/2013"],
["Paul McCartney", "Mary Jones", "04/09/2013"],
["George Harrison", "Beth Garcia", "04/09/2013"]]


// iterate each appointment to gather data for report

for appointment in schedule {
    

    var appDate = dateFormatter.dateFromString(appointment[2])
    
    // Calculate days between today and the appointment day
    let dayCalendarUnit: NSCalendarUnit = [.Day]
    let days = userCalendar.components(
        dayCalendarUnit,
        fromDate: today,
        toDate: appDate!,
        options: [])
    
 
    // iterate patients to grab more info on each patient for report.
    
    for thisPatient in patients where thisPatient.name == appointment[0] {

        ssn = thisPatient.ssn
        email = thisPatient.email
        
        // Calculate Patient Age
        
            let ageComp = userCalendar.components(
            dayCalendarUnit,
            fromDate: thisPatient.birthday,
            toDate: today,
            options: [])
            age = ageComp.day/365
        
        
        }
    
    // iterate docttors to grab more info on each doctor for report.

    
    for doctor in doctors where doctor.name == appointment[1] {
        
        spec = doctor.specialty
        
    }
    
    // Make a nice date in String to show

    let newFormat = NSDateFormatter()
    newFormat.dateFormat = "MMM dd, yyyy"
    let dateString = newFormat.stringFromDate(appDate!)
    
    // Separate First from Last Name
    
    let splittedPatient = appointment[0].characters.split{$0 == " "}.map(String.init)
    

    // Console output
    
    print("Visit Date: \t\t\t\t \((dateString))")
    print("Doctor: \t\t\t\t\t \(appointment[1])")
    print("Specialty: \t\t\t\t \(spec)")
    print("Days until Visit: \t\t\t\(days.day)")
    print("Patient:")
    print("\tFirst Name:\t\t\t \(splittedPatient[0])")
    print("\tLast Name:\t\t\t\t \(splittedPatient[1])")
    print("\temail:\t\t\t\t \(email)")
    print("\tSSN:\t\t\t\t\t \(ssn)")
    print("\tAge:\t\t\t\t\t \(age)")
    print("")
    
}

    print("---------------------------------------")

// need to do other 2 reports, but basically the same logic..


