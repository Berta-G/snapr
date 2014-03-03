
Feature: Show the snaps on the homepage

Background:
	Given several snaps exist

Scenario: Show snaps
	Given I am on the homepage
	Then I see several snaps
