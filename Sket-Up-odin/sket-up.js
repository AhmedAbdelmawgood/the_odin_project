var x = document.getElementsByClassName("wrapper")[0];
function enterr(){
var b = 0;
while(b != 1 ){
		var entry = prompt("enter an Even Number not greater than 100");
		switch(true){
			case entry>100:
				alert("pls number less than 100")
				break;
			case entry%2 != 0:
			alert("even number only pls");
			break;
			case entry%2==0:
			b=1;
			break;
			default:
			alert(entry);
			
		}
	}
		var squareNumber=entry*entry;

for(var i = 0; i <squareNumber;i++){
	var squareArea=600*600/squareNumber;
	var theSide=Math.sqrt(squareArea)
	var newNode = document.createElement("DIV");
	newNode.classList.add("newStyle");
	newNode.style.width=theSide-2+"px";
	newNode.style.height=theSide-2+"px";
	x.appendChild(newNode);
}
$(document).ready(function(){
	$(".newStyle").mouseenter(function(){
	this.style.backgroundColor="red";
	})
	$(".newStyle").mouseleave(function(){
	this.style.backgroundColor="#5252ff";
	})
});
}
function enterr2(){
	var b = 0;
	while(b != 1 ){
			var entry = prompt("enter an Even Number not greater than 100");
			switch(true){
				case entry>100:
					alert("pls number less than 100")
					break;
				case entry%2 != 0:
				alert("even number only pls");
				break;
				case entry%2==0:
				b=1;
				break;
				default:
				alert(entry);
				
			}
		}
	var squareNumber=entry*entry;

	for(var i = 0; i <squareNumber;i++){
		var squareArea=600*600/squareNumber;
		var theSide=Math.sqrt(squareArea)
		var newNode = document.createElement("DIV");
		newNode.classList.add("newStyle");
		newNode.style.width=theSide-2+"px";
		newNode.style.height=theSide-2+"px";
		x.appendChild(newNode);
	}
	$(document).ready(function(){
		$(".newStyle").mouseenter(function(){
		$(this).fadeTo(300,.5);
		})
		$(".newStyle").mouseleave(function(){
		$(this).fadeTo(300,1);
		})
	});
	}
function enterr3(){
		var b = 0;
		while(b != 1 ){
			var entry = prompt("enter an Even Number not greater than 100");
			switch(true){
				case entry>100:
					alert("pls number less than 100")
					break;
				case entry%2 != 0:
				alert("even number only pls");
				break;
				case entry%2==0:
				b=1;
				break;
				default:
				alert(entry);
				
			}
	}
		var squareNumber=entry*entry;

		for(var i = 0; i <squareNumber;i++){
			var squareArea=600*600/squareNumber;
			var theSide=Math.sqrt(squareArea)
			var newNode = document.createElement("DIV");
			newNode.classList.add("newStyle");
			newNode.style.width=theSide-2+"px";
			newNode.style.height=theSide-2+"px";
			x.appendChild(newNode);
		}
		$(document).ready(function(){
			$(".newStyle").mouseenter(function(){
			var green=Math.floor(Math.random()*255);
			var red = Math.floor(Math.random()*255);
			var blue=Math.floor(Math.random()*255);
			this.style.backgroundColor="rgb("+green+","+red+","+blue+")";
			})

			
		});
}
function clearr(){
	x.innerHTML="";
}

$(document).ready(function(){
	$(".cont").mouseenter(function(){
 	$(".cont").fadeTo("slow",.25)
	})
})