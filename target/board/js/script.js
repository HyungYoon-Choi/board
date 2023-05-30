function findIdPw(){
	const url = "/board/member/findIdPw.jsp";
	const width=500, height=350;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let top = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
	
	window.open(url, "popup", `width=${width}, height=${height}, left=${left}, top=${top}`);
}

function memLevel(e, i, num) {
  const val = e.value;
  const mems = ["탈퇴회원", "일반회원", "유료회원", "VIP 회원"];
  let y = confirm("회원정보를" +mems[val]+ "으로 수정하시겠습니까?");

  if (y) {
    // 회원정보수정
    fetch("/board/LevelUpdate?level=" + val + "&num=" + num)
      .then(res => {
        if (!res.ok) {
          throw new Error("네트워크 연결이 안됨");
        }
        return res.json();
      })
      .then(data => {
        if (data > 0) {
          alert("수정했습니다.");
        } else {
          alert("문제가 발생했습니다. 다시 시도하세요.");
          location.reload();
        }
      })
      .catch(error => {
        console.error("Error fetching data:", error);
        alert("문제가 발생했습니다. 다시 시도하세요.");
        location.reload();
      });
  } else {
	 e.options[i].selected = true;
	  return false;
  }
}

$(document).ready(function() {
	$('#summernote').summernote({
    	placeholder: 'Enter your message here...',
        height: 150,
        toolbar: [
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', ['strikethrough']],
          ['para', ['ul', 'ol']],
          ['insert', ['link', 'picture']],
    	]
	});
});

function boardReg(){
	const title = document.getElementById("title");
	const username = document.getElementById("username");
	const content = document.getElementById("summernote");
	
	if(title.value==""){
		alert("제목을 입력하세요.");
		title.focus();
		return false;
	}else if(username.value==""){
		alert("작성자를 입력하세요.");
		username.focus();
		return false;
	}else if(content.value==""){
		alert("내용을 입력하세요.");
		content.focus();
		return false;
	}
	
	document.freelist.submit();
}
