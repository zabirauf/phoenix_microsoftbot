defmodule MicrosoftBot.Router do

  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__)
    end
  end

  @spec microsoftbot_routes(String.t, module) :: any
  defmacro microsoftbot_routes(path, controller) do
    quote do

      pipeline :microsoftbot do
        plug :accepts, ["json"]
        plut :bot_authenticate
      end

      scope "/" do
        pipe_through :microsoftbot
        post unquote(path), unquote(controller), :handle_message
      end

      defp bot_authenticate(conn, _) do
        case ExMicrosoftBot.Client.validate_bot_credentials(get_bot_auth_data, conn.req_headers) do
          true -> conn
          false -> resp(conn, 403, "")
        end
      end

      defp get_bot_auth_data() do
        %ExMicrosoftBot.Models.AuthData{
          app_id: Application.get_env(:microsoftbot, :app_id),
          app_secret: Application.get_env(:microsoftbot, :app_secret)
        }
      end
    end
  end
end
