Feature: Buying a snap

Background:
	Given a user exists
	And several snaps exist
	And I am on the homepage
	And a user logs in

@javascript
Scenario: buy a snap
	Given I visit the snap page
	And I buy the snap
	Then I see a confirmation

