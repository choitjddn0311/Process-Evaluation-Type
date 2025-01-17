function cust(){
	const custName = document.getElementById("custName");
	const custNum = document.getElementById("custNum");
	custNum.value = custName.value;
	const className = document.getElementById("className");
	const classMoney = document.getElementById("classMoney");
	classMoney.value = className.value;
	if(custName.value > 20000){
		classMoney.value = className.value/2;
	}
}
function ck(f){
	if(f.date.value==""){
		alert("수강월이 입력되지 않았습니다");
		f.date.focus();
		return false;
	}
	if(f.cust_name.value==""){
		alert("회원명이 입력되지 않았습니다");
		f.cust_name.focus();
		return false;
	}
	if(f.place.value==""){
		alert("강의장소가 선택되지 않았습니다");
		f.cust_name.focus();
		return false;
	}
	if(f.class_name.value==""){
		alert("강의명이 선택되지 않았습니다");
		f.class_name.focus();
		return false;
	}
}
