defmodule MicrosoftBot.Router do
  @moduledoc """
  This module defines the routes needed to handle messages from the Microsoft bot service
  """

  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__)
    end
  end

  @doc """
  Responsible for defining routes necessary to communicate with the Microsoft bot service

  The route is
  - post /api/message for getting messages

  It takes the controller that uses `MicrosoftBot.Phoenix.Controller`

  ## Examples

  Defining the controller
  ```
  defmodule MessageController do
    use MicrosoftBot.Phoenix.Controller

    def message_received(%MicrosoftBot.Models.Message{} = message) do
      # ...
      # send message back or resp(conn, 200, "")
    end
  end
  ```

  In the `routes.ex`
  ```
  defmodule YourApp.Router do
    use YourApp.Web, :router

    # Add the following two lines
    use MicrosoftBot.Router
    microsoftbot_routes "/api/message", MessageController
  end
  ```

  ## Parameters:
  - `path` the path you want use for receiving messages
  - `controller` the controller you want to use to handle the received messages
  """
  @spec microsoftbot_routes(String.t, module) :: any
  defmacro microsoftbot_routes(path, controller) do
    quote do

      pipeline :microsoftbot do
        plug :accepts, ["json"]
        plug :bot_authenticate
      end

      scope "/" do
        pipe_through :microsoftbot
        post unquote(path), unquote(controller), :handle_message
      end

      defp bot_authenticate(conn, _) do
        case ExMicrosoftBot.TokenValidation.validate_bot_credentials?(conn.req_headers) do
          true -> conn
          false -> resp(conn, 403, "") |> halt
        end
      end

    end
  end
end
