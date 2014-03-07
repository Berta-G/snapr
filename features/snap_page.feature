Feature: See snap page

Background:
Given I am on the homepage
And a user exists

Scenario: Show snap page
	And I visit the snap page
	Then I should see the snap
