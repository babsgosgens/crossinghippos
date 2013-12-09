jQuery.noConflict()jQuery(function(){var loadTab=function(){var $=jQuery.noConflict();jQuery(document).find('a[data-toggle="tab"]').on('click',function(e){window.localStorage.setItem('tab-href',$(e.target).attr('href'))});var activateTab=function(href){var $el=$('a[data-toggle="tab"]a[href*='+href+']');$el.tab('show')},hasTab=function(href){return $('a[data-toggle="tab"]a[href*='+href+']').length};if(localStorage.getItem('tab-href')){if(!hasTab(localStorage.getItem('tab-href'))){localStorage.removeItem('tab-href');return true};$('a[data-toggle="tab"]').parent().removeClass('active');var tabhref=localStorage.getItem('tab-href');activateTab(tabhref);var seperatorIndex=tabhref.indexOf('-');if(seperatorIndex!==-1){var singular=tabhref.substring(0,seperatorIndex),plural=singular+"s";activateTab(plural)}}};setTimeout(loadTab,100)})var count=0,items=6;jQuery(document).ready(function(){jQuery('a.left').click(function(event){event.preventDefault();if(count>0){jQuery('.stream').animate({left:'+=10%'},400);count--}});jQuery('a.right').click(function(event){event.preventDefault();if(count<items){jQuery('.stream').animate({left:'-=10%'},400);count++}})});console.log('Slider Loaded!')var Observer=new Class({Implements:[Options,Events],options:{periodical:false,delay:1e3},initialize:function(el,onFired,options){this.element=document.id(el)||$document.id(el);this.addEvent('onFired',onFired);this.setOptions(options);this.bound=this.changed.bind(this);this.resume()},changed:function(){var value=this.element.get('value');if($equals(this.value,value))return;this.clear();this.value=value;this.timeout=this.onFired.delay(this.options.delay,this)},setValue:function(value){this.value=value;this.element.set('value',value);return this.clear()},onFired:function(){this.fireEvent('onFired',[this.value,this.element])},clear:function(){clearTimeout(this.timeout||null);return this},pause:function(){if(this.timer){clearTimeout(this.timer)}else this.element.removeEvent('keyup',this.bound);return this.clear()},resume:function(){this.value=this.element.get('value');if(this.options.periodical){this.timer=this.changed.periodical(this.options.periodical,this)}else this.element.addEvent('keyup',this.bound);return this}}),$equals=function(obj1,obj2){return(obj1==obj2||JSON.encode(obj1)==JSON.encode(obj2))},Autocompleter=new Class({Implements:[Options,Events],options:{minLength:1,markQuery:true,width:'inherit',maxChoices:10,injectChoice:null,customChoices:null,emptyChoices:null,visibleChoices:true,className:'autocompleter-choices',zIndex:1e3,delay:400,observerOptions:{},fxOptions:{},autoSubmit:false,overflow:false,overflowMargin:25,selectFirst:false,filter:null,filterCase:false,filterSubset:false,forceSelect:false,selectMode:true,choicesMatch:null,multiple:false,separator:', ',separatorSplit:/\s*[,;]\s*/,autoTrim:false,allowDupes:false,cache:true,relative:false},initialize:function(element,options){this.element=document.id(element);this.setOptions(options);this.build();this.observer=new Observer(this.element,this.prefetch.bind(this),Object.merge({},{delay:this.options.delay},this.options.observerOptions));this.queryValue=null;if(this.options.filter)this.filter=this.options.filter.bind(this);var mode=this.options.selectMode;this.typeAhead=(mode=='type-ahead');this.selectMode=(mode===true)?'selection':mode;this.cached=[]},build:function(){if(document.id(this.options.customChoices)){this.choices=this.options.customChoices}else{this.choices=new Element('ul',{'class':this.options.className,styles:{zIndex:this.options.zIndex}}).inject(document.body);this.relative=false;if(this.options.relative){this.choices.inject(this.element,'after');this.relative=this.element.getOffsetParent()};this.fix=new OverlayFix(this.choices)};if(!this.options.separator.test(this.options.separatorSplit))this.options.separatorSplit=this.options.separator;this.fx=(!this.options.fxOptions)?null:new Fx.Tween(this.choices,Object.merge({},{property:'opacity',link:'cancel',duration:200},this.options.fxOptions)).addEvent('onStart',Chain.prototype.clearChain).set(0);this.element.setProperty('autocomplete','off').addEvent((Browser.ie||Browser.safari||Browser.chrome)?'keydown':'keypress',this.onCommand.bind(this)).addEvent('click',this.onCommand.bind(this,[false])).addEvent('focus',this.toggleFocus.pass({bind:this,arguments:true,delay:100})).addEvent('blur',this.toggleFocus.pass({bind:this,arguments:false,delay:100}))},destroy:function(){if(this.fix)this.fix.destroy();this.choices=this.selected=this.choices.destroy()},toggleFocus:function(state){this.focussed=state;if(!state)this.hideChoices(true);this.fireEvent(state?'onFocus':'onBlur',[this.element])},onCommand:function(e){if(!e&&this.focussed)return this.prefetch();if(e&&e.key&&!e.shift)switch(e.key){case'enter':if(this.element.value!=this.opted)return true;if(this.selected&&this.visible){this.choiceSelect(this.selected);return!!(this.options.autoSubmit)};break;case'up':case'down':if(!this.prefetch()&&this.queryValue!==null){var up=(e.key=='up');this.choiceOver((this.selected||this.choices)[(this.selected)?(up?'getPrevious':'getNext'):(up?'getLast':'getFirst')](this.options.choicesMatch),true)};return false;case'esc':case'tab':this.hideChoices(true);break};return true},setSelection:function(finish){var input=this.selected.inputValue,value=input,start=this.queryValue.length,end=input.length;if(input.substr(0,start).toLowerCase()!=this.queryValue.toLowerCase())start=0;if(this.options.multiple){var split=this.options.separatorSplit;value=this.element.value;start+=this.queryIndex;end+=this.queryIndex;var old=value.substr(this.queryIndex).split(split,1)[0];value=value.substr(0,this.queryIndex)+input+value.substr(this.queryIndex+old.length);if(finish){var tokens=value.split(this.options.separatorSplit).filter(function(entry){return this.test(entry)},/[^\s,]+/);if(!this.options.allowDupes)tokens=[].combine(tokens);var sep=this.options.separator;value=tokens.join(sep)+sep;end=value.length}};this.observer.setValue(value);this.opted=value;if(finish||this.selectMode=='pick')start=end;this.element.selectRange(start,end);this.fireEvent('onSelection',[this.element,this.selected,value,input])},showChoices:function(){var match=this.options.choicesMatch,first=this.choices.getFirst(match);this.selected=this.selectedValue=null;if(this.fix){var pos=this.element.getCoordinates(this.relative),width=this.options.width||'auto';this.choices.setStyles({left:pos.left,top:pos.bottom,width:(width===true||width=='inherit')?pos.width:width})};if(!first)return;if(!this.visible){this.visible=true;this.choices.setStyle('display','');if(this.fx)this.fx.start(1);this.fireEvent('onShow',[this.element,this.choices])};if(this.options.selectFirst||this.typeAhead||first.inputValue==this.queryValue)this.choiceOver(first,this.typeAhead);var items=this.choices.getChildren(match),max=this.options.maxChoices,styles={overflowY:'hidden',height:''};this.overflown=false;if(items.length>max){var item=items[max-1];styles.overflowY='scroll';styles.height=item.getCoordinates(this.choices).bottom;this.overflown=true};this.choices.setStyles(styles);this.fix.show();if(this.options.visibleChoices){var scroll=document.getScroll(),size=document.getSize(),coords=this.choices.getCoordinates();if(coords.right>scroll.x+size.x)scroll.x=coords.right-size.x;if(coords.bottom>scroll.y+size.y)scroll.y=coords.bottom-size.y;window.scrollTo(Math.min(scroll.x,coords.left),Math.min(scroll.y,coords.top))}},hideChoices:function(clear){if(clear){var value=this.element.value;if(this.options.forceSelect)value=this.opted;if(this.options.autoTrim)value=value.split(this.options.separatorSplit).filter($arguments(0)).join(this.options.separator);this.observer.setValue(value)};if(!this.visible)return;this.visible=false;if(this.selected)this.selected.removeClass('autocompleter-selected');this.observer.clear();var hide=function(){this.choices.setStyle('display','none');this.fix.hide()}.bind(this);if(this.fx){this.fx.start(0).chain(hide)}else hide();this.fireEvent('onHide',[this.element,this.choices])},prefetch:function(){var value=this.element.value,query=value;if(this.options.multiple){var split=this.options.separatorSplit,values=value.split(split),index=this.element.getSelectedRange().start,toIndex=value.substr(0,index).split(split),last=toIndex.length-1;index-=toIndex[last].length;query=values[last]};if(query.length<this.options.minLength){this.hideChoices()}else if(query===this.queryValue||(this.visible&&query==this.selectedValue)){if(this.visible)return false;this.showChoices()}else{this.queryValue=query;this.queryIndex=index;if(!this.fetchCached())this.query()};return true},fetchCached:function(){return false;if(!this.options.cache||!this.cached||!this.cached.length||this.cached.length>=this.options.maxChoices||this.queryValue)return false;this.update(this.filter(this.cached));return true},update:function(tokens){this.choices.empty();this.cached=tokens;var type=tokens&&typeOf(tokens);if(!type||(type=='array'&&!tokens.length)||(type=='hash'&&!tokens.getLength())){(this.options.emptyChoices||this.hideChoices).call(this)}else{if(this.options.maxChoices<tokens.length&&!this.options.overflow)tokens.length=this.options.maxChoices;tokens.each(this.options.injectChoice||function(token){var choice=new Element('li',{html:this.markQueryValue(token)});choice.inputValue=token;this.addChoiceEvents(choice).inject(this.choices)},this);this.showChoices()}},choiceOver:function(choice,selection){if(!choice||choice==this.selected)return;if(this.selected)this.selected.removeClass('autocompleter-selected');this.selected=choice.addClass('autocompleter-selected');this.fireEvent('onSelect',[this.element,this.selected,selection]);if(!this.selectMode)this.opted=this.element.value;if(!selection)return;this.selectedValue=this.selected.inputValue;if(this.overflown){var coords=this.selected.getCoordinates(this.choices),margin=this.options.overflowMargin,top=this.choices.scrollTop,height=this.choices.offsetHeight,bottom=top+height;if(coords.top-margin<top&&top){this.choices.scrollTop=Math.max(coords.top-margin,0)}else if(coords.bottom+margin>bottom)this.choices.scrollTop=Math.min(coords.bottom-height+margin,bottom)};if(this.selectMode)this.setSelection()},choiceSelect:function(choice){if(choice)this.choiceOver(choice);this.setSelection(true);this.queryValue=false;this.hideChoices()},filter:function(tokens){return(tokens||this.tokens).filter(function(token){return this.test(token)},new RegExp(((this.options.filterSubset)?'':'^')+this.queryValue.escapeRegExp(),(this.options.filterCase)?'':'i'))},markQueryValue:function(str){return(!this.options.markQuery||!this.queryValue)?str:str.replace(new RegExp('('+((this.options.filterSubset)?'':'^')+this.queryValue.escapeRegExp()+')',(this.options.filterCase)?'':'i'),'<span class="autocompleter-queried">$1</span>')},addChoiceEvents:function(el){return el.addEvents({mouseover:this.choiceOver.bind(this,el),click:this.choiceSelect.bind(this,el)})}}),OverlayFix=new Class({initialize:function(el){if(Browser.ie){this.element=document.id(el);this.relative=this.element.getOffsetParent();this.fix=new Element('iframe',{frameborder:'0',scrolling:'no',src:'javascript:false;',styles:{position:'absolute',border:'none',display:'none',filter:'progid:DXImageTransform.Microsoft.Alpha(opacity=0)'}}).inject(this.element,'after')}},show:function(){if(this.fix){var coords=this.element.getCoordinates(this.relative);delete coords.right;delete coords.bottom;this.fix.setStyles(Object.append(coords,{display:'',zIndex:(this.element.getStyle('zIndex')||1)-1}))};return this},hide:function(){if(this.fix)this.fix.setStyle('display','none');return this},destroy:function(){if(this.fix)this.fix=this.fix.destroy()}});Element.implement({getSelectedRange:function(){if(!Browser.ie)return{start:this.selectionStart,end:this.selectionEnd};var pos={start:0,end:0},range=this.getDocument().selection.createRange();if(!range||range.parentElement()!=this)return pos;var dup=range.duplicate();if(this.type=='text'){pos.start=0-dup.moveStart('character',-1e5);pos.end=pos.start+range.text.length}else{var value=this.value,offset=value.length-value.match(/[\n\r]*$/)[0].length;dup.moveToElementText(this);dup.setEndPoint('StartToEnd',range);pos.end=offset-dup.text.length;dup.setEndPoint('StartToStart',range);pos.start=offset-dup.text.length};return pos},selectRange:function(start,end){if(Browser.ie){var diff=this.value.substr(start,end-start).replace(/\r/g,'').length;start=this.value.substr(0,start).replace(/\r/g,'').length;var range=this.createTextRange();range.collapse(true);range.moveEnd('character',start+diff);range.moveStart('character',start);range.select()}else{this.focus();this.setSelectionRange(start,end)};return this}});Autocompleter.Base=Autocompleter;Autocompleter.Request=new Class({Extends:Autocompleter,options:{postData:{},ajaxOptions:{},postVar:'value'},query:function(){var data=this.options.postData.unlink||{};data[this.options.postVar]=this.queryValue;var indicator=document.id(this.options.indicator);if(indicator)indicator.setStyle('display','');var cls=this.options.indicatorClass;if(cls)this.element.addClass(cls);this.fireEvent('onRequest',[this.element,this.request,data,this.queryValue]);this.request.send({data:data})},queryResponse:function(){var indicator=document.id(this.options.indicator);if(indicator)indicator.setStyle('display','none');var cls=this.options.indicatorClass;if(cls)this.element.removeClass(cls);return this.fireEvent('onComplete',[this.element,this.request])}});Autocompleter.Request.JSON=new Class({Extends:Autocompleter.Request,initialize:function(el,url,options){this.parent(el,options);this.request=new Request.JSON(Object.merge({},{url:url,link:'cancel'},this.options.ajaxOptions)).addEvent('onComplete',this.queryResponse.bind(this))},queryResponse:function(response){this.parent();this.update(response)}});Autocompleter.Request.HTML=new Class({Extends:Autocompleter.Request,initialize:function(el,url,options){this.parent(el,options);this.request=new Request.HTML(Object.merge({},{url:url,link:'cancel',update:this.choices},this.options.ajaxOptions)).addEvent('onComplete',this.queryResponse.bind(this))},queryResponse:function(tree,elements){this.parent();if(!elements||!elements.length){this.hideChoices()}else{this.choices.getChildren(this.options.choicesMatch).each(this.options.injectChoice||function(choice){var value=choice.innerHTML;choice.inputValue=value;this.addChoiceEvents(choice.set('html',this.markQueryValue(value)))},this);this.showChoices()}}});Autocompleter.Ajax={Base:Autocompleter.Request,Json:Autocompleter.Request.JSON,Xhtml:Autocompleter.Request.HTML}window.Modernizr=(function(window,document,undefined){var version='2.7.0',Modernizr={},enableClasses=true,docElement=document.documentElement,mod='modernizr',modElem=document.createElement(mod),mStyle=modElem.style,inputElem=document.createElement('input'),smile=':)',toString={}.toString,prefixes=' -webkit- -moz- -o- -ms- '.split(' '),omPrefixes='Webkit Moz O ms',cssomPrefixes=omPrefixes.split(' '),domPrefixes=omPrefixes.toLowerCase().split(' '),ns={svg:'http://www.w3.org/2000/svg'},tests={},inputs={},attrs={},classes=[],slice=classes.slice,featureName,injectElementWithStyles=function(rule,callback,nodes,testnames){var style,ret,node,docOverflow,div=document.createElement('div'),body=document.body,fakeBody=body||document.createElement('body');if(parseInt(nodes,10))while(nodes--){node=document.createElement('div');node.id=testnames?testnames[nodes]:mod+(nodes+1);div.appendChild(node)};style=['&#173;','<style id="s',mod,'">',rule,'</style>'].join('');div.id=mod;(body?div:fakeBody).innerHTML+=style;fakeBody.appendChild(div);if(!body){fakeBody.style.background='';fakeBody.style.overflow='hidden';docOverflow=docElement.style.overflow;docElement.style.overflow='hidden';docElement.appendChild(fakeBody)};ret=callback(div,rule);if(!body){fakeBody.parentNode.removeChild(fakeBody);docElement.style.overflow=docOverflow}else div.parentNode.removeChild(div);return!!ret},isEventSupported=(function(){var TAGNAMES={select:'input',change:'input',submit:'form',reset:'form',error:'img',load:'img',abort:'img'}
function isEventSupported(eventName,element){element=element||document.createElement(TAGNAMES[eventName]||'div');eventName='on'+eventName;var isSupported=eventName in element;if(!isSupported){if(!element.setAttribute)element=document.createElement('div');if(element.setAttribute&&element.removeAttribute){element.setAttribute(eventName,'');isSupported=is(element[eventName],'function');if(!is(element[eventName],'undefined'))element[eventName]=undefined;element.removeAttribute(eventName)}};element=null;return isSupported};return isEventSupported})(),_hasOwnProperty={}.hasOwnProperty,hasOwnProp;if(!is(_hasOwnProperty,'undefined')&&!is(_hasOwnProperty.call,'undefined')){hasOwnProp=function(object,property){return _hasOwnProperty.call(object,property)}}else hasOwnProp=function(object,property){return((property in object)&&is(object.constructor.prototype[property],'undefined'))};if(!Function.prototype.bind)Function.prototype.bind=function bind(that){var target=this;if(typeof target!="function")throw new TypeError();var args=slice.call(arguments,1),bound=function(){if(this instanceof bound){var F=function(){};F.prototype=target.prototype;var self=new F(),result=target.apply(self,args.concat(slice.call(arguments)));if(Object(result)===result)return result;return self}else return target.apply(that,args.concat(slice.call(arguments)))};return bound}
function setCss(str){mStyle.cssText=str}
function setCssAll(str1,str2){return setCss(prefixes.join(str1+';')+(str2||''))}
function is(obj,type){return typeof obj===type}
function contains(str,substr){return!!~(''+str).indexOf(substr)}
function testProps(props,prefixed){for(var i in props){var prop=props[i];if(!contains(prop,"-")&&mStyle[prop]!==undefined)return prefixed=='pfx'?prop:true};return false}
function testDOMProps(props,obj,elem){for(var i in props){var item=obj[props[i]];if(item!==undefined){if(elem===false)return props[i];if(is(item,'function'))return item.bind(elem||obj);return item}};return false}
function testPropsAll(prop,prefixed,elem){var ucProp=prop.charAt(0).toUpperCase()+prop.slice(1),props=(prop+' '+cssomPrefixes.join(ucProp+' ')+ucProp).split(' ');if(is(prefixed,"string")||is(prefixed,"undefined")){return testProps(props,prefixed)}else{props=(prop+' '+domPrefixes.join(ucProp+' ')+ucProp).split(' ');return testDOMProps(props,prefixed,elem)}};tests.flexbox=function(){return testPropsAll('flexWrap')};tests.canvas=function(){var elem=document.createElement('canvas');return!!(elem.getContext&&elem.getContext('2d'))};tests.canvastext=function(){return!!(Modernizr.canvas&&is(document.createElement('canvas').getContext('2d').fillText,'function'))};tests.webgl=function(){return!!window.WebGLRenderingContext};tests.touch=function(){var bool;if(('ontouchstart'in window)||window.DocumentTouch&&document instanceof DocumentTouch){bool=true}else injectElementWithStyles(['@media (',prefixes.join('touch-enabled),('),mod,')','{#modernizr{top:9px;position:absolute}}'].join(''),function(node){bool=node.offsetTop===9});return bool};tests.geolocation=function(){return'geolocation'in navigator};tests.postmessage=function(){return!!window.postMessage};tests.websqldatabase=function(){return!!window.openDatabase};tests.indexedDB=function(){return!!testPropsAll("indexedDB",window)};tests.hashchange=function(){return isEventSupported('hashchange',window)&&(document.documentMode===undefined||document.documentMode>7)};tests.history=function(){return!!(window.history&&history.pushState)};tests.draganddrop=function(){var div=document.createElement('div');return('draggable'in div)||('ondragstart'in div&&'ondrop'in div)};tests.websockets=function(){return'WebSocket'in window||'MozWebSocket'in window};tests.rgba=function(){setCss('background-color:rgba(150,255,150,.5)');return contains(mStyle.backgroundColor,'rgba')};tests.hsla=function(){setCss('background-color:hsla(120,40%,100%,.5)');return contains(mStyle.backgroundColor,'rgba')||contains(mStyle.backgroundColor,'hsla')};tests.multiplebgs=function(){setCss('background:url(https://),url(https://),red url(https://)');return/(url\s*\(.*?){3}/.test(mStyle.background)};tests.backgroundsize=function(){return testPropsAll('backgroundSize')};tests.borderimage=function(){return testPropsAll('borderImage')};tests.borderradius=function(){return testPropsAll('borderRadius')};tests.boxshadow=function(){return testPropsAll('boxShadow')};tests.textshadow=function(){return document.createElement('div').style.textShadow===''};tests.opacity=function(){setCssAll('opacity:.55');return/^0.55$/.test(mStyle.opacity)};tests.cssanimations=function(){return testPropsAll('animationName')};tests.csscolumns=function(){return testPropsAll('columnCount')};tests.cssgradients=function(){var str1='background-image:',str2='gradient(linear,left top,right bottom,from(#9f9),to(white));',str3='linear-gradient(left top,#9f9, white);';setCss((str1+'-webkit- '.split(' ').join(str2+str1)+prefixes.join(str3+str1)).slice(0,-str1.length));return contains(mStyle.backgroundImage,'gradient')};tests.cssreflections=function(){return testPropsAll('boxReflect')};tests.csstransforms=function(){return!!testPropsAll('transform')};tests.csstransforms3d=function(){var ret=!!testPropsAll('perspective');if(ret&&'webkitPerspective'in docElement.style)injectElementWithStyles('@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}',function(node,rule){ret=node.offsetLeft===9&&node.offsetHeight===3});return ret};tests.csstransitions=function(){return testPropsAll('transition')};tests.fontface=function(){var bool;injectElementWithStyles('@font-face {font-family:"font";src:url("https://")}',function(node,rule){var style=document.getElementById('smodernizr'),sheet=style.sheet||style.styleSheet,cssText=sheet?(sheet.cssRules&&sheet.cssRules[0]?sheet.cssRules[0].cssText:sheet.cssText||''):'';bool=/src/i.test(cssText)&&cssText.indexOf(rule.split(' ')[0])===0});return bool};tests.generatedcontent=function(){var bool;injectElementWithStyles(['#',mod,'{font:0/0 a}#',mod,':after{content:"',smile,'";visibility:hidden;font:3px/1 a}'].join(''),function(node){bool=node.offsetHeight>=3});return bool};tests.video=function(){var elem=document.createElement('video'),bool=false;try{if(bool=!!elem.canPlayType){bool=new Boolean(bool);bool.ogg=elem.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,'');bool.h264=elem.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,'');bool.webm=elem.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,'')}}catch(e){};return bool};tests.audio=function(){var elem=document.createElement('audio'),bool=false;try{if(bool=!!elem.canPlayType){bool=new Boolean(bool);bool.ogg=elem.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,'');bool.mp3=elem.canPlayType('audio/mpeg;').replace(/^no$/,'');bool.wav=elem.canPlayType('audio/wav; codecs="1"').replace(/^no$/,'');bool.m4a=(elem.canPlayType('audio/x-m4a;')||elem.canPlayType('audio/aac;')).replace(/^no$/,'')}}catch(e){};return bool};tests.localstorage=function(){try{localStorage.setItem(mod,mod);localStorage.removeItem(mod);return true}catch(e){return false}};tests.sessionstorage=function(){try{sessionStorage.setItem(mod,mod);sessionStorage.removeItem(mod);return true}catch(e){return false}};tests.webworkers=function(){return!!window.Worker};tests.applicationcache=function(){return!!window.applicationCache};tests.svg=function(){return!!document.createElementNS&&!!document.createElementNS(ns.svg,'svg').createSVGRect};tests.inlinesvg=function(){var div=document.createElement('div');div.innerHTML='<svg/>';return(div.firstChild&&div.firstChild.namespaceURI)==ns.svg};tests.smil=function(){return!!document.createElementNS&&/SVGAnimate/.test(toString.call(document.createElementNS(ns.svg,'animate')))};tests.svgclippaths=function(){return!!document.createElementNS&&/SVGClipPath/.test(toString.call(document.createElementNS(ns.svg,'clipPath')))}
function webforms(){Modernizr.input=(function(props){for(var i=0,len=props.length;i<len;i++)attrs[props[i]]=!!(props[i]in inputElem);if(attrs.list)attrs.list=!!(document.createElement('datalist')&&window.HTMLDataListElement);return attrs})('autocomplete autofocus list placeholder max min multiple pattern required step'.split(' '));Modernizr.inputtypes=(function(props){for(var i=0,bool,inputElemType,defaultView,len=props.length;i<len;i++){inputElem.setAttribute('type',inputElemType=props[i]);bool=inputElem.type!=='text';if(bool){inputElem.value=smile;inputElem.style.cssText='position:absolute;visibility:hidden;';if(/^range$/.test(inputElemType)&&inputElem.style.WebkitAppearance!==undefined){docElement.appendChild(inputElem);defaultView=document.defaultView;bool=defaultView.getComputedStyle&&defaultView.getComputedStyle(inputElem,null).WebkitAppearance!=='textfield'&&(inputElem.offsetHeight!==0);docElement.removeChild(inputElem)}else if(/^(search|tel)$/.test(inputElemType));else if(/^(url|email)$/.test(inputElemType)){bool=inputElem.checkValidity&&inputElem.checkValidity()===false}else bool=inputElem.value!=smile};inputs[props[i]]=!!bool};return inputs})('search tel url email datetime date month week time datetime-local number range color'.split(' '))};for(var feature in tests)if(hasOwnProp(tests,feature)){featureName=feature.toLowerCase();Modernizr[featureName]=tests[feature]();classes.push((Modernizr[featureName]?'':'no-')+featureName)};Modernizr.input||webforms();Modernizr.addTest=function(feature,test){if(typeof feature=='object'){for(var key in feature)if(hasOwnProp(feature,key))Modernizr.addTest(key,feature[key])}else{feature=feature.toLowerCase();if(Modernizr[feature]!==undefined)return Modernizr;test=typeof test=='function'?test():test;if(typeof enableClasses!=="undefined"&&enableClasses)docElement.className+=' '+(test?'':'no-')+feature;Modernizr[feature]=test};return Modernizr};setCss('');modElem=inputElem=null;(function(window,document){var version='3.7.0',options=window.html5||{},reSkip=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,saveClones=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,supportsHtml5Styles,expando='_html5shiv',expanID=0,expandoData={},supportsUnknownElements;(function(){try{var a=document.createElement('a');a.innerHTML='<xyz></xyz>';supportsHtml5Styles=('hidden'in a);supportsUnknownElements=a.childNodes.length==1||(function(){(document.createElement)('a');var frag=document.createDocumentFragment();return(typeof frag.cloneNode=='undefined'||typeof frag.createDocumentFragment=='undefined'||typeof frag.createElement=='undefined')}())}catch(e){supportsHtml5Styles=true;supportsUnknownElements=true}}())
function addStyleSheet(ownerDocument,cssText){var p=ownerDocument.createElement('p'),parent=ownerDocument.getElementsByTagName('head')[0]||ownerDocument.documentElement;p.innerHTML='x<style>'+cssText+'</style>';return parent.insertBefore(p.lastChild,parent.firstChild)}
function getElements(){var elements=html5.elements;return typeof elements=='string'?elements.split(' '):elements}
function getExpandoData(ownerDocument){var data=expandoData[ownerDocument[expando]];if(!data){data={};expanID++;ownerDocument[expando]=expanID;expandoData[expanID]=data};return data}
function createElement(nodeName,ownerDocument,data){if(!ownerDocument)ownerDocument=document;if(supportsUnknownElements)return ownerDocument.createElement(nodeName);if(!data)data=getExpandoData(ownerDocument);var node;if(data.cache[nodeName]){node=data.cache[nodeName].cloneNode()}else if(saveClones.test(nodeName)){node=(data.cache[nodeName]=data.createElem(nodeName)).cloneNode()}else node=data.createElem(nodeName);return node.canHaveChildren&&!reSkip.test(nodeName)&&!node.tagUrn?data.frag.appendChild(node):node}
function createDocumentFragment(ownerDocument,data){if(!ownerDocument)ownerDocument=document;if(supportsUnknownElements)return ownerDocument.createDocumentFragment();data=data||getExpandoData(ownerDocument);var clone=data.frag.cloneNode(),i=0,elems=getElements(),l=elems.length;for(;i<l;i++)clone.createElement(elems[i]);return clone}
function shivMethods(ownerDocument,data){if(!data.cache){data.cache={};data.createElem=ownerDocument.createElement;data.createFrag=ownerDocument.createDocumentFragment;data.frag=data.createFrag()};ownerDocument.createElement=function(nodeName){if(!html5.shivMethods)return data.createElem(nodeName);return createElement(nodeName,ownerDocument,data)};ownerDocument.createDocumentFragment=Function('h,f','return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&('+getElements().join().replace(/[\w\-]+/g,function(nodeName){data.createElem(nodeName);data.frag.createElement(nodeName);return'c("'+nodeName+'")'})+');return n}')(html5,data.frag)}
function shivDocument(ownerDocument){if(!ownerDocument)ownerDocument=document;var data=getExpandoData(ownerDocument);if(html5.shivCSS&&!supportsHtml5Styles&&!data.hasCSS)data.hasCSS=!!addStyleSheet(ownerDocument,'article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}');if(!supportsUnknownElements)shivMethods(ownerDocument,data);return ownerDocument};var html5={elements:options.elements||'abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output progress section summary template time video',version:version,shivCSS:(options.shivCSS!==false),supportsUnknownElements:supportsUnknownElements,shivMethods:(options.shivMethods!==false),type:'default',shivDocument:shivDocument,createElement:createElement,createDocumentFragment:createDocumentFragment};window.html5=html5;shivDocument(document)}(this,document));Modernizr._version=version;Modernizr._prefixes=prefixes;Modernizr._domPrefixes=domPrefixes;Modernizr._cssomPrefixes=cssomPrefixes;Modernizr.hasEvent=isEventSupported;Modernizr.testProp=function(prop){return testProps([prop])};Modernizr.testAllProps=testPropsAll;Modernizr.testStyles=injectElementWithStyles;Modernizr.prefixed=function(prop,obj,elem){if(!obj){return testPropsAll(prop,'pfx')}else return testPropsAll(prop,obj,elem)};docElement.className=docElement.className.replace(/(^|\s)no-js(\s|$)/,'$1$2')+(enableClasses?' js '+classes.join(' '):'');return Modernizr})(this,this.document);(function(a,b,c){function d(a){return"[object Function]"==o.call(a)}
function e(a){return"string"==typeof a}
function f(){}
function g(a){return!a||"loaded"==a||"complete"==a||"uninitialized"==a}
function h(){var a=p.shift();q=1,a?a.t?m(function(){("c"==a.t?B.injectCss:B.injectJs)(a.s,0,a.a,a.x,a.e,1)},0):(a(),h()):q=0}
function i(a,c,d,e,f,i,j){function k(b){if(!o&&g(l.readyState)&&(u.r=o=1,!q&&h(),l.onload=l.onreadystatechange=null,b)){"img"!=a&&m(function(){t.removeChild(l)},50);for(var d in y[c])y[c].hasOwnProperty(d)&&y[c][d].onload()}};var j=j||B.errorTimeout,l=b.createElement(a),o=0,r=0,u={t:d,s:c,e:f,a:i,x:j};1===y[c]&&(r=1,y[c]=[]),"object"==a?l.data=c:(l.src=c,l.type=a),l.width=l.height="0",l.onerror=l.onload=l.onreadystatechange=function(){k.call(this,r)},p.splice(e,0,u),"img"!=a&&(r||2===y[c]?(t.insertBefore(l,s?null:n),m(k,j)):y[c].push(l))}
function j(a,b,c,d,f){return q=0,b=b||"j",e(a)?i("c"==b?v:u,a,b,this.i++,c,d,f):(p.splice(this.i++,0,a),1==p.length&&h()),this}
function k(){var a=B;return a.loader={load:j,i:0},a};var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=s?l:n.parentNode,l=a.opera&&"[object Opera]"==o.call(a.opera),l=!!b.attachEvent&&!l,u=r?"object":l?"script":"img",v=l?"script":u,w=Array.isArray||function(a){return"[object Array]"==o.call(a)},x=[],y={},z={timeout:function(a,b){return b.length&&(a.timeout=b[0]),a}},A,B;B=function(a){function b(a){var a=a.split("!"),b=x.length,c=a.pop(),d=a.length,c={url:c,origUrl:c,prefixes:a},e,f,g;for(f=0;f<d;f++)g=a[f].split("="),(e=z[g.shift()])&&(c=e(c,g));for(f=0;f<b;f++)c=x[f](c);return c}
function g(a,e,f,g,h){var i=b(a),j=i.autoCallback;i.url.split(".").pop().split("?").shift(),i.bypass||(e&&(e=d(e)?e:e[a]||e[g]||e[a.split("/").pop().split("?")[0]]),i.instead?i.instead(a,e,f,g,h):(y[i.url]?i.noexec=!0:y[i.url]=1,f.load(i.url,i.forceCSS||!i.forceJS&&"css"==i.url.split(".").pop().split("?").shift()?"c":c,i.noexec,i.attrs,i.timeout),(d(e)||d(j))&&f.load(function(){k(),e&&e(i.origUrl,h,g),j&&j(i.origUrl,h,g),y[i.url]=2})))}
function h(a,b){function c(a,c){if(a){if(e(a)){c||(j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}),g(a,j,b,0,h)}else if(Object(a)===a)for(n in m=function(){var b=0,c;for(c in a)a.hasOwnProperty(c)&&b++;return b}(),a)a.hasOwnProperty(n)&&(!c&&!--m&&(d(j)?j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}:j[n]=function(a){return function(){var b=[].slice.call(arguments);a&&a.apply(this,b),l()}}(k[n])),g(a[n],j,b,n,h))}else !c&&l()};var h=!!a.test,i=a.load||a.both,j=a.callback||f,k=j,l=a.complete||f,m,n;c(h?a.yep:a.nope,!!i),i&&c(i)};var i,j,l=this.yepnope.loader;if(e(a)){g(a,0,l,0)}else if(w(a)){for(i=0;i<a.length;i++)j=a[i],e(j)?g(j,0,l,0):w(j)?B(j):Object(j)===j&&h(j,l)}else Object(a)===a&&h(a,l)},B.addPrefix=function(a,b){z[a]=b},B.addFilter=function(a){x.push(a)},B.errorTimeout=1e4,null==b.readyState&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",A=function(){b.removeEventListener("DOMContentLoaded",A,0),b.readyState="complete"},0)),a.yepnope=k(),a.yepnope.executeStack=h,a.yepnope.injectJs=function(a,c,d,e,i,j){var k=b.createElement("script"),l,o,e=e||B.errorTimeout;k.src=a;for(o in d)k.setAttribute(o,d[o]);c=j?h:c||f,k.onreadystatechange=k.onload=function(){!l&&g(k.readyState)&&(l=1,c(),k.onload=k.onreadystatechange=null)},m(function(){l||(l=1,c(1))},e),i?k.onload():n.parentNode.insertBefore(k,n)},a.yepnope.injectCss=function(a,c,d,e,g,i){var e=b.createElement("link"),j,c=i?h:c||f;e.href=a,e.rel="stylesheet",e.type="text/css";for(j in d)e.setAttribute(j,d[j]);g||(n.parentNode.insertBefore(e,n),m(c,0))}})(this,document);Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))}