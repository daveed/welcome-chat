# # Using ActionCable::TestCase
# class ChatCableTest < ActionCable::TestCase
#   def test_broadcasts
#     # Check the number of messages broadcasted to the stream
#     assert_broadcasts 'messages', 0
#     ActionCable.server.broadcast 'messages', { text: 'hello' }
#     assert_broadcasts 'messages', 1

#     # Check the number of messages broadcasted to the stream within a block
#     assert_broadcasts('messages', 1) do
#       ActionCable.server.broadcast 'messages', { text: 'hello' }
#     end

#     # Check that no broadcasts has been made
#     assert_no_broadcasts('messages') do
#       ActionCable.server.broadcast 'another_stream', { text: 'hello' }
#     end
#   end
# end

# Or including ActionCable::TestHelper
class ChatCableTest < ActionDispatch::IntegrationTest
  include ActionCable::TestHelper

  def test_broadcasts
    room = rooms(:news)

    assert_broadcast_on("messages:#{room.id}", text: 'Hello!') do
      post "/room_messages", xhr: true, params: { message: 'Hello!', room_id: room.id }
    end
  end
end
