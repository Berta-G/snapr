Feature: See snap page

Background:
Given I am on the homepage
And a user exists
And a user logs in
And I upload a snap

Scenario: Show snap page
	Then I visit the snap page
	Then I should see the snap
	And my snap should have a link to user page
