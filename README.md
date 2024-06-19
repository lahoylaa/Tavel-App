## Travel Wiki Destination App

### Made by:

#### Aeron Lahoylahoy

#### Hannah Vergon

#### Nolan Smith

___

## 1 Abstract

Travel and overall tourism today is more popular and possible than ever before. With the overwhelming amount of places to go, which include countless restaurants, landmarks, and so much more, it can be difficult to plan an itinerary based on your goals on a vacation. Travel Wiki looks to aid in the search for the perfect trip, offering extensive information on attractions close to your destination.

## 2 Introduction

Travel Wiki offers users to sign up to an account to enable the usage of the 'save locations' feature for future reference of spots they may want to visit. The vision of how locations will be stored and retrieved is by using Google Places, an API database system with millions of locations ready for the user to look up. Another feature we hope to implement would allow users to change the radius of their search in order to allow for either condensed or widened areas to search from, which would also most likely depend on the API database.

### 2.1 Use Case Diagram

The diagram in Figure 1 defines the different functions of the app and its dependencies if it has any, such as the search function which depends on the database to function. The registration and login information of the user also has their own designated locations in the database that need to be called to either store new user data or recieve one to confirm login attempts.

<figure align="center">
<img src="https://i.ibb.co/mzSGdqd/Use-Case-Checkpoint1.png" alt="Use-Case-Checkpoint1"
style="width:75%">
<figcaption align = "center"><b>Fig.1 - Use Case Diagram</b></figcaption>
</figure>

### 2.2 Class Diagram

Figure 2 displays the class diagram, and how each class interacts with one another. The most common state for the app is Home where most of the other classes can be accessed from.

<figure align="center">
<img src="https://i.ibb.co/WHtbqL4/Class-Diagram-Checkpoint1.png" alt="Class-Diagram-Checkpoint1"
style="width:65%">
<figcaption align = "center"><b>Fig.2 - Class Diagram</b></figcaption>
</figure>

### 2.3 Sequence Diagram

Figure 3 shows the sequnce diagram for the app. It walks through the chronilogical order of the login/signup process, search process, initial home screen state, and how locations are saved to the user account.

<figure align="center">
<img src="https://i.ibb.co/X7PPF10/Sequence-Diagram-Checkpoint1.png" alt="Sequence-Diagram-Checkpoint1" style="width:50%">
<figcaption align = "center"><b>Fig.3 - Sequence Diagram</b></figcaption>
</figure>

## 3 User Guide/Implementation

### 3.1 Client Side

#### 3.1.1 Creation of Account and Login

Once the Travel Wiki application is installed and opened, the user will be promted to either sign in or create an account. For a first time user, an account will have to be made in order to access the app. Once an account is created, the user must input their username and password, then select login in order to gain access to the home page.

<p align="center">
  <img src="https://i.ibb.co/q7FFrv9/Signup-Page.png" width="400" />
  <img src="https://i.ibb.co/cFb3QVD/Login-Page.png" width="400" /> 
  <figcaption align = "center"><b>Fig.4 - (a) Signup Page (b) Login Page</b></figcaption>
</p>

#### 3.1.2 Home Page

Once one the home page, the user has multiple options to explore. Interacting with the search bar, a location can be input which will lead to the location's dedicated page. Another option is to select the menu button, where the users account information and saved locations can be found. There is also listed the option to sign out or return to the home page here. The sign out button will return the user to the login page while the home button is useful for when users are on a different page and are looking to return.

<p align="center">
  <img src="https://i.ibb.co/xX5PtkW/HomePage.png" width="400" />
  <img src="https://i.ibb.co/JtJvHZ3/Menu-Drawer.png"  width="400" />
  <figcaption align = "center"><b>Fig.5 - (a) Home Page (b) Home Page Menu Drawer</b></figcaption>
</p>

#### 3.1.3 Locations Page

When a user enters a location, the page generates with a picture of the location occupying the top third of the screen, and a list of five cities in that location in the bottom two thirds. Clicking on any of the five cities will route the user to that cities page, which lists the most known locations as well as a list of restaurants and attractions. Either the back button in the upper left can be used to return to the most previous page or the menu can be interacted with in the uppper right to return to whichever desired page.

<p align="center">
  <img src="https://i.ibb.co/g7mSPPV/Location-Page.png" width="400" />
  <img src="https://i.ibb.co/GMwTkG7/CityPage.png"  width="400" />
  <figcaption align = "center"><b>Fig.5 - (a) Location Page (b) City Page</b></figcaption>
</p>

## 4 Risk Analysis and Retrospective

One of the main issues we dealt with near the beginning of the project was our decision to use the Google Locations API to obtain more data for location searches. Soon after we realized the cost of time and money to implement the function would simply not be worth it, so we decided to scrap the idea and instead work with a database that instead had a few manual entries in order to test the app effectively and confirm it was operational. One risk we took that paid off was our decision to make the app account based. Users are able to login and save locations under their own account, which is a feature we're very proud of. Given more time, we believe the API could have been implemented successfully with the program we have now, in addition to being able to make the UI appear more fitting as in it's current state some pages appear bland.

## 5 Conclusion

In summary, the goal for the idea of Travel Wiki has been accomplished. It allows users to search locations and find destinations that will create enjoyable experiences in that city. Although the vision of using the Google API to fully harness an expansive database wasn't fully realized due to constraints, we believe our vision was met and improvements can be made so the app could become even higher quality. 