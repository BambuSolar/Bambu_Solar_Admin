!function(){function e(e){this.editor=e,this.loaders=[]}function t(e,t,a){var r=e.config.fileTools_defaultFileName;this.editor=e,this.lang=e.lang,"string"==typeof t?(this.data=t,this.file=o(this.data),this.loaded=this.total=this.file.size):(this.data=null,this.file=t,this.total=this.file.size,this.loaded=0),a?this.fileName=a:this.file.name?this.fileName=this.file.name:(e=this.file.type.split("/"),r&&(e[0]=r),this.fileName=e.join(".")),this.uploaded=0,this.uploadTotal=null,this.status="created",this.abort=function(){this.changeStatus("abort")}}function o(e){var t=e.match(a)[1];e=e.replace(a,""),e=atob(e);var o,r,l,s,n=[];for(o=0;o<e.length;o+=512){for(r=e.slice(o,o+512),l=Array(r.length),s=0;s<r.length;s++)l[s]=r.charCodeAt(s);r=new Uint8Array(l),n.push(r)}return new Blob(n,{type:t})}CKEDITOR.plugins.add("filetools",{lang:"cs,da,de,de-ch,en,eo,eu,fr,gl,id,it,km,ko,ku,nb,nl,pl,pt-br,ru,sv,tr,ug,uk,zh,zh-cn",beforeInit:function(t){t.uploadRepository=new e(t),t.on("fileUploadRequest",function(e){e=e.data.fileLoader,e.xhr.open("POST",e.uploadUrl,!0)},null,null,5),t.on("fileUploadRequest",function(e){e=e.data.fileLoader;var t=new FormData;t.append("upload",e.file,e.fileName),t.append("ckCsrfToken",CKEDITOR.tools.getCsrfToken()),e.xhr.send(t)},null,null,999),t.on("fileUploadResponse",function(e){var t=e.data.fileLoader,o=t.xhr,a=e.data;try{var r=JSON.parse(o.responseText);r.error&&r.error.message&&(a.message=r.error.message),r.uploaded?(a.fileName=r.fileName,a.url=r.url):e.cancel()}catch(r){a.message=t.lang.filetools.responseError,CKEDITOR.warn("filetools-response-error",{responseText:o.responseText}),e.cancel()}},null,null,999)}}),e.prototype={create:function(e,o){var a=this.loaders.length,r=new t(this.editor,e,o);return r.id=a,this.loaders[a]=r,this.fire("instanceCreated",r),r},isFinished:function(){for(var e=0;e<this.loaders.length;++e)if(!this.loaders[e].isFinished())return!1;return!0}},t.prototype={loadAndUpload:function(e){var t=this;this.once("loaded",function(o){o.cancel(),t.once("update",function(e){e.cancel()},null,null,0),t.upload(e)},null,null,0),this.load()},load:function(){var e=this,t=this.reader=new FileReader;e.changeStatus("loading"),this.abort=function(){e.reader.abort()},t.onabort=function(){e.changeStatus("abort")},t.onerror=function(){e.message=e.lang.filetools.loadError,e.changeStatus("error")},t.onprogress=function(t){e.loaded=t.loaded,e.update()},t.onload=function(){e.loaded=e.total,e.data=t.result,e.changeStatus("loaded")},t.readAsDataURL(this.file)},upload:function(e){e?(this.uploadUrl=e,this.xhr=new XMLHttpRequest,this.attachRequestListeners(),this.editor.fire("fileUploadRequest",{fileLoader:this})&&this.changeStatus("uploading")):(this.message=this.lang.filetools.noUrlError,this.changeStatus("error"))},attachRequestListeners:function(){function e(){"error"!=o.status&&(o.message=o.lang.filetools.networkError,o.changeStatus("error"))}function t(){"abort"!=o.status&&o.changeStatus("abort")}var o=this,a=this.xhr;o.abort=function(){a.abort()},a.onerror=e,a.onabort=t,a.upload?(a.upload.onprogress=function(e){e.lengthComputable&&(o.uploadTotal||(o.uploadTotal=e.total),o.uploaded=e.loaded,o.update())},a.upload.onerror=e,a.upload.onabort=t):(o.uploadTotal=o.total,o.update()),a.onload=function(){if(o.update(),"abort"!=o.status)if(o.uploaded=o.uploadTotal,200>a.status||299<a.status)o.message=o.lang.filetools["httpError"+a.status],o.message||(o.message=o.lang.filetools.httpError.replace("%1",a.status)),o.changeStatus("error");else{for(var e={fileLoader:o},t=["message","fileName","url"],r=o.editor.fire("fileUploadResponse",e),l=0;l<t.length;l++){var s=t[l];"string"==typeof e[s]&&(o[s]=e[s])}!1===r?o.changeStatus("error"):o.changeStatus("uploaded")}}},changeStatus:function(e){this.status=e,"error"!=e&&"abort"!=e&&"loaded"!=e&&"uploaded"!=e||(this.abort=function(){}),this.fire(e),this.update()},update:function(){this.fire("update")},isFinished:function(){return!!this.status.match(/^(?:loaded|uploaded|error|abort)$/)}},CKEDITOR.event.implementOn(e.prototype),CKEDITOR.event.implementOn(t.prototype);var a=/^data:(\S*?);base64,/;CKEDITOR.fileTools||(CKEDITOR.fileTools={}),CKEDITOR.tools.extend(CKEDITOR.fileTools,{uploadRepository:e,fileLoader:t,getUploadUrl:function(e,t){var o=CKEDITOR.tools.capitalize;return t&&e[t+"UploadUrl"]?e[t+"UploadUrl"]:e.uploadUrl?e.uploadUrl:t&&e["filebrowser"+o(t,1)+"UploadUrl"]?e["filebrowser"+o(t,1)+"UploadUrl"]+"&responseType=json":e.filebrowserUploadUrl?e.filebrowserUploadUrl+"&responseType=json":null},isTypeSupported:function(e,t){return!!e.type.match(t)}})}();