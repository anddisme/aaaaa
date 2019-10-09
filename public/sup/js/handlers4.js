function fileQueueError4(file, errorCode, message){
    try {
        var imageName = window.path+"/public/sup/images/error.gif";
        var errorName = "";
        if (errorCode === SWFUpload.errorCode_QUEUE_LIMIT_EXCEEDED) {
            errorName = "您上传的文件过多！";
        }
        
        if (errorName !== "") {
            alert(errorName);
            return;
        }
        
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                imageName = window.path+"/public/sup/images/zerobyte.gif";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                imageName = window.path+"/public/sup/images/toobig.gif";
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
            default:
                alert(message);
                break;
        }
        
        addImage4(imageName);
        
    } 
    catch (ex) {
        this.debug(ex);
    }
    
}

function fileDialogComplete4(numFilesSelected, numFilesQueued){
    try {
        if (numFilesQueued > 0) {
            this.startUpload();
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}

function uploadProgress4(file, bytesLoaded){

    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);
        
        var progress = new FileProgress4(file, this.customSettings.upload_target);
        progress.setProgress(percent);
        if (percent === 100) {
            progress.setStatus("创建缩略图中");
            progress.toggleCancel(false, this);
        }
        else {
            progress.setStatus("上传中");
            progress.toggleCancel(true, this);
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}


function uploadProgress4(file, bytesLoaded){

    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);
        
        var progress = new FileProgress4(file, this.customSettings.upload_target);
        progress.setProgress(percent);
        if (percent === 100) {
            progress.setStatus("创建缩略图中");
            progress.toggleCancel(false, this);
        }
        else {
            progress.setStatus("上传中");
            progress.toggleCancel(true, this);
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}


function uploadSuccess4(file, serverData){
	addImage4(serverData);
	var $svalue=$('form>input[name=s4]').val();
	if($svalue==''){
		$('form>input[name=s4]').val(serverData);
	}else{
		$('form>input[name=s4]').val($svalue+"|"+serverData);
	}
	
}




function uploadSuccess4(file, serverData){
	addImage4(serverData);
	var $svalue=$('form>input[name=s4]').val();
	if($svalue==''){
		$('form>input[name=s4]').val(serverData);
	}else{
		$('form>input[name=s4]').val($svalue+"|"+serverData);
	}
	
}





function uploadComplete4(file){
    try {

        if (this.getStats().files_queued > 0) {
            this.startUpload();
        }
        else {
            var progress = new FileProgress4(file, this.customSettings.upload_target);
            progress.setComplete();
            progress.setStatus("所有图片上传成功！");
            progress.toggleCancel(false);
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}

function uploadError4(file, errorCode, message){
    var imageName = window.path+"/public/sup/images/error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress4(file, this.customSettings.upload_target);
                    progress.setCancelled();
                    progress.setStatus("取消");
                    progress.toggleCancel(false);
                } 
                catch (ex1) {
                    this.debug(ex1);
                }
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                try {
                    progress = new FileProgress4(file, this.customSettings.upload_target);
                    progress.setCancelled();
                    progress.setStatus("停止");
                    progress.toggleCancel(true);
                } 
                catch (ex2) {
                    this.debug(ex2);
                }
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                imageName = window.path+"/public/sup/images/uploadlimit.gif";
                break;
            default:
                alert(message);
                break;
        }
        
        addImage4(imageName);
        
    } 
    catch (ex3) {
        this.debug(ex3);
    }
    
}

function addImage4(src){
    var newElement = "<li><img class='content'  src='" + src + "' style=\"width:100px;height:100px;\"><img class='button' src="+window.path+"/public/sup/images/fancy_close.png></li>";
    $("#pic_list4").append(newElement);
    $("img.button").last().bind("click", del4);
    
}






















function uploadError4(file, errorCode, message){
    var imageName = window.path+"/public/sup/images/error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress4(file, this.customSettings.upload_target);
                    progress.setCancelled();
                    progress.setStatus("取消");
                    progress.toggleCancel(false);
                } 
                catch (ex1) {
                    this.debug(ex1);
                }
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                try {
                    progress = new FileProgress4(file, this.customSettings.upload_target);
                    progress.setCancelled();
                    progress.setStatus("停止");
                    progress.toggleCancel(true);
                } 
                catch (ex2) {
                    this.debug(ex2);
                }
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                imageName = window.path+"/public/sup/images/uploadlimit.gif";
                break;
            default:
                alert(message);
                break;
        }
        
        addImage4(imageName);
        
    } 
    catch (ex3) {
        this.debug(ex3);
    }
    
}

function addImage4(src){
    var newElement = "<li><img class='content'  src='" + src + "' style=\"width:100px;height:100px;\"><img class='button' src="+window.path+"/public/sup/images/fancy_close.png></li>";
    $("#pic_list4").append(newElement);
    $("img.button").last().bind("click", del4);
    
}









