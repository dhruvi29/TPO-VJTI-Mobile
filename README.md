# TPO VJTI Mobile App
<!-- Description -->
This is a centralized recruitement portal tailored to the needs of Veermata Jijabai Technological Institute (VJTI). With this project we streamline the placement process of our college. It reduces significant amount of manual efforts of the students, CRs and Training and Placement Office of VJTI. The portal provides is with a web interface for administrative tasks and a mobile app to increase the ease of access for students.
### Team Name: Code_Miners
#### Mobile App Contributors
* Anupam Laddha
* Kushal Shah
* Dhruvi Doshi
#### Web App Contributors
You can find the corresponding web app [here](https://github.com/PranitRohokale/TPO-Code_miners)
* Soumil Kamat
* Pranit Rohokale
* Sahil Kedare

## Table of Contents

* [About the Project](#about-the-project)
  * [Current Issues](#current-issues)
  * [Idea](#idea)
  * [User Interfaces](#users-interfaces)
  * [Features](#features-of-mobile-app)
  * [Tech Stack](#tech-stack)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Usage](#usage)
* [Future Work](#future-work)
* [Troubleshooting](#troubleshooting)
* [Acknowledgements](#acknowledgements)


#### Current Issues
* Students have to fill in their personal details (e.g. CPI and other grades, mail Ids, phone number) for each application
  * Repititive manual work
  * Authenticty of data is not known
* Mail spam for TPO-student communication
  * Target students miss relevant news beacuse of the spam
* Data Management
  * Status of students is manually tracked
  * Lack of centralized data store for statistically analysis
#### Idea
The idea is to create a portal which will keep track of all the records of the students, companies , TPO and provide them a smart platform to interact with each other. 
Our goal is to reduce the reliance on manual processes, streamline the processes of the Recruitment to minimize the amount of time and effort required .

### Users Interfaces
* Web: 
    * Admin Interface
    * Recruiter Interface
* App:
    * Student Interface

### Features of Mobile App
* Eligibility check of students based on the TPO policies and application requirements 
* Calendar Interface
* View job postings and apply
* Track application status
* Past Experiences

### Tech Stack
* [Flutter](https://flutter.dev/)
* [Supabase](https://supabase.com/)




## Installation    
#### Prerequisites
* Flutter SDK
#### Procedure
1. Clone the repo
```sh
git clone https://github.com/Kushal-Ajay-Shah/SIMPLE-MINDS.git
```
2. Create the following file 
> lib > constants > supabase_keys.dart
``` dart
abstract class SupabaseConstants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue: '',
  );
}
```

Define the variables when you run the app as follows:
```
flutter run lib/main.dart --dart-define=SUPABASE_URL=url --dart-define=SUPABASE_ANNON_KEY=key
```
## Future Work
- [ ] Report Generation
- [ ] Personalized Notification
- [ ] Blacklisting Students
- [ ] Additional privilages to CRs
- [ ] Tracking off campus placements and future studies

## Troubleshooting
```
flutter clean
flutter build
flutter install
```

## Additonal Links
* [Project Proposal](https://docs.google.com/document/d/18tS0-9OED2pYSUQRYiOzPbNUnX8WpJ4jyxYk1BFUudw/edit?usp=sharing)
* [Project Presentation](https://www.canva.com/design/DAFZH9rrBM0/1f0uF4FOCKAbIpqWRUZWuQ/view?utm_content=DAFZH9rrBM0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

<!-- ACKNOWLEDGEMENTS AND REFERENCES -->
## Acknowledgements
*   VJTI Centenary Hackathon 2023
*   [Community of Coders, VJTI](https://github.com/CommunityOfCoders/) 
*   CE & IT Department of VJTI
*   Training and Placement Office, VJTI