function browserserver(startupPath, functionData ){
var finder = new CKFinder() ;
finder.BasePath = '../Public/Ckfinder' ;
finder.SelectFunction = SetFileField ;
if ('' != functionData){
finder.SelectFunctionData = functionData ;
}
if (startupPath != ''){
finder.StartupPath = startupPath ;
}
finder.Popup() ;
}
function SetFileField(fileUrl, data){
$(data["selectFunctionData"]).val(fileUrl);
}