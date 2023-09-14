# Next Steps - Project README
# Front-End

## Table of Contents

1. [Project Description](#project-description)
2. [Inspiration](#inspiration)
3. [Testamonials](#testamonials)
4. [Case Studies](#case-studies)
5. [Features](#features)
6. [Usage](#usage)
7. [Future Iterations](#future-iterations)
8. [Contributors](#contributors)

## Setup
- Ruby 3.2.2
- Rails 7.0.7.2
- Faraday gem to interact with APIs
- SimpleCov gem for code coverage tracking
- ShouldaMatchers gem for testing assertions
- VCR / Webmock to stub HTTP requests in tests to simulate API interactions

## Project Description

Next Step is full-stack project that leverages the [211 API](https://apiportal.211.org) along with geolocation to assist individuals in finding community resources in their vicinity.  This repository contains the front-end portion of the project which utlizes the [API](https://github.com/westonio/next-steps-back-end) provided by the back-end repository.

### Inspiration
The project draws inspiration from various areas, serving as a tool to support:

- **Mental Health Awareness:** Providing access to mental health resources.
- **The Unhoused Community:** Assisting those experiencing homelessness in finding shelter and services.
- **Justice-Affected Individuals:** Offering support for individuals impacted by the justice system.
- **People with Disabilities:** Ensuring accessibility to resources for individuals with disabilities.

This tool is designed to assist a wide range of professionals, including crisis workers, first-responders, social workers, therapists, case managers, or any person looking for community resources.

### Testimonials

*"Right now, I have a list of 12 different links that I use when I research options for my clients.  I would love to have an app that has everything in one place"* - anonomous case manager

*"It is challening for people with mental health struggles to have the wherewithal to search for internet for resources they need, let alone come up with the 'next step' on their to do list.  This kind of help is great for them."* - anonomous social worker

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
- The user has the option to create an account and save their search results to a list that is ordered by priority.

### Provider Profiles
- Service providers can create accounts to add information about their specific services.
- Providers offering specialized services such as housing for justice-affected individuals, LGBTQIA+ friendly services, emergency shelter, or any service relevant to vulnerable communities can create profiles to make their services searchable.
- Provider application are reviewed by Admin users and can be approved or denied by Admin.

## Usage

This project is the front-end user experience that utilzes an API endpoint to create convienient search options for individuals we serve.  The endpoint takes in two parameters, "keyword" and "location".  We proivde the user with some keywords built in, such as "basic needs", "shelters", "medical care", "mental health care", and others.  They can select keywords from our provided options, or utilize the search bar to search their own keyword(s).

### Future Iterations

- Scale: Utlize cloud storage to store data for Providers and resources.  
- Utilze Open AI API for generating motivational statements based on user's identified needs.
- Create more endpoints for specialized searches.  

### Contributors

- [Allen Russell](allenrusselldev@gmail.com) - GitHub: @garussell
- [Weston Schutt](wtschutt@gmail.com)        - GitHub: @westonio
- [Kaina Cockett](kainacockett@gmail.com)    - GitHub: @kcockett
- [Zanna Fitch](zannafitch2004@gmail.com)    - GitHub: @z-fitch
- [Jorja Flemming](aset284@gmail.com)        - GitHub: @jorjaf