
Feature: Upload snaps

Scenario: Show snap when uploading correctly
	Given I am on the homepage
	And I upload a snap
	Then my snap should exist
	And I should see my snap

Scenario: Not store or show snap when uploading without image
	Given I am on the homepage
	And I upload a snap without image
	Then my snap should not exist
	And I should see the no image error 

Scenario: Not store or show snap when uploading without description
	Given I am on the homepage
	And I upload a snap without description
	Then my snap should not exist
	And I should see the no description error
