// 정규식

// 아이디, 비밀번호 영문 대소문자, 숫자, 최소4자 이상 8자 이하.
const uidPw = /^[a-zA-Z0-9]{4,8}$/;

// 이름
const uname = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

// 이메일
const uemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

// 전화번호
const utel = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

window.onload = function(){
	if(getCookie("user")){
		document.getElementById("userid").value=getCookie("user");
		document.loginform.huid.checked = true;
	};
};

function register(){
	// 변수 정의
	const userid = document.getElementById("userid");
	const userpass = document.getElementById("userpass");
	const reuserpass = document.getElementById("reuserpass");
	const username = document.getElementById("username");
	const useremail = document.getElementById("useremail");
	const postcode = document.getElementById("postcode");
	const addr = document.getElementById("addr");
	const detailaddr = document.getElementById("detailaddr");
	const tel1 = document.getElementById("tel1");
	const tel2 = document.getElementById("tel2");
	const tel3 = document.getElementById("tel3");
	const tel = tel1.value + "-" + tel2.value + "-" + tel3.value;
	const useridok = document.getElementById("useridok");
	
	// 아이디 확인
	if(userid.value == ""){
		alert("아이디를 입력하세요.")
		userid.focus();
		return false;
	}else if(!uidPw.test(userid.value)){
		alert("아이디는 영문, 숫자 4자 이상 8자 이하 입니다.");
		userid.value = "";
		userid.focus();
		return false;
	}else if(userpass.value == ""){
		alert("비밀번호를 입력하세요.");
		userpass.focus();
		return false;
	}else if(userpass.value != reuserpass.value ){
		alert("비밀번호가 다릅니다. 비밀번호를 다시 확인하세요.");
		reuserpass.value = "";
		reuserpass.focus();
		return false;
	}else if(!uidPw.test(userpass.value)){
		alert("비밀번호는 영문, 숫자 4자 이상 8자 이하 입니다.");
		userpass.value = "";
		userpass.focus();
		return false;
	}else if(username.value == ""){
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}else if(!uname.test(username.value)){
		alert("제대로 입력하세요.");
		username.value = "";
		username.focus();
		return false;
	}else if(useremail.value == ""){
		alert("이메일을 입력하세요.");
		useremail.focus();
		return false;
	}else if(!uemail.test(useremail.value)){
		alert("이메일 형식이 아닙니다.");
		useremail.value = "";
		useremail.focus();
		return false;
	}else if(addr.value == ""){
		alert("주소를 입력하세요.");
		addr.focus();
		return false;
	}else if(tel1.value == ""){
		alert("전화번호를 입력하세요.");
		tel1.focus();
		return false;
	}else if(tel2.value == ""){
		alert("전화번호를 입력하세요.");
		tel2.focus();
		return false;
	}else if(tel3.value == ""){
		alert("전화번호를 입력하세요.");
		tel3.focus();
		return false;
	}else if(!utel.test(tel)){
		alert("제대로 입력하세요.");
		tel1.focus();
		return false;
	};
	document.getElementById("tel").value=tel;
	//이상 없을 경우 submit
	document.registerform.submit();
};

function getIp(json){
	document.getElementById("uip")
}

function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddr").focus();
            }
        }).open();
    }

function loginSubmit(){
	const form = document.loginform;
	const is_checked = form.huid.checked;
	
	if(form.userid.value==""){
		alert("아이디를 입력하세요.");
		form.userid.focus();
		return false;
	}else if(form.userpass.value==""){
		alert("비밀번호를 입력하세요.");
		form.userpass.focus();
		return false;
	}
	if(is_checked){ //체크박스에 체크 되어 있으면 
		setCookie('user', form.userid.value, '3');
	}else{
		// 체크가 되어 있지 않다면 쿠키를 삭제한다.
		delCookie('user');
	}
	
	form.submit();
}


function isChecked(){
	const chk = document.loginform.huid;
	const is_checked = chk.checked;
	
	if(is_checked){
		let y = confirm("아이디를 저장하시겠습니다. \n  공공장소에서는 추천하지 않습니다.");
		if(y == false){
			chk.checked = false;
		}
	}
}
function register2(){
	// 변수 정의
	const userid = document.getElementById("userid");
	const userpass = document.getElementById("userpass");
	const reuserpass = document.getElementById("reuserpass");
	const username = document.getElementById("username");
	const useremail = document.getElementById("useremail");
	const postcode = document.getElementById("postcode");
	const addr = document.getElementById("addr");
	const detailaddr = document.getElementById("detailaddr");
	const tel1 = document.getElementById("tel1");
	const tel2 = document.getElementById("tel2");
	const tel3 = document.getElementById("tel3");
	const tel = tel1.value + "-" + tel2.value + "-" + tel3.value;
	const useridok = document.getElementById("useridok");
	
	// 아이디 확인
	if(userid.value == ""){
		alert("아이디를 입력하세요.")
		userid.focus();
		return false;
	}else if(!uidPw.test(userid.value)){
		alert("아이디는 영문, 숫자 4자 이상 8자 이하 입니다.");
		userid.value = "";
		userid.focus();
		return false;
	}
	//else if(userpass.value == ""){
		//alert("비밀번호를 입력하세요.");
		//userpass.focus();
		//return false;
	else if(userpass.value != reuserpass.value ){
		alert("비밀번호가 다릅니다. 비밀번호를 다시 확인하세요.");
		reuserpass.value = "";
		reuserpass.focus();
		return false;
	}else if(!uidPw.test(userpass.value)){
		alert("비밀번호는 영문, 숫자 4자 이상 8자 이하 입니다.");
		userpass.value = "";
		userpass.focus();
		return false;
	}else if(username.value == ""){
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}else if(!uname.test(username.value)){
		alert("제대로 입력하세요.");
		username.value = "";
		username.focus();
		return false;
	}else if(useremail.value == ""){
		alert("이메일을 입력하세요.");
		useremail.focus();
		return false;
	}else if(!uemail.test(useremail.value)){
		alert("이메일 형식이 아닙니다.");
		useremail.value = "";
		useremail.focus();
		return false;
	}else if(addr.value == ""){
		alert("주소를 입력하세요.");
		addr.focus();
		return false;
	}else if(tel1.value == ""){
		alert("전화번호를 입력하세요.");
		tel1.focus();
		return false;
	}else if(tel2.value == ""){
		alert("전화번호를 입력하세요.");
		tel2.focus();
		return false;
	}else if(tel3.value == ""){
		alert("전화번호를 입력하세요.");
		tel3.focus();
		return false;
	}else if(!utel.test(tel)){
		alert("제대로 입력하세요.");
		tel1.focus();
		return false;
	};
	document.getElementById("tel").value=tel;
	//이상 없을 경우 submit
	document.edtregisterform.submit();
};




















