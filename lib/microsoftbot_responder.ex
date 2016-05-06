defmodule MicrosoftBot.Responder do
  @moduledoc """
  Module responsible for responding back to phoenix plug
  """
  def respond(conn) do
    Plug.Conn.send_resp(conn)
  end
end
