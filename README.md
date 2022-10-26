# Y00ts Network

## Requirements

- Ruby 3.1.2
- NodeJS

## Installation

```
bundle install
rails db:setup
```

## Configuration

```
cp .env.example .env
```

- Set the `TWITTER_BEARER_TOKEN` value to your Twitter app bearer token
- Run the services to fill your database

```
rake twitter:fetch_y00tlisted_users
rake twitter:fetch_users_profiles
```

- Run the services to match y00ts with categories

```
rake categories:match
```

## Launch

```
foreman start -f Procfile.dev
```
