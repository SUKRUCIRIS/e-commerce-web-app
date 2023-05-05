import flask 
import query

app=flask.Flask(__name__)

app.config['SECRET_KEY'] = "helloecommercekey"

qh=query.query_helper()

@app.route("/", methods=['GET', 'POST'])
@app.route("/login", methods=['GET', 'POST'])
def login_flask():
	return flask.render_template("login_page.html")

@app.route("/register", methods=['GET', 'POST'])
def register_flask():
	return flask.render_template("register_page.html")

@app.route("/query", methods=['GET', 'POST'])
def query_flask():
	query_param = flask.request.args.get('query_param')
	result = {'status': 'success', 'data': qh.query(query_param)}
	return flask.jsonify(result)