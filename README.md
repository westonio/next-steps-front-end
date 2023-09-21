# Next Steps - Project README
# Front-End

Link to [Next Steps Website](https://next-steps-front-end-4778e35e4143.herokuapp.com/) <br/>
Link to [Back-End Microservice](https://github.com/westonio/next-steps-back-end)

## Table of Contents

1. [Project Description](#project-description)
2. [Inspiration](#inspiration)
3. [Testimonials](#testimonials)
4. [Case Studies](#case-studies)
5. [Features](#features)
6. [Usage](#usage)
7. [Future Iterations](#future-iterations)
8. [Contributors](#contributors)
9. [Setup](#setup)
10. [Testing](#testing)
11. [Viewing the Web App](#viewing-the-web-app)

## Setup
- Ruby 3.2.2
- Rails 7.0.7.2
- [Faraday](https://github.com/lostisland/faraday) gem to interact with APIs
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem for code coverage tracking
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) gem for testing assertions
- [VCR](https://github.com/vcr/vcr) / [Webmock](https://github.com/bblimke/webmock) to stub HTTP requests in tests to simulate API interactions
- [Omniouth](https://github.com/omniauth/omniauth) gem for Oauth

## Project Description

**Next Steps** is a full-stack project that leverages the [211 API](https://apiportal.211.org) along with geolocation to assist individuals in finding community resources in their vicinity.  We thought it was particularly important to create search options catered to persons who may not have the ability to navigate existing resources.  This repository contains the front-end portion of the project which utilizes the [API](https://github.com/westonio/next-steps-back-end) provided by the back-end repository.

This project has been deployed using [Heroku](https://id.heroku.com/login), and [Circle CI](https://circleci.com/) was used for Continuous Integration.

### Inspiration
The project draws inspiration from various areas, serving as a tool to support:

- **Mental Health Awareness:** Providing access to mental health resources.
- **The Unhoused Community:** Assisting those experiencing homelessness in finding shelter and services.
- **Justice-Affected Individuals:** Offering support for individuals impacted by the justice system.
- **People with Disabilities:** Ensuring accessibility to resources for individuals with disabilities.

This tool is designed to assist a wide range of professionals, including crisis workers, first responders, social workers, therapists, case managers, or any person looking for community resources.

### Testimonials

*"Right now, I have a list of 12 different links that I use when I research options for my clients.  I would love to have an app that has everything in one place"* - anonymous case manager

*"It is challenging for people with mental health struggles to have the wherewithal to search the internet for resources they need, let alone come up with the 'next step' on their to-do list.  This kind of help is great for them."* - anonymous social worker

*"The hardest part of my job is to find housing for people who have criminal backgrounds.  If there was a way for housing providers to add their listings, I would be grateful"* - housing specialist

### Case Studies

*“I just got out of jail and need a place to go”* => recommend shelters and/or transitional housing 

*“I’m ready for therapy and don’t have insurance”* => connection to Medicaid & providers

*"I need diapers and clothes for my baby”* => connection to family services

*“I have PTSD and will not go to shelters, I live in my car, it's -2 deg outside, where can I park?”* => List of safe lots and emergency shelter options

## Features

### User-Friendly Resource Access
- Users of the app can access community resources anonymously.
- Pre-built search queries are available to streamline the resource-finding process.
- An option to search for resources using keyword endpoints from 211 API.  
- The user has the option to create an account.
- The user can create an account and/or log in using Google OAuth.
- The user is automatically logged out of the session after 15 minutes of inactivity.

### Provider Profiles
- Service providers can create accounts to add information about their specific services.
- Providers offering specialized services such as housing for justice-affected individuals, LGBTQIA+ friendly services, emergency shelter, or any service relevant to vulnerable communities can create profiles to make their services searchable.
- Admin users review provider applications and can approve or deny them.

## Usage

This project is the front-end user experience that utilizes an API endpoint to create convenient search options for the individuals we serve.  The endpoint takes in two parameters, "keyword" and "location".  We provide the user with some keywords built in, such as "basic needs", "shelters", "medical care", "mental health care", and others.  They can select keywords from our provided options, or utilize the search bar to search their own keyword(s).

### Future Iterations

- Scale: Utilize cloud storage to store data for Providers and resource list saved by the user.  
- Utilize [Open AI API](https://openai.com/blog/openai-api) for generating motivational statements based on the user's identified needs.
- Create additional pre-built search options that make finding resources easy and convenient.
- Provider dashboard and Admin functionality.

### Contributors

- [Allen Russell](allenrusselldev@gmail.com) - GitHub: [@garussell](https://github.com/garussell)
- [Weston Schutt](wtschutt@gmail.com)        - GitHub: [@westonio](https://github.com/westonio)
- [Kaina Cockett](kainacockett@gmail.com)    - GitHub: [@kcockett](https://github.com/kcockett)
- [Zanna Fitch](zannafitch@gmail.com)        - GitHub: [@z-fitch](https://github.com/z-fitch)
- [Jorja Flemming](aset284@gmail.com)        - GitHub: [@jorjaf](https://github.com/jorjaf)

---

## Setup
- Fork and Clone the repo
- Navigate into the repo directory `cd next-steps-front-end`
- Install gem packages: `bundle install`
- Setup the database: `rails db:{drop,create,migrate,seed}`

### Testing
- After completing the above setup, run the command `bundle exec rspec`

### Viewing the web app
- Run the command `rails server`
- In your web browser, navigate to your local host `http://localhost:3000`

#### Web View
<img width="1198" alt="Screenshot 2023-09-21 at 4 25 34 PM" src="https://github.com/westonio/next-steps-front-end/assets/117330008/b570fe0c-76d5-443c-84d8-c9ad4fa5a58e">
<img width="1835" alt="Screenshot 2023-09-21 at 4 27 38 PM" src="https://github.com/westonio/next-steps-front-end/assets/117330008/c560b55c-a36f-4bc2-a720-c9ee2c718c10">

#### Mobile View
<img width="333" alt="Screenshot 2023-09-21 at 4 25 58 PM" src="https://github.com/westonio/next-steps-front-end/assets/117330008/8e555593-3689-4a85-b86e-1c9e7ac4fbb0">
<img width="333" alt="Screenshot 2023-09-21 at 4 28 55 PM" src="https://github.com/westonio/next-steps-front-end/assets/117330008/59c16da5-e967-49b5-b451-c1b1f4c2f6f2">
<img width="333" alt="Screenshot 2023-09-21 at 4 29 44 PM" src="https://github.com/westonio/next-steps-front-end/assets/117330008/907ee480-65c1-42be-87a4-1a2a9f3eaef9">
