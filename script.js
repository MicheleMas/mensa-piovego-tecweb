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