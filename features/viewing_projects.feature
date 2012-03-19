Feature: Creating Projects
    In order to have projects to assign tickets to them
    As a user
    I want to be able to see a list of available projects

    Background: 
        Given there are the following users:
        | email              | password |
        | user@ticketee.com | password |
        And I am signed in as them
        And there is a project called "Textmate 2"
        And "user@ticketee.com" can view the "Textmate 2" project

    Scenario: Listing all project
        And I am on the homepage
        When I follow "Textmate 2"
        Then I should be on the project page for "Textmate 2"

