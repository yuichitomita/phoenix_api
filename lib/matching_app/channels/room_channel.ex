defmodule MatchingApp.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", message, socket) do
    messages = Chat.Message.get
    |> Enum.map(fn {senderId, body} -> %{senderId: senderId, body: body} end)
    {:ok, %{messages: messages}, socket}
  end

  def join("room:" <> _private_subtopic, _message, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new:msg", msg, socket) do
    broadcast! socket, "new:msg", %{senderId: msg["senderId"],user: msg["user"], body: msg["body"]}
    {:reply, {:ok, %{msg: msg["body"]}}, assign(socket, :user, msg["user"])}
  end
end
