# Y00ts Network

## Requirements

- Ruby 3.1.2
- NodeJS

## Installation

```
bundle install
rake db:setup
```

## Configuration

```
cp .env.example .env
```

Set the `TWITTER_BEARER_TOKEN` valeu to your Twitter app bearer token

## Launch

```
foreman start -f Procfile.dev
```
