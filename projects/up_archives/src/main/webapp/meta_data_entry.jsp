<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">
function popIt(url) {
	var leftPos = screen.width - 720;
	ref = window.open(url,"thePop","menubar=1,resizable=1,scrollbars=1,status=1,height=400,width=710,left="+leftPos+",top=0")
	ref.focus();
}

function killPopUp() {
	if(!ref.closed) {
	ref.close();
	}
}
</script>
</head>

<body>
 <p>1. Click here: <a href="http://www.webdeveloper.com" target="ref" onclick="popIt(this.href);return false;">Open html page in a popup</a></p>
 <p>2. Click here: <a href="javascript:killPopUp();">Close the popup</a> </p>
 <p>3. Click here: <a href="http://www.orimi.com/pdf-test.pdf" target="ref" onclick="popIt(this.href);return false;">Open pdf in a popup</a> </p>
 <p>4. Click here: <a href="javascript:killPopUp();">Close the popup</a></p>
 <p>Both popups are created using the exact same function. The attempt to close the popups is performed by the same function. The html page closes, but the pdf does not. Why??? </p>
</body>
</html>



