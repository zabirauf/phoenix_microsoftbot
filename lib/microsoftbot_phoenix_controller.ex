defmodule MicrosoftBot.Phoenix.Controller do

  defmacro __using__(_) do
    quote do
      require Logger
      use Phoenix.Controller
      alias ExMicrosoftBot.Models, as: Models

      @behaviour MicrosoftBot.Callback

      @callback_handler __MODULE__

      def handle_message(conn, params) do
        resp =
          case Models.Message.parse(params) do
            {:ok, message} -> @callback_handler.message_received(message)
            _ -> resp(conn, 400, "")
          end

        respond.(resp)
      end

      defp respond do
        &responder.respond/1
      end

      defp responder do
        Application.get_env(:microsoftbot, :responder) || MicrosoftBot.Responder
      end
    end
  end

end
