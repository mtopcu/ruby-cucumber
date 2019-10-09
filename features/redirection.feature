Feature: GeoIP redirects
  Desktop users that visits the site should be redirected when possible.
  Mobile device users must always be redirected.

Scenario: Desktop user in given location and with given language should be redirected to given site
  When I redicrected