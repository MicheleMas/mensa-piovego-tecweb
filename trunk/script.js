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
	map.innerHTML = "<iframe class='stampano' id='Gmap_frame' src='https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1400.460291941266!2d11.889645!3d45.410941!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2c00159331ead3d8!2sRistorEsu+Nord+Piovego!5e0!3m2!1sit!2sit!4v1394028372446'></iframe><img id=\"Gmap\" class=\"stampasi\" src=\"images/map_mobile.png\" alt=\"Mappa raffigurante la posizione della mensa Piovego.\" />";
}

function checkEmail(lang) {
	var string = document.getElementById("email").value;
	var errorMessage = document.getElementById("emailErrors");
	var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (regex.test(string)) {
    	errorMessage.innerHTML = "";
    	return true;
    } else {
    	if (lang=="ita") {
    		errorMessage.innerHTML = "La mail non è corretta";
    	} else {
    		errorMessage.innerHTML = "Please check your mail address";
    	}
    	return false;
    };
}

function checkName(lang) {
	var string = document.getElementById("nome").value;
	var errorMessage = document.getElementById("nameErrors");
	if (string.length < 2) {
		if (lang=="ita") {
			errorMessage.innerHTML = "Inserire un nome con almeno due caratteri";
		} else {
			errorMessage.innerHTML = "Insert a name with at least two characters";
		}
		return false;
	} else {
		errorMessage.innerHTML = "";
		return true;
	};
}

function checkComment(lang) {
	var string = document.getElementById("comment_text").value;
	var errorMessage = document.getElementById("commentErrors");
	if (string.length < 2) {
		if (lang=="ita") {
			errorMessage.innerHTML = "Inserire un commento con almeno due caratteri";
		} else {
			errorMessage.innerHTML = "Insert a comment with at least two characters";
		}
		return false;
	} else {
		errorMessage.innerHTML = "";
		return true;
	};
}

function completeCheck(lang) {
	var check1 = checkName(lang);
	var check2 = checkEmail(lang);
	var check3 = checkComment(lang);
	if (check1 && check2 && check3) {
		return true;
	} else {
		return false;
	}
}

function resetErrors() {
	var errorMessage1 = document.getElementById("emailErrors");
	var errorMessage2 = document.getElementById("nameErrors");
	var errorMessage3 = document.getElementById("commentErrors");
	errorMessage1.innerHTML = "";
	errorMessage2.innerHTML = "";
	errorMessage3.innerHTML = "";
}