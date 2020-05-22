function writeSave(){
	//eval writeform = document.writeform;
	var writeform = document.writeform;
	
	if(!writeform.writer.value){
	  alert("작성자를 입력하십시요.");
	  writeform.writer.focus();
	  return false;
	}
	
	if(!writeform.subject.value){
	  alert("제목을 입력하십시요.");
	  writeform.subject.focus();
	  return false;
	}
	
	if(!writeform.content.value){
	  alert("내용을 입력하십시요.");
	  writeform.content.focus();
	  return false;
	}
        
	if(!writeform.passwd.value){
	  alert(" 비밀번호를 입력하십시요.");
	  writeform.passwd.focus();
	  return false;
	}
 };