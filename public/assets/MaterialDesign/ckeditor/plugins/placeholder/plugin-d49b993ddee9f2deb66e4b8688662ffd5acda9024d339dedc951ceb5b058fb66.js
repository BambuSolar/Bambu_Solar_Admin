!function(){CKEDITOR.plugins.add("placeholder",{requires:"widget,dialog",lang:"af,ar,bg,ca,cs,cy,da,de,de-ch,el,en,en-gb,eo,es,et,eu,fa,fi,fr,fr-ca,gl,he,hr,hu,id,it,ja,km,ko,ku,lv,nb,nl,no,pl,pt,pt-br,ru,si,sk,sl,sq,sv,th,tr,tt,ug,uk,vi,zh,zh-cn",icons:"placeholder",hidpi:!0,onLoad:function(){CKEDITOR.addCss(".cke_placeholder{background-color:#ff0}")},init:function(e){var a=e.lang.placeholder;CKEDITOR.dialog.add("placeholder",this.path+"dialogs/placeholder.js"),e.widgets.add("placeholder",{dialog:"placeholder",pathName:a.pathName,template:'<span class="cke_placeholder">[[]]</span>',downcast:function(){return new CKEDITOR.htmlParser.text("[["+this.data.name+"]]")},init:function(){this.setData("name",this.element.getText().slice(2,-2))},data:function(){this.element.setText("[["+this.data.name+"]]")},getLabel:function(){return this.editor.lang.widget.label.replace(/%1/,this.data.name+" "+this.pathName)}}),e.ui.addButton&&e.ui.addButton("CreatePlaceholder",{label:a.toolbar,command:"placeholder",toolbar:"insert,5",icon:"placeholder"})},afterInit:function(e){var a=/\[\[([^\[\]])+\]\]/g;e.dataProcessor.dataFilter.addRules({text:function(t,l){var n=l.parent&&CKEDITOR.dtd[l.parent.name];if(!n||n.span)return t.replace(a,function(a){var t=null,t=new CKEDITOR.htmlParser.element("span",{"class":"cke_placeholder"});return t.add(new CKEDITOR.htmlParser.text(a)),t=e.widgets.wrapElement(t,"placeholder"),t.getOuterHtml()})}})}})}();