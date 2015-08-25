
      var HelloMessage = React.createClass({
		  render: function() {
			return <div>Hello {this.props.name}</div>;
		  }
		});
		
		var TodoList = React.createClass({
		  render: function() {
			var createItem = function(itemText, index) {
			  return <li key={index + itemText}>{itemText}</li>;
			};
			return <ul>{this.props.items.map(createItem)}</ul>;
		  }
		});
		var TodoApp = React.createClass({
		  getInitialState: function() {
			return {items: [], text: ''};
		  },
		  onChange: function(e) {
			this.setState({text: e.target.value});
		  },
		  handleSubmit: function(e) {
			e.preventDefault();
			var nextItems = this.state.items.concat([this.state.text]);
			var nextText = '';
			this.setState({items: nextItems, text: nextText});
		  },
		  render: function() {
			return (
			  <div>
				<h3>TODO</h3>
				<TodoList items={this.state.items} />
				<form onSubmit={this.handleSubmit}>
				  <input onChange={this.onChange} value={this.state.text} />
				  <button>{'Add #' + (this.state.items.length + 1)}</button>
				</form>
			  </div>
			);
		  }
		});
		
		

var NotesList = React.createClass({
  render: function () {
    var notes = this.props.notepad.notes;

    return (
      <div className="note-list">
      {
        notes.map(function (note) {
          var title = note.content.substring(0,
            note.content.indexOf('\n')
          );
          title = title || note.content;

          return (
            <div key={note.id} className="note-summary">
              {title}
            </div>
          );
        })
      }
      </div>
    );
  }
});
var notepad = {
  notes: [
    {
      id: 1,
      content: "Hello, world!\nBoring.\nBoring.\nBoring."
    },
    {
      id: 2,
      content: "React is awesome.\nSeriously, it's the greatest."
    },
    {
      id: 3,
      content: "Robots are pretty cool.\nRobots are awesome, until they take over."
    },
    {
      id: 4,
      content: "Monkeys.\nWho doesn't love monkeys?"
    }
  ]
}