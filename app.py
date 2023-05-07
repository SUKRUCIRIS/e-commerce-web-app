import flask 
import query
import os
import shutil
from werkzeug.utils import secure_filename

app=flask.Flask(__name__)

app.config['SECRET_KEY'] = "helloecommercekey"
app.config['UPLOAD_FOLDER'] = "static/images/dbimages/"
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])
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

@app.route("/order/<int:company_id>", methods=['GET', 'POST'])
def company_flask(company_id):
	return flask.render_template("company_page.html",company_id=company_id)

@app.route("/orderhistory", methods=['GET', 'POST'])
def orderhistory_flask():
	return flask.render_template("orderhistory_page.html")

@app.route("/account", methods=['GET', 'POST'])
def account_flask():
	return flask.render_template("account_page.html")

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/uploadimagedb', methods=['POST'])
def upload_image_db():
    file = flask.request.files['file']
    prefix = flask.request.form['prefix']
    if file.filename == '':
        return ""
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        if os.path.exists(app.config['UPLOAD_FOLDER']+prefix):
            shutil.rmtree(app.config['UPLOAD_FOLDER']+prefix, ignore_errors = True)
            os.makedirs(app.config['UPLOAD_FOLDER']+prefix)
        else:
            os.makedirs(app.config['UPLOAD_FOLDER']+prefix)
        file.save(os.path.join(app.config['UPLOAD_FOLDER']+prefix, filename))
        return prefix+filename
    else:
        return ""
    
@app.route("/cart", methods=['GET', 'POST'])
def cart_flask():
	return flask.render_template("cart_page.html")