var del4 = function(){
//    var fid = $(this).parent().prevAll().length + 1;
	var src=$(this).siblings('img').attr('src');
	url = src.replace(/^http:\/\/[^/]+/, "");	
	var $svalue=$('form>input[name=s4]').val();
	var $valurl=$svalue.replace(url,'');
	$('form>input[name=s4]').val($valurl);


    $.ajax({
        type: "GET", //访问WebService使用Post方式请求
        url: window.url+"/public/sup/del4", //调用WebService的地址和方法名称组合---WsURL/方法名
        data: "src=" + src,
        success: function(data){
		var $val=$svalue.replace(data,'');
			$('form>input[name=s4]').val($val);
        }
    });
    $(this).parent().remove();
}

function fadeIn(element, opacity){
    var reduceOpacityBy = 5;
    var rate = 30; // 15 fps
    if (opacity < 100) {
        opacity += reduceOpacityBy;
        if (opacity > 100) {
            opacity = 100;
        }
        
        if (element.filters) {
            try {
                element.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity;
            } 
            catch (e) {
                element.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + opacity + ')';
            }
        }
        else {
            element.style.opacity = opacity / 100;
        }
    }
    
    if (opacity < 100) {
        setTimeout(function(){
            fadeIn(element, opacity);
        }, rate);
    }
}

function FileProgress4(file, targetID){
    this.FileProgress4ID = "divFileProgress4";
    
    this.FileProgress4Wrapper = document.getElementById(this.FileProgress4ID);
    if (!this.FileProgress4Wrapper) {
        this.FileProgress4Wrapper = document.createElement("div");
        this.FileProgress4Wrapper.className = "progressWrapper1";
        this.FileProgress4Wrapper.id = this.FileProgress4ID;
        
        this.FileProgress4Element = document.createElement("div");
        this.FileProgress4Element.className = "progressContainer1";
        
        var progressCancel2 = document.createElement("a");
        progressCancel2.className = "progressCancel2";
        progressCancel2.href = "#";
        progressCancel2.style.visibility = "hidden";
        progressCancel2.appendChild(document.createTextNode(" "));
        
        var progressText = document.createElement("div");
        progressText.className = "progressName";
        progressText.appendChild(document.createTextNode(file.name));
        
        var progressBar = document.createElement("div");
        progressBar.className = "progressBarInProgress1";
        
        var progressStatus = document.createElement("div");
        progressStatus.className = "progressBarStatus1";
        progressStatus.innerHTML = "&nbsp;";
        
        this.FileProgress4Element.appendChild(progressCancel2);
        this.FileProgress4Element.appendChild(progressText);
        this.FileProgress4Element.appendChild(progressStatus);
        this.FileProgress4Element.appendChild(progressBar);
        
        this.FileProgress4Wrapper.appendChild(this.FileProgress4Element);
        
        document.getElementById(targetID).appendChild(this.FileProgress4Wrapper);
        fadeIn(this.FileProgress4Wrapper, 0);
        
    }
    else {
        this.FileProgress4Element = this.FileProgress4Wrapper.firstChild;
        this.FileProgress4Element.childNodes[1].firstChild.nodeValue = file.name;
    }
    
    this.height = this.FileProgress4Wrapper.offsetHeight;
    
}

FileProgress4.prototype.setProgress = function(percentage){
    this.FileProgress4Element.className = "progressContainer1 green";
    this.FileProgress4Element.childNodes[3].className = "progressBarInProgress1";
    this.FileProgress4Element.childNodes[3].style.width = percentage + "%";
};
FileProgress4.prototype.setComplete = function(){
    this.FileProgress4Element.className = "progressContainer1 blue";
    this.FileProgress4Element.childNodes[3].className = "progressBarComplete1";
    this.FileProgress4Element.childNodes[3].style.width = "";
    
};
FileProgress4.prototype.setError = function(){
    this.FileProgress4Element.className = "progressContainer1 red";
    this.FileProgress4Element.childNodes[3].className = "progressBarError1";
    this.FileProgress4Element.childNodes[3].style.width = "";
    
};
FileProgress4.prototype.setCancelled = function(){
    this.FileProgress4Element.className = "progressContainer1";
    this.FileProgress4Element.childNodes[3].className = "progressBarError1";
    this.FileProgress4Element.childNodes[3].style.width = "";
    
};
FileProgress4.prototype.setStatus = function(status){
    this.FileProgress4Element.childNodes[2].innerHTML = status;
};


FileProgress4.prototype.toggleCancel = function(show, swfuploadInstance){
    this.FileProgress4Element.childNodes[0].style.visibility = show ? "visible" : "hidden";
    if (swfuploadInstance) {
        var fileID = this.FileProgress4ID;
        this.FileProgress4Element.childNodes[0].onclick = function(){
            swfuploadInstance.cancelUpload(fileID);
            return false;
        };
    }
};
