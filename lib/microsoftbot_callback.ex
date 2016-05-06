defmodule MicrosoftBot.Callback do
  @moduledoc """
  The module defines the callback required to handle the messages receieved
  """

  @doc """
  Callback to handle the messages received
  """
  @callback message_received(Plug.Conn.t, ExMicrosoftBot.Models.Message.t) :: ExMicrosoftBot.Models.Message.t | Plug.Conn.t
end
