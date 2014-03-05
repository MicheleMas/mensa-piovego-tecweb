function openTab() {
	var links = document.getElementsByTagName("a");
	for (var i = 0; i < links.length; i++) {
		if(links[i].getAttribute("class") == "popup") {
			links[i].onclick = function() {
				popUp(this.getAttribute("href"));
				return false;
			}
		}
	}
}

function popUp(url)
{
	window.open(url, "nuovaFinestra");
}

function addDayColor() {
	var date = new Date();
	var day = date.getDay();
	if (day>0 && day<6) {
		var weekday=new Array(6);
		weekday[1]="mon";
		weekday[2]="tue";
		weekday[3]="wed";
		weekday[4]="thu";
		weekday[5]="fri";
		var element = document.getElementById(weekday[day]);
		element.setAttribute("class", 'current_day');
	};
}

function replaceMap() {
	var map = document.getElementById('mapVisualization');
	map.innerHTML = "<iframe id='Gmap_frame' src='https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1400.460291941266!2d11.889645!3d45.410941!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2c00159331ead3d8!2sRistorEsu+Nord+Piovego!5e0!3m2!1sit!2sit!4v1394028372446'></iframe>";
}