defmodule MicrosoftBot.Callback do

  @callback message_received(MicrosoftBot.Models.Message.t) :: MicrosoftBot.Models.Message.t | Plug.Conn.t
end
