Feature: Creating Projects
    In order to have projects to assign tickets to them
    As a user
    I want to be able to see a list of available projects

    Scenario: Listing all project
        Given there is a project called "Textmate 2"
        And I am on the homepage
        When I follow "Textmate 2"
        Then I should be on the project page for "Textmate 2"

