export default class ChatMessage extends React.Component {
  render() {
    return(
      <div className="companion_message">
        { this.props.message }
      </div>
    );
  }
}
