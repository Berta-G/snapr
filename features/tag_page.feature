Feature: See tag page

Background:
Given I am on the homepage
And a user exists
And a user logs in
And I upload a snap with multiple tags

Scenario: Show snap page
	Then my tags should exist
	Then I visit the tag page
	And I should see the tag and related pictures
