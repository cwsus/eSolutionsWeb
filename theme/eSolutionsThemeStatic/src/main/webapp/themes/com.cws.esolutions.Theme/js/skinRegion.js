(function(){
if(!i$.isIE){
i$.addOnLoad(function(){
var _1=new Array();
var _2=document.getElementsByTagName("SECTION");
var _3=null;
for(var i=0;i<_2.length;i++){
if(i$.hasClass(_2[i],"a11yRegionTarget")){
var _4=_2[i];
var _5=null;
var _6=_4.getElementsByTagName("SPAN");
var _7=document.getElementsByTagName("HEADER");
var _8=null;
for(var j=0;j<_6.length;j++){
if(i$.hasClass(_6[j],"a11yRegionLabel")){
_5=_6[j];
}
}
if(_5){
var _9=_5;
var _a=_4;
while((_a=_a.parentNode)!=null){
if(i$.hasClass(_a,"component-control")){
var m=_a&&(_a.className||"").match(/id-([\S]+)/);
_3=m&&m[1];
break;
}
}
if(_3){
var _b="skinHeader"+_3;
var _c=_9.innerHTML;
if(_1.indexOf(_c)>-1){
for(var j=0;j<_1.length;j++){
var _d=_c.concat(" ").concat(j+1);
if(_1.indexOf(_d)==-1){
_c=_d;
_1.push(_c);
break;
}
}
}else{
_1.push(_c);
}
_4.setAttribute("aria-label",_c);
for(var k=0;k<_7.length;k++){
if(i$.hasClass(_7[k],"wpthemeControlHeader")){
_8=_7[k];
if(_8.parentNode==_4){
_8.setAttribute("aria-label",_b);
}
}
}
}
}
}
}
});
}
})();

