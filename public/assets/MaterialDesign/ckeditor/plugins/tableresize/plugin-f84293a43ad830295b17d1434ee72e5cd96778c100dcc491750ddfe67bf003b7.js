!function(){function e(e){return CKEDITOR.env.ie?e.$.clientWidth:parseInt(e.getComputedStyle("width"),10)}function t(e,t){var n=e.getComputedStyle("border-"+t+"-width"),o={thin:"0px",medium:"1px",thick:"2px"};return 0>n.indexOf("px")&&(n=n in o&&"none"!=e.getComputedStyle("border-style")?o[n]:0),parseInt(n,10)}function n(e){var n,o=[],a=-1,i="rtl"==e.getComputedStyle("direction");n=e.$.rows;for(var r,s,l,u=0,d=0,m=n.length;d<m;d++)l=n[d],r=l.cells.length,r>u&&(u=r,s=l);for(n=s,u=new CKEDITOR.dom.element(e.$.tBodies[0]),r=u.getDocumentPosition(),s=0,l=n.cells.length;s<l;s++){var c,f,d=new CKEDITOR.dom.element(n.cells[s]),m=n.cells[s+1]&&new CKEDITOR.dom.element(n.cells[s+1]),a=a+(d.$.colSpan||1),h=d.getDocumentPosition().x;i?f=h+t(d,"left"):c=h+d.$.offsetWidth-t(d,"right"),m?(h=m.getDocumentPosition().x,i?c=h+m.$.offsetWidth-t(m,"right"):f=h+t(m,"left")):(h=e.getDocumentPosition().x,i?c=h:f=h+e.$.offsetWidth),d=Math.max(f-c,3),o.push({table:e,index:a,x:c,y:r.y,width:d,height:u.$.offsetHeight,rtl:i})}return o}function o(e){(e.data||e).preventDefault()}function a(n){function a(){h=0,f.setOpacity(0),p&&i();var e=m.table;setTimeout(function(){e.removeCustomData("_cke_table_pillars")},0),c.removeListener("dragstart",o)}function i(){for(var o=m.rtl,a=o?b.length:v.length,i=0,s=0;s<a;s++){var l=v[s],u=b[s],d=m.table;CKEDITOR.tools.setTimeout(function(e,t,s,l,u,m){e&&e.setStyle("width",r(Math.max(t+m,1))),s&&s.setStyle("width",r(Math.max(l-m,1))),u&&d.setStyle("width",r(u+m*(o?-1:1))),++i==a&&n.fire("saveSnapshot")},0,this,[l,l&&e(l),u,u&&e(u),(!l||!u)&&e(d)+t(d,"left")+t(d,"right"),p])}}function l(t){o(t),n.fire("saveSnapshot"),t=m.index;for(var a=CKEDITOR.tools.buildTableMap(m.table),i=[],r=[],s=Number.MAX_VALUE,l=s,x=m.rtl,C=0,T=a.length;C<T;C++){var E=a[C],O=E[t+(x?1:0)],E=E[t+(x?0:1)],O=O&&new CKEDITOR.dom.element(O),E=E&&new CKEDITOR.dom.element(E);O&&E&&O.equals(E)||(O&&(s=Math.min(s,e(O))),E&&(l=Math.min(l,e(E))),i.push(O),r.push(E))}v=i,b=r,y=m.x-s,D=m.x+l,f.setOpacity(.5),g=parseInt(f.getStyle("left"),10),p=0,h=1,f.on("mousemove",d),c.on("dragstart",o),c.on("mouseup",u,this)}function u(e){e.removeListener(),a()}function d(e){x(e.data.getPageOffset().x)}var m,c,f,h,g,p,v,b,y,D;c=n.document,f=CKEDITOR.dom.element.createFromHtml('<div data-cke-temp=1 contenteditable=false unselectable=on style="position:absolute;cursor:col-resize;filter:alpha(opacity=0);opacity:0;padding:0;background-color:#004;background-image:none;border:0px none;z-index:10"></div>',c),n.on("destroy",function(){f.remove()}),s||c.getDocumentElement().append(f),this.attachTo=function(e){h||(s&&(c.getBody().append(f),p=0),m=e,f.setStyles({width:r(e.width),height:r(e.height),left:r(e.x),top:r(e.y)}),s&&f.setOpacity(.25),f.on("mousedown",l,this),c.getBody().setStyle("cursor","col-resize"),f.show())};var x=this.move=function(e){if(!m)return 0;if(!h&&(e<m.x||e>m.x+m.width))return m=null,h=p=0,c.removeListener("mouseup",u),f.removeListener("mousedown",l),f.removeListener("mousemove",d),c.getBody().setStyle("cursor","auto"),s?f.remove():f.hide(),0;if(e-=Math.round(f.$.offsetWidth/2),h){if(e==y||e==D)return 1;e=Math.max(e,y),e=Math.min(e,D),p=e-g}return f.setStyle("left",r(e)),1}}function i(e){var t=e.data.getTarget();if("mouseout"==e.name){if(!t.is("table"))return;for(var n=new CKEDITOR.dom.element(e.data.$.relatedTarget||e.data.$.toElement);n&&n.$&&!n.equals(t)&&!n.is("body");)n=n.getParent();if(!n||n.equals(t))return}t.getAscendant("table",1).removeCustomData("_cke_table_pillars"),e.removeListener()}var r=CKEDITOR.tools.cssLength,s=CKEDITOR.env.ie&&(CKEDITOR.env.ie7Compat||CKEDITOR.env.quirks);CKEDITOR.plugins.add("tableresize",{requires:"tabletools",init:function(e){e.on("contentDom",function(){var t,r=e.editable();r.attachListener(r.isInline()?r:e.document,"mousemove",function(r){r=r.data;var s=r.getTarget();if(s.type==CKEDITOR.NODE_ELEMENT){var l=r.getPageOffset().x;if(t&&t.move(l))o(r);else if((s.is("table")||s.getAscendant("tbody",1))&&(s=s.getAscendant("table",1),e.editable().contains(s))){(r=s.getCustomData("_cke_table_pillars"))||(s.setCustomData("_cke_table_pillars",r=n(s)),s.on("mouseout",i),s.on("mousedown",i));e:{for(var s=0,u=r.length;s<u;s++){var d=r[s];if(l>=d.x&&l<=d.x+d.width){l=d;break e}}l=null}l&&(!t&&(t=new a(e)),t.attachTo(l))}}})})}})}();