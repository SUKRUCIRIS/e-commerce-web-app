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

@app.route("/query", methods=['POST'])
def query_flask():
	query_param = flask.request.form['query_param']
	return flask.jsonify(qh.query(query_param))

@app.route("/home", methods=['GET', 'POST'])
def home_flask():
	return flask.render_template("home_page.html")

@app.route("/order", methods=['GET', 'POST'])
def order_flask():
	return flask.render_template("order_page.html")

@app.route("/orderhistory", methods=['GET', 'POST'])
def orderhistory_flask():
	return flask.render_template("orderhistory_page.html")

@app.route("/account", methods=['GET', 'POST'])
def account_flask():
	return flask.render_template("account_page.html")