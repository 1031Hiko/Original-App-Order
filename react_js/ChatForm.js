export default class ChatForm extends React.Component{
  setHandler(){
    var $input = $("input[name='chat_message']")
    this.props.onSaveMessage($input.val())
    $input.val("")
  }

  render() {
    return(
      <div>
        <input type="textarea" name="chat_message" />
        <button className="btn btn-primary" onClick={ this.setHandler.bind(this) } >送信</button>
      </div>
    );
  }
}