function init_calculator(){
  var ipt=document.getElementsByName("calculator_input");
  var re=ipt[0];
  var char=ipt[5];
  var numb=[ipt[30],ipt[22],ipt[23],ipt[24],ipt[14],ipt[15],ipt[16],ipt[6],ipt[7],ipt[8]];
  var operate_char=["+","-","*","/","sin","cos","tan","sqrt","xy","1x","+-","log","n!","PI","E","=","M","GM","Ma","CM","Mul","%","Round","100"];
  var operate=[ipt[9],ipt[17],ipt[25],ipt[33],ipt[10],ipt[18],ipt[26],ipt[11],ipt[27],ipt[19],ipt[32],ipt[34],ipt[35],ipt[38],ipt[39],ipt[40],ipt[13],ipt[21],ipt[29],ipt[37],ipt[36],ipt[12],ipt[20],ipt[28]];
  var os=true,opc="",lastopc="=",reopc=false;
  var temp=0,M=0,lastnum=0;
  for(var i=0;i<numb.length;i++){numb[i].onclick=input_number;}
  for(var i=0;i<operate.length;i++){operate[i].i=i;operate[i].onclick=set_operate;}
  ipt[31].onclick=input_dot;
  ipt[3].onclick=clear_all;
  ipt[2].onclick=clear;
  ipt[4].onclick=backone;
  //back
  function backone(){if(!os){var tp=re.value;if(tp.length>1){re.value=tp.slice(0,tp.length-1);}else{re.value=0;}}}
  //input_dot
  function input_dot(){if(re.value.length>49){return false;}if(!(/\./).exec(re.value)){if(os){os=false;re.value=this.value;}else{re.value+=this.value;}}}
  //input_number
  function input_number(){
    if(re.value.length>49){return false;}
    if(os){
	  os=false;
	  re.value=this.value;
	}else if(re.value=="0"||re.value==null){
	  re.value=this.value;
	}else{
	  re.value+=this.value;
	}
	lastnum=re.value;
	if(reopc){opc="";reopc=false;}	
  }
  //clear
  function clear(){re.value="";}
  //clear_all
  function clear_all(){re.value="0";temp=0;os=true;char.value="Null";lastnum=0;opc="";}
  //factorial
	function factorial(n) {
		n = Math.abs(parseInt(n));
		var fac = 1;
		for (; n > 0; n -= 1) {
			fac *= n;
		}
		return (fac);
	}
	//math_func
  function Math_func(func){
     switch(func){
	   case "PI":
	      re.value=Math.PI;
		  if(reopc){opc="";reopc=false;}
		  os=false;
		  lastnum=re.value;
	   break;
	   case "E":
	      re.value=Math.E;
		  if(reopc){opc="";reopc=false;}
		  os=false;
		  lastnum=re.value;
	   break;
	   case "sin":
	     re.value=Math.sin(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "cos":
	     re.value=Math.cos(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "tan":
	     re.value=Math.tan(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "sqrt":
	     re.value=Math.sqrt(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "log":
	     re.value=Math.log(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "n!":
	     if(re.value>200){var tips=confirm("运算量过大，可能会造成系统缓慢！\n确定要运行吗？");if(!tips){return false;}}
	     re.value=factorial(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "1x":
	     os=true;
	     if(re.value=="0"){alert("除数不能为0");return false;}
	     re.value=1/parseFloat(re.value);
		 temp=parseFloat(re.value);
	   break;
	   case "Round":
	     re.value=Math.floor(re.value);
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "100":
	     re.value=Math.round(re.value*100)/100;
		 temp=parseFloat(re.value);
		 os=true;
	   break;
	   case "M":
	     M=parseFloat(re.value);
		 os=true;
	   break;
	   case "GM":
	     re.value=M;
		 lastnum=M;
		 os=true;
	   break;
	   case "Ma":
	     M+=parseFloat(re.value);
	   break;
	   case "CM":
	     M=0;
	   break;
	   case "Mul":
	     M*=parseFloat(re.value);
		 os=true;
	   break;
	 }
  }
  //set_operate
  function set_operate(){
    char.value=this.value;
    var currentopc=operate_char[this.i];
	var oper="d|sin|cos|tan|sqrt|1x|log|n!|PI|E|Round|100|M|GM|Ma|CM|Mul";
	if(oper.indexOf(currentopc)>0){Math_func(currentopc);return false;}
	  if (currentopc == "+-") {
		  if (os) {
			  re.value = "-";
			  os = false;
			  if (reopc) {
				  opc = "";
				  reopc = false;
			  }
		  } else {
			  var tn = re.value == "-" ? 0 : parseFloat(re.value);
			  if (tn > 0) {
				  re.value = 0 - tn;
			  } else {
				  re.value = Math.abs(tn);
			  }
			  temp = parseFloat(re.value);
		  }
		  return false;
	  }
	  reopc=false;
	  if (opc == "") {
		  temp = parseFloat(re.value);
		  opc = "=";
		  lastopc = currentopc;
		  os = true;
		  return false;
	  }
	  if(currentopc!="="){opc=lastopc;lastopc=currentopc;if(os){os=true;return false;}}else{opc=lastopc;reopc=true;}
	switch(opc){
	   case "+":
	      temp+=parseFloat(lastnum);
	   break;
	   case "-":
	      temp-=parseFloat(lastnum);
	   break;
	   case "*":
	      temp*=parseFloat(lastnum);
	   break;
	   case "/":
	      if(lastnum==0){alert("除数不能为0！");}else{temp/=parseFloat(lastnum);}
	   break;
	   case "xy":
	      temp=Math.pow(temp,lastnum);
	   break;
	   case "%":
	     temp=temp%lastnum;
	   break;
	}
	re.value=temp;
	os=true;
  }
}
