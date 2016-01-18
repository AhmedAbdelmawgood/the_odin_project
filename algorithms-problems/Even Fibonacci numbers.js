// Problem 2. By considering the terms in the Fibonacci
//sequence whose values do not exceed four million, find the sum of the even-valued terms.
var x=1;
var y=0; 
var z=0;
while(x<=4000000){
    z=x-z;
    
    x=x+z;
    if(x%2===0){
        y=y+x;
    }
    
}
console.log(y);
