function fileQueueError2(file, errorCode, message){
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
        
        addImage2(imageName);
        
    } 
    catch (ex) {
        this.debug(ex);
    }
    
}

function fileDialogComplete2(numFilesSelected, numFilesQueued){
    try {
        if (numFilesQueued > 0) {
            this.startUpload();
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}

function uploadProgress2(file, bytesLoaded){

    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);
        
        var progress = new FileProgress2(file, this.customSettings.upload_target);
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


function uploadProgress2(file, bytesLoaded){

    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);
        
        var progress = new FileProgress2(file, this.customSettings.upload_target);
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


function uploadSuccess2(file, serverData){
	addImage2(serverData);
	var $svalue=$('form>input[name=s2]').val();
	if($svalue==''){
		$('form>input[name=s2]').val(serverData);
	}else{
		$('form>input[name=s2]').val($svalue+"|"+serverData);
	}
	
}




function uploadSuccess2(file, serverData){
	addImage2(serverData);
	var $svalue=$('form>input[name=s2]').val();
	if($svalue==''){
		$('form>input[name=s2]').val(serverData);
	}else{
		$('form>input[name=s2]').val($svalue+"|"+serverData);
	}
	
}





function uploadComplete2(file){
    try {

        if (this.getStats().files_queued > 0) {
            this.startUpload();
        }
        else {
            var progress = new FileProgress2(file, this.customSettings.upload_target);
            progress.setComplete();
            progress.setStatus("所有图片上传成功！");
            progress.toggleCancel(false);
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}

function uploadError2(file, errorCode, message){
    var imageName = window.path+"/public/sup/images/error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress2(file, this.customSettings.upload_target);
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
                    progress = new FileProgress2(file, this.customSettings.upload_target);
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
        
        addImage2(imageName);
        
    } 
    catch (ex3) {
        this.debug(ex3);
    }
    
}

function addImage2(src){
    var newElement = "<li><img class='content'  src='" + src + "' style=\"width:100px;height:100px;\"><img class='button' src="+window.path+"/public/sup/images/fancy_close.png></li>";
    $("#pic_list2").append(newElement);
    $("img.button").last().bind("click", del2);
    
}






















function uploadError2(file, errorCode, message){
    var imageName = window.path+"/public/sup/images/error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress2(file, this.customSettings.upload_target);
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
                    progress = new FileProgress2(file, this.customSettings.upload_target);
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
        
        addImage2(imageName);
        
    } 
    catch (ex3) {
        this.debug(ex3);
    }
    
}

function addImage2(src){
    var newElement = "<li><img class='content'  src='" + src + "' style=\"width:100px;height:100px;\"><img class='button' src="+window.path+"/public/sup/images/fancy_close.png></li>";
    $("#pic_list2").append(newElement);
    $("img.button").last().bind("click", del2);
    
}









var del2 = function(){
//    var fid = $(this).parent().prevAll().length + 1;
	var src=$(this).siblings('img').attr('src');
	var $svalue=$('form>input[name=s2]').val();

	url = src.replace(/^http:\/\/[^/]+/, "");	
	var $svalue=$('form>input[name=s2]').val();
	var $valurl=$svalue.replace(url,'');
	$('form>input[name=s2]').val($valurl);





    $.ajax({
        type: "GET", //访问WebService使用Post方式请求
        url: window.url+"/public/sup/del2", //调用WebService的地址和方法名称组合---WsURL/方法名
        data: "src=" + src,
        success: function(data){
		var $val=$svalue.replace(data,'');
			$('form>input[name=s2]').val($val);
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

function FileProgress2(file, targetID){
    this.FileProgress2ID = "divFileProgress2";
    
    this.FileProgress2Wrapper = document.getElementById(this.FileProgress2ID);
    if (!this.FileProgress2Wrapper) {
        this.FileProgress2Wrapper = document.createElement("div");
        this.FileProgress2Wrapper.className = "progressWrapper1";
        this.FileProgress2Wrapper.id = this.FileProgress2ID;
        
        this.FileProgress2Element = document.createElement("div");
        this.FileProgress2Element.className = "progressContainer1";
        
        var progressCancel1 = document.createElement("a");
        progressCancel1.className = "progressCancel1";
        progressCancel1.href = "#";
        progressCancel1.style.visibility = "hidden";
        progressCancel1.appendChild(document.createTextNode(" "));
        
        var progressText = document.createElement("div");
        progressText.className = "progressName";
        progressText.appendChild(document.createTextNode(file.name));
        
        var progressBar = document.createElement("div");
        progressBar.className = "progressBarInProgress1";
        
        var progressStatus = document.createElement("div");
        progressStatus.className = "progressBarStatus1";
        progressStatus.innerHTML = "&nbsp;";
        
        this.FileProgress2Element.appendChild(progressCancel1);
        this.FileProgress2Element.appendChild(progressText);
        this.FileProgress2Element.appendChild(progressStatus);
        this.FileProgress2Element.appendChild(progressBar);
        
        this.FileProgress2Wrapper.appendChild(this.FileProgress2Element);
        
        document.getElementById(targetID).appendChild(this.FileProgress2Wrapper);
        fadeIn(this.FileProgress2Wrapper, 0);
        
    }
    else {
        this.FileProgress2Element = this.FileProgress2Wrapper.firstChild;
        this.FileProgress2Element.childNodes[1].firstChild.nodeValue = file.name;
    }
    
    this.height = this.FileProgress2Wrapper.offsetHeight;
    
}

FileProgress2.prototype.setProgress = function(percentage){
    this.FileProgress2Element.className = "progressContainer1 green";
    this.FileProgress2Element.childNodes[3].className = "progressBarInProgress1";
    this.FileProgress2Element.childNodes[3].style.width = percentage + "%";
};
FileProgress2.prototype.setComplete = function(){
    this.FileProgress2Element.className = "progressContainer1 blue";
    this.FileProgress2Element.childNodes[3].className = "progressBarComplete1";
    this.FileProgress2Element.childNodes[3].style.width = "";
    
};
FileProgress2.prototype.setError = function(){
    this.FileProgress2Element.className = "progressContainer1 red";
    this.FileProgress2Element.childNodes[3].className = "progressBarError1";
    this.FileProgress2Element.childNodes[3].style.width = "";
    
};
FileProgress2.prototype.setCancelled = function(){
    this.FileProgress2Element.className = "progressContainer1";
    this.FileProgress2Element.childNodes[3].className = "progressBarError1";
    this.FileProgress2Element.childNodes[3].style.width = "";
    
};
FileProgress2.prototype.setStatus = function(status){
    this.FileProgress2Element.childNodes[2].innerHTML = status;
};


FileProgress2.prototype.toggleCancel = function(show, swfuploadInstance){
    this.FileProgress2Element.childNodes[0].style.visibility = show ? "visible" : "hidden";
    if (swfuploadInstance) {
        var fileID = this.FileProgress2ID;
        this.FileProgress2Element.childNodes[0].onclick = function(){
            swfuploadInstance.cancelUpload(fileID);
            return false;
        };
    }
};
