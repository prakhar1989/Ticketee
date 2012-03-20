Feature: Hidden Links
    In order to clean up the user experience
    As the systerm
    I want to hide links from users who can't act on them

    Background:
    Given there are the following users:
        | email              | password | admin |
        | user@ticketee.com  | password | false |
        | admin@ticketee.com | password | true  |
    And there is a project called "Textmate 2"
    And "user@ticketee.com" can view the "Textmate 2" project
    And "user@ticketee.com" has created a ticket for this project:
        | title              | description       |
        | Shiny!             | My eyes! My eyes! |


    Scenario: New project link is hidden for non-signed-in users
        Given I am on the homepage
        Then I should not see the "New Project" link

    Scenario: New project link is hidden for signed-in users
        Given I am signed in as "user@ticketee.com"
        Then I should not see the "New Project" link

    Scenario: New project link is shown for admin users
        Given I am signed in as "admin@ticketee.com"
        Then I should see the "New Project" link

    Scenario: Edit project link is hidden for signed-in users
        Given I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        Then I should not see the "Edit Project" link

    Scenario: Edit project link is shown for admin users
        Given I am signed in as "admin@ticketee.com"
        When I follow "Textmate 2"
        Then I should see the "Edit Project" link

    Scenario: Delete project link is hidden for signed-in users
        Given I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        Then I should not see the "Delete Project" link

    Scenario: Delete project link is shown for admin users
        Given I am signed in as "admin@ticketee.com"
        When I follow "Textmate 2"
        Then I should see the "Delete Project" link

    Scenario: New ticket link is shown to a user with permission
        Given "user@ticketee.com" can view the "Textmate 2" project
        And "user@ticketee.com" can create tickets on the "Textmate 2" project
        And I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        Then I should see "New Ticket"
        
    Scenario: New ticket link is hidden from a user without permission
        Given "user@ticketee.com" can view the "Textmate 2" project
        And I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        Then I should not see "New Ticket"

    Scenario: Edit ticket link is shown to a user with permission
        Given "user@ticketee.com" can view the "Textmate 2" project
        And "user@ticketee.com" can edit tickets on the "Textmate 2" project
        And I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        And I follow "Shiny!"
        Then I should see the "Edit" link

    Scenario: Edit ticket link is hidden from a user without permission
        Given "user@ticketee.com" can view the "Textmate 2" project
        And I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        And I follow "Shiny!"
        Then I should not see the "Edit" link

    Scenario: Edit ticket link is shown to admins
        And I am signed in as "admin@ticketee.com"
        When I follow "Textmate 2"
        And I follow "Shiny!"
        Then I should see the "Edit" link

    Scenario: Delete ticket link is shown to a user with permission
        Given "user@ticketee.com" can view the "Textmate 2" project
        And "user@ticketee.com" can delete tickets in the "Textmate 2" project
        And I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        And I follow "Shiny!"
        Then I should see "Delete"

    Scenario: Delete ticket link is hidden from a user without permission
        Given "user@ticketee.com" can view the "Textmate 2" project
        And I am signed in as "user@ticketee.com"
        When I follow "Textmate 2"
        And I follow "Shiny!"
        Then I should not see the "Delete" link

    Scenario: Delete ticket link is shown to admins
        Given I am signed in as "admin@ticketee.com"
        When I follow "Textmate 2"
        And I follow "Shiny!"
        Then I should see the "Delete" link

