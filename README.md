[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/zabirauf/phoenix_microsoftbot/master/LICENSE.md) [![hex.pm version](https://img.shields.io/hexpm/v/phoenix_microsoftbot.svg?style=flat)](https://hex.pm/packages/phoenix_microsoftbot) [![Build Status](https://travis-ci.org/zabirauf/phoenix_microsoftbot.svg?branch=master)](https://travis-ci.org/zabirauf/phoenix_microsoftbot) [![Inline docs](http://inch-ci.org/github/zabirauf/phoenix_microsoftbot.svg)](http://inch-ci.org/github/zabirauf/phoenix_microsoftbot) <a href="http://github.com/syl20bnr/spacemacs"><img src="https://cdn.rawgit.com/syl20bnr/spacemacs/442d025779da2f62fc86c2082703697714db6514/assets/spacemacs-badge.svg" alt="Made with Spacemacs"></a>

# Phoenix Microsoft Bot

This library allows for easy creation of the web API that the Microsoft bot framework can connect to.

## Documentation

API documentation is available at [https://hexdocs.pm/phoenix_microsoftbot](https://hexdocs.pm/phoenix_microsoftbot)

## Installation

  1. Add ex_microsoftbot to your list of dependencies in `mix.exs`:

        def deps do
          [{:phoenix_microsoftbot, "~> 1.0.0"}]
        end

## Usage
To create the Web API for Microsoft Bot Framework to connect to requires three steps

1. Defining the controller
```
defmodule MessageController do
  use MicrosoftBot.Phoenix.Controller

  def message_received(%MicrosoftBot.Models.Message{} = message) do
    # ...
    # send message back or resp(conn, 200, "")
  end
end
```

2. In the `routes.ex`
```
defmodule YourApp.Router do
  use YourApp.Web, :router

  # Add the following two lines
  use MicrosoftBot.Router
  microsoftbot_routes "/api/message", MessageController
end
```

3. Add `:microsoftbot` configuration in `prod.exs`
```
config :microsoftbot,
  app_id: "APP_ID",
  app_secret: "APP_SECRET"
```
