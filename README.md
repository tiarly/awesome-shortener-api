# Awesome Shortener API [![Build Status](https://travis-ci.org/tiarly/awesome-shortener-api.svg?branch=develop)](https://travis-ci.org/tiarly/awesome-shortener-api)

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com) [![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

This is a simple shortener URL API

## Description

* The application is an api that mimics the behavior of other well known URL shortener API's.
* The available endpoints are:

```
POST /api/v1/shortener_urls

Body:
{
    "shortener_link": { "original_url": "https://tiarly.dev" }
}


Response:
{
    "data": {
        "original_url": "https://tiarly.dev",
        "shortened_url": "http://gentle-shore-57478.herokuapp.com/eQ4oGXzA"
    }
}
```

```
GET /:token

E.g: http://gentle-shore-57478.herokuapp.com/eQ4oGXzA

Response:

Redirect to "http://gentle-shore-57478.herokuapp.com/eQ4oGXzA"
```

## Requirements

Make sure you have these insllated on your machine:

- Docker
- Git
- Postman or curl or any other tool for sending http requests

## Running

```sh
$ git clone https://github.com/tiarly/awesome-shortener-api.git
$ cd awesome-shortener-api
$ docker-compose build
$ docker-compose up
```

And to make sure everything is open and running go to on your browser:

- http://localhost:3000

## Technical Stack

The reason why I chose Rails was basically for a very fast and straight forward
option when building really use cases MVPS.
Eeasy installation for whoever is trying to make use of our API. Not to mention
the fact that it can be also used alongside in another app as a new dependency.
I have tried to write this test solution in way that can provide scalabiliy for
new upcoming features, and to also ensure readability, by creating small classes
with basic responsabilities. That way, it can follow a more smoothly
onboarding process.

This gems is using the follwing gems for self support:

 - bundler (our default dependency manager)
 - pry (for testing purposes only)
 - simplecov (for increase/ensure test coverage)
 - rake (for creating our custom rake tasks)
 - reek (for adding nice linting for code smells)
 - rspec (our BDD testing gem)
 - database_cleaner (For better database cleanup after specs)
 - rubocop (same as reek, but for more general syntax rules)
 - pry-remote (To be able to to help withj debugging when using docker)
 - shoulda-matchers (For better specs matchers and more readable specs)
 - fast_jsonapi (Fast jsonapi serializer for the API)

## Development

After following the steps for installing the dependencies, run `docker-compose run --rm rake spec` to run the tests. You can also run ` docker-compose exec -it awesome-shortener-api_app_1 bin/console` for an interactive prompt that will allow you to experiment.

## TODO

- Add Bearer token Authentication
- Add K8s Configuration files for deployment

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tiarly/awesome-shortener-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/awesome-shortener-api/blob/master/CODE_OF_CONDUCT.md).
This README would normally document whatever steps are necessary to get the
application up and running.
