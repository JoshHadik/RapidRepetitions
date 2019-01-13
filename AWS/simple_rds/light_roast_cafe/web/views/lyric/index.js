const CappuccinoView = require(`${appRoot}/lightroast/cappuccino_view.js`);

class LyricIndexView extends CappuccinoView {
  render() {
    return (
      this.props.lyrics.rows.map(lyric => `<div>${lyric.body}</div>`)
      .join('')
      .concat('<div><a href="/drop">RESET</a></div>')
    );
  }
}

module.exports = LyricIndexView;
