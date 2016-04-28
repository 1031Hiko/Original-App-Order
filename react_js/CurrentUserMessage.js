export default class CurrentUserMessage extends React.Component{
  render() {
    return(
      <div className="current_message">
        { this.props.message }
      </div>
    );
  }
}