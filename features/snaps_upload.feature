
Feature: Upload snaps

Background:
Given I am on the homepage
And a user exists
And a user logs in

Scenario: Show snap when uploading correctly
	And I upload a snap
	Then my snap should exist
	And I should see my snap

Scenario: Not store or show snap when uploading without image
	And I upload a snap without image
	Then my snap should not exist
	And I should see the no image error 

Scenario: Not store or show snap when uploading without description
	And I upload a snap without description
	Then my snap should not exist
	And I should see the no description error

Scenario: Not allow uploading without login
	When I log out
	Then I am not able to snap



