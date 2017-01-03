function Notification(t,e){CKEDITOR.tools.extend(this,e,{editor:t,id:"cke-"+CKEDITOR.tools.getUniqueId(),area:t._.notificationArea}),e.type||(this.type="info"),this.element=this._createElement(),t.plugins.clipboard&&CKEDITOR.plugins.clipboard.preventDefaultDropOnElement(this.element)}function Area(t){var e=this;this.editor=t,this.notifications=[],this.element=this._createElement(),this._uiBuffer=CKEDITOR.tools.eventsBuffer(10,this._layout,this),this._changeBuffer=CKEDITOR.tools.eventsBuffer(500,this._layout,this),t.on("destroy",function(){e._removeListeners(),e.element.remove()})}CKEDITOR.plugins.add("notification",{lang:"cs,da,de,de-ch,en,eo,eu,fr,gl,id,it,km,ko,ku,nb,nl,pl,pt,pt-br,ru,sv,tr,ug,uk,zh,zh-cn",requires:"toolbar",init:function(t){function e(t){var e=new CKEDITOR.dom.element("div");e.setStyles({position:"fixed","margin-left":"-9999px"}),e.setAttributes({"aria-live":"assertive","aria-atomic":"true"}),e.setText(t),CKEDITOR.document.getBody().append(e),setTimeout(function(){e.remove()},100)}t._.notificationArea=new Area(t),t.showNotification=function(e,i,o){var n,s;return"progress"==i?n=o:s=o,e=new CKEDITOR.plugins.notification(t,{message:e,type:i,progress:n,duration:s}),e.show(),e},t.on("key",function(i){if(27==i.data.keyCode){var o=t._.notificationArea.notifications;o.length&&(e(t.lang.notification.closed),o[o.length-1].hide(),i.cancel())}})}}),Notification.prototype={show:function(){!1!==this.editor.fire("notificationShow",{notification:this})&&(this.area.add(this),this._hideAfterTimeout())},update:function(t){var e=!0;!1===this.editor.fire("notificationUpdate",{notification:this,options:t})&&(e=!1);var i=this.element,o=i.findOne(".cke_notification_message"),n=i.findOne(".cke_notification_progress"),s=t.type;i.removeAttribute("role"),t.progress&&"progress"!=this.type&&(s="progress"),s&&(i.removeClass(this._getClass()),i.removeAttribute("aria-label"),this.type=s,i.addClass(this._getClass()),i.setAttribute("aria-label",this.type),"progress"!=this.type||n?"progress"!=this.type&&n&&n.remove():(n=this._createProgressElement(),n.insertBefore(o))),void 0!==t.message&&(this.message=t.message,o.setHtml(this.message)),void 0!==t.progress&&(this.progress=t.progress,n&&n.setStyle("width",this._getPercentageProgress())),e&&t.important&&(i.setAttribute("role","alert"),this.isVisible()||this.area.add(this)),this.duration=t.duration,this._hideAfterTimeout()},hide:function(){!1!==this.editor.fire("notificationHide",{notification:this})&&this.area.remove(this)},isVisible:function(){return 0<=CKEDITOR.tools.indexOf(this.area.notifications,this)},_createElement:function(){var t,e,i=this,o=this.editor.lang.common.close;return t=new CKEDITOR.dom.element("div"),t.addClass("cke_notification"),t.addClass(this._getClass()),t.setAttributes({id:this.id,role:"alert","aria-label":this.type}),"progress"==this.type&&t.append(this._createProgressElement()),e=new CKEDITOR.dom.element("p"),e.addClass("cke_notification_message"),e.setHtml(this.message),t.append(e),e=CKEDITOR.dom.element.createFromHtml('<a class="cke_notification_close" href="javascript:void(0)" title="'+o+'" role="button" tabindex="-1"><span class="cke_label">X</span></a>'),t.append(e),e.on("click",function(){i.editor.focus(),i.hide()}),t},_getClass:function(){return"progress"==this.type?"cke_notification_info":"cke_notification_"+this.type},_createProgressElement:function(){var t=new CKEDITOR.dom.element("span");return t.addClass("cke_notification_progress"),t.setStyle("width",this._getPercentageProgress()),t},_getPercentageProgress:function(){return Math.round(100*(this.progress||0))+"%"},_hideAfterTimeout:function(){var t,e=this;this._hideTimeoutId&&clearTimeout(this._hideTimeoutId),"number"==typeof this.duration?t=this.duration:"info"!=this.type&&"success"!=this.type||(t="number"==typeof this.editor.config.notification_duration?this.editor.config.notification_duration:5e3),t&&(e._hideTimeoutId=setTimeout(function(){e.hide()},t))}},Area.prototype={add:function(t){this.notifications.push(t),this.element.append(t.element),1==this.element.getChildCount()&&(CKEDITOR.document.getBody().append(this.element),this._attachListeners()),this._layout()},remove:function(t){var e=CKEDITOR.tools.indexOf(this.notifications,t);0>e||(this.notifications.splice(e,1),t.element.remove(),this.element.getChildCount()||(this._removeListeners(),this.element.remove()))},_createElement:function(){var t=this.editor,e=t.config,i=new CKEDITOR.dom.element("div");return i.addClass("cke_notifications_area"),i.setAttribute("id","cke_notifications_area_"+t.name),i.setStyle("z-index",e.baseFloatZIndex-2),i},_attachListeners:function(){var t=CKEDITOR.document.getWindow(),e=this.editor;t.on("scroll",this._uiBuffer.input),t.on("resize",this._uiBuffer.input),e.on("change",this._changeBuffer.input),e.on("floatingSpaceLayout",this._layout,this,null,20),e.on("blur",this._layout,this,null,20)},_removeListeners:function(){var t=CKEDITOR.document.getWindow(),e=this.editor;t.removeListener("scroll",this._uiBuffer.input),t.removeListener("resize",this._uiBuffer.input),e.removeListener("change",this._changeBuffer.input),e.removeListener("floatingSpaceLayout",this._layout),e.removeListener("blur",this._layout)},_layout:function(){function t(){i.setStyle("left",m(p+n.width-h-l))}var e,i=this.element,o=this.editor,n=o.ui.contentsElement.getClientRect(),s=o.ui.contentsElement.getDocumentPosition(),o=o.ui.space("top"),r=o.getClientRect(),a=i.getClientRect(),h=this._notificationWidth,l=this._notificationMargin;e=CKEDITOR.document.getWindow();var c=e.getScrollPosition(),d=e.getViewPaneSize(),u=CKEDITOR.document.getBody(),f=u.getDocumentPosition(),m=CKEDITOR.tools.cssLength;h&&l||(e=this.element.getChild(0),h=this._notificationWidth=e.getClientRect().width,l=this._notificationMargin=parseInt(e.getComputedStyle("margin-left"),10)+parseInt(e.getComputedStyle("margin-right"),10)),o.isVisible()&&r.bottom>n.top&&r.bottom<n.bottom-a.height?i.setStyles({position:"fixed",top:m(r.bottom)}):0<n.top?i.setStyles({position:"absolute",top:m(s.y)}):s.y+n.height-a.height>c.y?i.setStyles({position:"fixed",top:0}):i.setStyles({position:"absolute",top:m(s.y+n.height-a.height)});var p="fixed"==i.getStyle("position")?n.left:"static"!=u.getComputedStyle("position")?s.x-f.x:s.x;n.width<h+l?s.x+h+l>c.x+d.width?t():i.setStyle("left",m(p)):s.x+h+l>c.x+d.width?i.setStyle("left",m(p)):s.x+n.width/2+h/2+l>c.x+d.width?i.setStyle("left",m(p-s.x+c.x+d.width-h-l)):0>n.left+n.width-h-l?t():0>n.left+n.width/2-h/2?i.setStyle("left",m(p-s.x+c.x)):i.setStyle("left",m(p+n.width/2-h/2-l/2))}},CKEDITOR.plugins.notification=Notification;