Feature: Person Birth
  Scenario: An editor can set birth info at Person creation
    Given I am logged in as an editor
    When I visit the new person page
      And I fill in valid person data
      And I enter "1/1/1880" for "Birth Date"
      #And I fill in "Durham, NC" for "Birth Place"
      And I click "Submit"
    Then I am on the person show page
      And I see the date "1/1/1880"
      #And I see the place "Durham, NC"

  Scenario: An editor can modify birth info after Person creation
    Given I am logged in as an editor
      And there is a person with the name "John Smith"
    When I visit the person index page
      And I click "John"
      And I click "Edit"
      And I enter "2/2/1900" for "Birth Date"
      And I click "Submit"
    Then I am on the person show page
      And I see the date "2/2/1900"
