document.write(`
<script>
function navbar_hamburger_change(x, y) {
  x.classList.toggle("change");
  y.classList.toggle("change");
}
document.addEventListener("DOMContentLoaded",function() {
	let session=JSON.parse(localStorage.getItem("session_info"));
	let link=document.getElementById("link");
	if(session.low_admin){
		link.innerHTML="Company";
		link.href="/lowadmin";
	}
	else if(session.high_admin){
		link.innerHTML="Database";
		link.href="/highadmin";
	}
	else{
		link.remove();
	}
});
</script>
<nav id="navbar">
	<a href="/home">Home</a>
	<a href="/order">Order</a>
	<a href="/cart">Cart</a>
	<a href="/orderhistory">Order History</a>
	<a href="/account">Account</a>
	<a id="link"></a>
	<div class="hamburger" onclick="navbar_hamburger_change(this,document.getElementById('navbar'))">
		<div class="bar1"></div>
		<div class="bar2"></div>
		<div class="bar3"></div>
	</div>
</nav>
`);