Feature: See tag page

Background:
Given I am on the homepage
And a user exists
And a user logs in
And I upload a snap with multiple tags

Scenario: Show snap page
	Then I visit the tag page
	Then I should see the tags
