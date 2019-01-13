const CappuccinoView = require(`${appRoot}/lightroast/cappuccino_view.js`);

class LyricIndexView extends CappuccinoView {
  render() {
    return(
      `
        <div>
          <h1> Lyrics </h1>
          ${ this.props.lyrics.map(lyric => `<div>${lyric}</div>`).join("") }
          <div>
            <h3> Add a Lyric </h3>
            <form method="POST" action="/lyrics">
              <label>Enter lyric</label>
              <input type="text" name="lyric"/>
              <button>Submit</button>
            </form>
          </div>
          <div>
            <form method="POST" action="lyrics/clear">
              <button>Clear Lyrics</button>
            </form>
            <form method="POST" action="lyrics/seed">
              <button>Seed Lyrics</button>
            </form>
          </div>
        </div>
      `
    );
  }
}

module.exports = LyricIndexView;
