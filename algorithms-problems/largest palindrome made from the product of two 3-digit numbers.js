var x=[];
var y=100;
var i;
var mulArray=[];
for(y=100;y<1000;y++){
    x.push(y);
}
for(i=0;i<899;i++){
    for(var k=0;k<899;k++){
        mulArray.push(x[i]*x[k]);
    }
}
function compareNumbers(a, b) {
  return a - b;
}
mulArray.sort(function(a, b) {
  return a - b;
});
var stMulArray=mulArray.map(String);
var reverSt=[];
for(var ah=0;ah<mulArray.length;ah++){
reverSt.push(stMulArray[ah].split("").reverse().join(""));
}
console.log(stMulArray.length);
for(var i=0;i<808200;i++){
    if(stMulArray[i]===reverSt[i]){
        var n=stMulArray[i];
    }
}
console.log(n);
