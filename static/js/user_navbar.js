document.write(`
<script>
function navbar_hamburger_change(x, y) {
  x.classList.toggle("change");
  y.classList.toggle("change");
}
</script>
<nav id="navbar">
	<a href="{{ url_for('user_home_flask') }}">Home</a>
	<a href="{{ url_for('user_order_flask') }}">Order</a>
	<a href="{{ url_for('user_order_history_flask') }}">Order History</a>
	<a href="{{ url_for('user_account_flask') }}">Account</a>
	<div class="hamburger" onclick="navbar_hamburger_change(this,document.getElementById('navbar'))">
		<div class="bar1"></div>
		<div class="bar2"></div>
		<div class="bar3"></div>
	</div>
</nav>
`);