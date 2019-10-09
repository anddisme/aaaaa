function fileQueueError1(file, errorCode, message){
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
        
        addImage1(imageName);
        
    } 
    catch (ex) {
        this.debug(ex);
    }
    
}

function fileDialogComplete1(numFilesSelected, numFilesQueued){
    try {
        if (numFilesQueued > 0) {
            this.startUpload();
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}

function uploadProgress1(file, bytesLoaded){

    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);
        
        var progress = new FileProgress1(file, this.customSettings.upload_target);
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


function uploadProgress1(file, bytesLoaded){

    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);
        
        var progress = new FileProgress1(file, this.customSettings.upload_target);
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


function uploadSuccess1(file, serverData){
	addImage1(serverData);
	var $svalue=$('form>input[name=s1]').val();
	if($svalue==''){
		$('form>input[name=s1]').val(serverData);
	}else{
		$('form>input[name=s1]').val($svalue+"|"+serverData);
	}
	
}




function uploadSuccess1(file, serverData){
	addImage11(serverData);
	var $svalue=$('form>input[name=s1]').val();
	if($svalue==''){
		$('form>input[name=s1]').val(serverData);
	}else{
		$('form>input[name=s1]').val($svalue+"|"+serverData);
	}
	
}





function uploadComplete1(file){
    try {

        if (this.getStats().files_queued > 0) {
            this.startUpload();
        }
        else {
            var progress = new FileProgress1(file, this.customSettings.upload_target);
            progress.setComplete();
            progress.setStatus("所有图片上传成功！");
            progress.toggleCancel(false);
        }
    } 
    catch (ex) {
        this.debug(ex);
    }
}

function uploadError1(file, errorCode, message){
    var imageName = window.path+"/public/sup/images/error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress1(file, this.customSettings.upload_target);
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
                    progress = new FileProgress1(file, this.customSettings.upload_target);
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
        
        addImage1(imageName);
        
    } 
    catch (ex3) {
        this.debug(ex3);
    }
    
}

function addImage1(src){
    var newElement = "<li><img class='content'  src='" + src + "' style=\"width:100px;height:100px;\"><img class='button' src="+window.path+"/public/sup/images/fancy_close.png></li>";
    $("#pic_list").append(newElement);
    $("img.button").last().bind("click", del1);
    
}






















function uploadError11(file, errorCode, message){
    var imageName = window.path+"/public/sup/images/error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress1(file, this.customSettings.upload_target);
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
                    progress = new FileProgress1(file, this.customSettings.upload_target);
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
        
        addImage11(imageName);
        
    } 
    catch (ex3) {
        this.debug(ex3);
    }
    
}

function addImage11(src){
    var newElement = "<li><img class='content'  src='" + src + "' style=\"width:100px;height:100px;\"><img class='button' src="+window.path+"/public/sup/images/fancy_close.png></li>";
    $("#pic_list1").append(newElement);
    $("img.button").last().bind("click", del1);
    
}









var del1 = function(){
//    var fid = $(this).parent().prevAll().length + 1;
	var src=$(this).siblings('img').attr('src');
	var $svalue=$('form>input[name=s1]').val();

	url = src.replace(/^http:\/\/[^/]+/, "");	
	var $svalue=$('form>input[name=s1]').val();
	var $valurl=$svalue.replace(url,'');
	$('form>input[name=s1]').val($valurl);




    $.ajax({
        type: "GET", //访问WebService使用Post方式请求
        url: window.url+"/public/sup/del1", //调用WebService的地址和方法名称组合---WsURL/方法名
        data: "src=" + src,
        success: function(data){
		var $val=$svalue.replace(data,'');
			$('form>input[name=s1]').val($val);
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

function FileProgress1(file, targetID){
    this.FileProgress1ID = "divFileProgress1";
    
    this.FileProgress1Wrapper = document.getElementById(this.FileProgress1ID);
    if (!this.FileProgress1Wrapper) {
        this.FileProgress1Wrapper = document.createElement("div");
        this.FileProgress1Wrapper.className = "progressWrapper1";
        this.FileProgress1Wrapper.id = this.FileProgress1ID;
        
        this.FileProgress1Element = document.createElement("div");
        this.FileProgress1Element.className = "progressContainer1";
        
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
        
        this.FileProgress1Element.appendChild(progressCancel1);
        this.FileProgress1Element.appendChild(progressText);
        this.FileProgress1Element.appendChild(progressStatus);
        this.FileProgress1Element.appendChild(progressBar);
        
        this.FileProgress1Wrapper.appendChild(this.FileProgress1Element);
        
        document.getElementById(targetID).appendChild(this.FileProgress1Wrapper);
        fadeIn(this.FileProgress1Wrapper, 0);
        
    }
    else {
        this.FileProgress1Element = this.FileProgress1Wrapper.firstChild;
        this.FileProgress1Element.childNodes[1].firstChild.nodeValue = file.name;
    }
    
    this.height = this.FileProgress1Wrapper.offsetHeight;
    
}

FileProgress1.prototype.setProgress = function(percentage){
    this.FileProgress1Element.className = "progressContainer1 green";
    this.FileProgress1Element.childNodes[3].className = "progressBarInProgress1";
    this.FileProgress1Element.childNodes[3].style.width = percentage + "%";
};
FileProgress1.prototype.setComplete = function(){
    this.FileProgress1Element.className = "progressContainer1 blue";
    this.FileProgress1Element.childNodes[3].className = "progressBarComplete1";
    this.FileProgress1Element.childNodes[3].style.width = "";
    
};
FileProgress1.prototype.setError = function(){
    this.FileProgress1Element.className = "progressContainer1 red";
    this.FileProgress1Element.childNodes[3].className = "progressBarError1";
    this.FileProgress1Element.childNodes[3].style.width = "";
    
};
FileProgress1.prototype.setCancelled = function(){
    this.FileProgress1Element.className = "progressContainer1";
    this.FileProgress1Element.childNodes[3].className = "progressBarError1";
    this.FileProgress1Element.childNodes[3].style.width = "";
    
};
FileProgress1.prototype.setStatus = function(status){
    this.FileProgress1Element.childNodes[2].innerHTML = status;
};


FileProgress1.prototype.toggleCancel = function(show, swfuploadInstance){
    this.FileProgress1Element.childNodes[0].style.visibility = show ? "visible" : "hidden";
    if (swfuploadInstance) {
        var fileID = this.FileProgress1ID;
        this.FileProgress1Element.childNodes[0].onclick = function(){
            swfuploadInstance.cancelUpload(fileID);
            return false;
        };
    }
};
