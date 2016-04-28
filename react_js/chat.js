import CompanionMessage from './CompanionMessage'
import CurrentUserMessage from './CurrentUserMessage'
import ChatForm from './ChatForm'

class Chat extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      messages: this.props.messages,
      group_id: this.props.group,
      current_user: this.props.current_user,
      type: this.props.type
    }
  }


  saveMessage(message){
    $.ajax({
      type: "POST",
      url: "/api/chats",
      data: { content: message, group_id: this.state.group_id },
      dataType: "JSON",
    })
    .done( (data) => {
      this.setState({ messages: data.chat_messages })
      socket.emit("sendMessage", data.chat_messages)
    })

    .fail( (xhr, status, error) => {
      console.log(this.props.url, status, error.toString());
    });
  }

  componentDidMount(){
    socket.on("receiveMessage", (messages) => {
      this.messageReceive(messages)
    })
  }

  messageReceive(messages) {
    this.setState({ messages })
  }

  render() {
    var messages = this.state.messages.map((message) => {
      if ((message.user_id === this.state.current_user.id)&&(message.user_type === this.state.type)) {
        return <CurrentUserMessage message={message.content}/>
      } else {
        return <CompanionMessage message={message.content} />
      }
    });

    return(
      <div className="chats">
        <div className="chat_message_area">
          { messages }
        </div>
        <div className="chat_form">
          <ChatForm onSaveMessage={this.saveMessage.bind(this)} />
        </div>
      </div>
    );
  }
}

window.Chat = Chat