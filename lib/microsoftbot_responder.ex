defmodule MicrosoftBot.Responder do
  @moduledoc """
  Module responsible for responding back to phoenix plug
  """

  @doc """
  Handle the response that needs to be sent back for the request
  """
  @spec respond(Plug.Conn.t, Plug.Conn.t) :: any
  def respond(%Plug.Conn{} = resp, _conn) do
    Plug.Conn.send_resp(resp)
  end

  @doc """
  Handle the response that needs to be sent back for the request
  """
  @spec respond(map, Plug.Conn.t) :: any
  def respond(%{} = message, conn) do
    Phoenix.Controller.json(conn, message)
  end
end
