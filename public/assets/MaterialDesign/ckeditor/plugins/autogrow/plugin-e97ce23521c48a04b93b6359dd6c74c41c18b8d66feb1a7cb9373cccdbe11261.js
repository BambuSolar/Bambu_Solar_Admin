!function(){function e(e){function t(){i=e.document,a=i[CKEDITOR.env.ie?"getBody":"getDocumentElement"](),m=CKEDITOR.env.quirks?i.getBody():i.getDocumentElement();var t=CKEDITOR.env.quirks?m:m.findOne("body");t&&(t.setStyle("height","auto"),t.setStyle("min-height",CKEDITOR.env.safari?"0%":"auto")),r=CKEDITOR.dom.element.createFromHtml('<span style="margin:0;padding:0;border:0;clear:both;width:1px;height:1px;display:block;">'+(CKEDITOR.env.webkit?"&nbsp;":"")+"</span>",i)}function o(){u&&m.setStyle("overflow-y","hidden");var t,o=e.window.getViewPaneSize().height;a.append(r),t=r.getDocumentPosition(i).y+r.$.offsetHeight,r.remove(),t+=d,t=Math.max(t,c),t=Math.min(t,g),t!=o&&n!=t&&(t=e.fire("autoGrow",{currentHeight:o,newHeight:t}).newHeight,e.resize(e.container.getStyle("width"),t,!0),n=t),u||(t<g&&m.$.scrollHeight>m.$.clientHeight?m.setStyle("overflow-y","hidden"):m.removeStyle("overflow-y"))}var n,i,a,m,r,d=e.config.autoGrow_bottomSpace||0,c=void 0!==e.config.autoGrow_minHeight?e.config.autoGrow_minHeight:200,g=e.config.autoGrow_maxHeight||1/0,u=!e.config.autoGrow_maxHeight;e.addCommand("autogrow",{exec:o,modes:{wysiwyg:1},readOnly:1,canUndo:!1,editorFocus:!1});var l,s={contentDom:1,key:1,selectionChange:1,insertElement:1,mode:1};for(l in s)e.on(l,function(t){"wysiwyg"==t.editor.mode&&setTimeout(function(){var t=e.getCommand("maximize");!e.window||t&&t.state==CKEDITOR.TRISTATE_ON?n=null:(o(),u||o())},100)});e.on("afterCommandExec",function(e){"maximize"==e.data.name&&"wysiwyg"==e.editor.mode&&(e.data.command.state==CKEDITOR.TRISTATE_ON?m.removeStyle("overflow-y"):o())}),e.on("contentDom",t),t(),e.config.autoGrow_onStartup&&e.editable().isVisible()&&e.execCommand("autogrow")}CKEDITOR.plugins.add("autogrow",{init:function(t){t.elementMode!=CKEDITOR.ELEMENT_MODE_INLINE&&t.on("instanceReady",function(){t.editable().isInline()?t.ui.space("contents").setStyle("height","auto"):e(t)})}})}();