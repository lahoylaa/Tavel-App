## Travel Wiki Destination App

### Made by:

#### Aeron Lahoylahoy

#### Hannah Vergon

#### Nolan Smith

___

## 1 Abstract

Travel and overall tourism today is more popular and possible than ever before. With the overwhelming amount of places 
to go, which include countless restaurants, landmarks, and so much more, it can be difficult to plan an itinerary based on your goals on a vacation. Travel Wiki looks to aid in the search for the perfect trip, offering extensive information on attractions close to your destination.

## 2 Introduction

Travel Wiki offers users to sign up to an account to enable the usage of the 'save locations' feature for future reference of spots they may want to visit. The vision of how locations will be stored and retrieved is by using Google Places, an API database system with millions of locations ready for the user to look up. Another feature we hope to implement would allow users to change the radius of their search in order to allow for either condensed or widened areas to<br />search from.

### 2.1 Use Case Diagram

The diagram in Figure 1 defines the different functions of the app and its dependencies if it has any, such as the search function which depends on the database to function.

<figure>
<img src="https://i.ibb.co/mzSGdqd/Use-Case-Checkpoint1.png" alt="Use-Case-Checkpoint1"
style="width:100%">
<figcaption align = "center"><b>Fig.1 - Use Case Diagram</b></figcaption>
</figure>

### 2.2 Class Diagram

Figure 2 displays the class diagram, and how each class interacts with one another. The most common state for the app is Home where most of the other classes can be accessed from.

<figure>
<img src="https://i.ibb.co/WHtbqL4/Class-Diagram-Checkpoint1.png" alt="Class-Diagram-Checkpoint1"
style="width:100%">
<figcaption align = "center"><b>Fig.2 - Class Diagram</b></figcaption>
</figure>

### 2.3 Sequence Diagram

Figure 3 shows the sequnce diagram for the app. It walks through the chronilogical order of the login/signup process, search process, initial home screen state, and how locations are saved to the user account.

<figure>
<img src="https://i.ibb.co/X7PPF10/Sequence-Diagram-Checkpoint1.png" alt="Sequence-Diagram-Checkpoint1" style="width:100%">
<figcaption align = "center"><b>Fig.3 - Sequence Diagram</b></figcaption>
</figure>

## 3 User Guide/Implementation

### 3.1 Client Side

#### 3.1.1 Creation of Account and Login

Once the Travel Wiki application is installed and opened, the user will be promted to either sign in or create an account. For a first time user, an account will have to be made in order to access the app. Once an account is created, the user must input their username and password, then select login in order to gain access to the home page.

#### 3.1.2 Home Page

Once one the home page, the user has multiple options to explore. Interacting with the search bar, a location can be input which will lead to the location's dedicated page. Another option is to select the menu button, where the users account information and saved locations can be found.

## 4 Risk Analysis and Retrospective