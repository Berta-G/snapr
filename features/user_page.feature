Feature: See user page

Background:
Given I am on the homepage
And a user exists
And a user logs in

Scenario: Show user page
	And I visit my profile page
	Then I should see my profile
	And I should see snaps I uploaded