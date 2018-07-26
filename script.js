


function goToLoading(num) {
	   var form1 = document.getElementById('form1');
	   var url;
	 //페이
	   if(num===1) {
	      url = 'loading_pay.jsp';
	   }
	   //이체
	   else if(num===2) {
	      url = "loading_trans.jsp";
	   }
	   //보험
	   else if(num===3) {
	      url = "loading_loan.jsp";
	   }
	   //대출
	   else {
	      url = "loading_insur.jsp";
	   }
	   form1.acceptCharset = 'utf-8';
	   form1.action = url;
	   form1.submit();
}
$(function() {

   $("#userId").focus();
   $(".user_id").focus(function(){
      
      $(this).removeClass("user_id_on")
            .addClass("user_id_out");
      
   });
   
   $(".user_id").blur(function(){
      
      if ( $(this).val() == "" ) {
         
         $(this).removeClass("user_id_out")
               .addClass("user_id_on");
         
      }
      
   });
   
   $(".user_pwd").focus(function(){
      
      $(this).removeClass("user_pwd_on")
            .addClass("user_pwd_out");
      
   });
   
   $(".user_pwd").blur(function(){
      
      if ( $(this).val() == "" ) {
         
         $(this).removeClass("user_pwd_out")
               .addClass("user_pwd_on");
         
      }
      
   });
   $('#USERPW').keyup(function(e) {
      if (  e.keyCode == 13 ) {
         fn_submit();
      }
   });
   
});