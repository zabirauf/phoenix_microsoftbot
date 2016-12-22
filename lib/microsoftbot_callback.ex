defmodule MicrosoftBot.Callback do
  @moduledoc """
  The module defines the callback required to handle the activity receieved
  """

  @doc """
  Callback to handle the activity received
  """
  @callback message_received(Plug.Conn.t, ExMicrosoftBot.Models.Activity.t) :: Plug.Conn.t
end
