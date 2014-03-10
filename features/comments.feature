Feature: Create comments 

Background:
Given a user exists
And several snaps exist
And I am on the homepage
And a user logs in

Scenario: Comment on a snap
	Given I visit the snap page
	And I comment on the snap
	Then my comment should exist
	And I should see the comment