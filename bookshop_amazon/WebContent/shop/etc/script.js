function checkForm(writeform){

	if(!writeform.book_kind.value){
	  alert("input book kind");
	  writeform.book_kind.focus();
	  return false;
	}
	if(!writeform.book_title.value){
	  alert("input book title");
	  writeform.book_title.focus();
	  return false;
	}
	
	if(!writeform.book_price.value){
	  alert("input price");
	  writeform.book_price.focus();
	  return false;
	}
        
	if(!writeform.book_count.value){
	  alert("input quantity");
	  writeform.book_count.focus();
	  return false;
	}
	
	if(!writeform.author.value){
	  alert("input author");
	  writeform.author.focus();
	  return false;
	}
	
	if(!writeform.publishing_com.value){
	  alert("input publisher");
	  writeform.publishing_com.focus();
	  return false;
	}
	
	if(!writeform.book_content.value){
	  alert("input contents");
	  writeform.book_content.focus();
	  return false;
	}
	
	if(!writeform.discount_rate.value){
		  alert("input dicount rate");
		  writeform.discount_rate.focus();
		  return false;
	}
		
	writeform.action = "bookRegisterPro.jsp";
    writeform.submit();
	
 } 
 
 function updateCheckForm(writeform){

		if(!writeform.book_kind.value){
			  alert("input book kind");
			  writeform.book_kind.focus();
			  return false;
			}
			if(!writeform.book_title.value){
			  alert("input book title");
			  writeform.book_title.focus();
			  return false;
			}
			
			if(!writeform.book_price.value){
			  alert("input price");
			  writeform.book_price.focus();
			  return false;
			}
		        
			if(!writeform.book_count.value){
			  alert("input quantity");
			  writeform.book_count.focus();
			  return false;
			}
			
			if(!writeform.author.value){
			  alert("input author");
			  writeform.author.focus();
			  return false;
			}
			
			if(!writeform.publishing_com.value){
			  alert("input publisher");
			  writeform.publishing_com.focus();
			  return false;
			}
			
			if(!writeform.book_content.value){
			  alert("input contents");
			  writeform.book_content.focus();
			  return false;
			}
			
			if(!writeform.discount_rate.value){
				  alert("input dicount rate");
				  writeform.discount_rate.focus();
				  return false;
			}
		
	writeform.action = "bookUpdatePro.jsp";
    writeform.submit();
	
 } 
 
 function check_num(str){
		if(isNaN(str)){
			alert("only numbuer is allowed");
			return "";
		}else
			return str;
}
 