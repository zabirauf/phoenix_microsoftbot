defmodule MicrosoftBot.Phoenix.Controller do
  @moduledoc """
  This module defines the basic methods required to use the Microsoft bot service
  ## Examples

  Defining the controller
  ```
  defmodule MessageController do
    use MicrosoftBot.Phoenix.Controller

    def message_received(%MicrosoftBot.Models.Activity{} = activity) do
    # ...
    # send message back or resp(conn, 200, "")
    end
  end
  ```
  """

  defmacro __using__(_) do
    quote do
      require Logger
      use Phoenix.Controller
      alias ExMicrosoftBot.Models, as: Models

      @behaviour MicrosoftBot.Callback

      @callback_handler __MODULE__

      def handle_message(conn, params) do
        resp =
          case Models.Activity.parse(params) do
            {:ok, message} -> @callback_handler.message_received(conn, message)
            _ -> resp(conn, 400, "")
          end

        respond(resp, conn)
      end

      defp respond(resp, conn) do
        responder.respond(resp, conn)
      end

      defp responder do
        Application.get_env(:phoenix_microsoftbot, :responder) || MicrosoftBot.Responder
      end
    end
  end

end
