" Vim syntax file
"      Language: JavaScript
"    Maintainer: Jose Elera Campana <https://github.com/jelera>
" Last Modified: Wed 24 Feb 2016 03:35:03 AM CST
"       Version: 0.8.2
"       Credits: Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based
"                on their hard work), gumnos (From the #vim IRC Channel in
"                Freenode), all the contributors at this project's github page
"                (https://github.com/jelera/vim-javascript-syntax/graphs/contributors)

if !exists("main_syntax")
	if version < 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
	unlet javaScript_fold
endif

"" Remove dollar sign from identifier when embedded in a PHP file
if &filetype == 'javascript'
	setlocal iskeyword+=$
endif

syntax sync fromstart

"" syntax coloring for Node.js shebang line
syntax match shebang "^#!.*"
hi link shebang Comment

" Statement Keywords {{{
syntax keyword javaScriptSource         import export from
syntax keyword javaScriptIdentifier     arguments this let var void yield async await const
syntax keyword javaScriptOperator       delete new instanceof typeof
syntax keyword javaScriptBoolean        true false
syntax keyword javaScriptNull           null undefined
syntax keyword javaScriptMessage        alert confirm prompt status
syntax keyword javaScriptGlobal         self top parent
syntax keyword javaScriptDeprecated     escape unescape all applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding
syntax keyword javaScriptConditional    if else switch
syntax keyword javaScriptRepeat         do while for in of
syntax keyword javaScriptBranch         break continue
syntax keyword javaScriptLabel          case default
syntax keyword javaScriptPrototype      prototype
syntax keyword javaScriptStatement      return with
syntax keyword javaScriptGlobalObjects  Array Boolean Date Function Math Number Object RegExp String
syntax keyword javaScriptExceptions     try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
syntax keyword javaScriptReserved       abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws goto private transient debugger implements protected volatile double import public
"}}}
" Comments {{{
syntax keyword javaScriptCommentTodo      TODO FIXME XXX TBD OPTIMIZE HACK REVIEW contained
syntax match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syntax match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javaScriptComment          start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
"}}}
" JSDoc support {{{
if !exists("javascript_ignore_javaScriptdoc")
	syntax case ignore

	" syntax coloring for JSDoc comments (HTML)
	"unlet b:current_syntax

	syntax region javaScriptDocComment        matchgroup=javaScriptComment start="/\*\*\s*$"  end="\*/" contains=javaScriptDocTags,javaScriptCommentTodo,@javaScriptHtml,jsInJsdocExample,@Spell fold
	syntax match  javaScriptDocTags           contained "@\(abstract\|access\|alias\|arg\|argument\|augments\|author\|borrows\|callback\|class\|classdesc\|const\|constant\|constructor\|constructs\|copyright\|default\|defaultvalue\|deprecated\|desc\|description\|emits\|enum\|event\|example\|exception\|exports\|extends\|external\|file\|fileoverview\|fires\|func\|function\|global\|host\|ignore\|implements\|inheritdoc\|inner\|instance\|interface\|kind\|lends\|license\|link\|linkcode\|linkplain\|listens\|member\|memberof\|method\|mixes\|mixin\|module\|name\|namespace\|override\|overview\|param\|private\|prop\|property\|cfg\|protected\|public\|readonly\|requires\|return\|returns\|see\|since\|static\|summary\|this\|throws\|todo\|tutorial\|tutorial\|type\|typedef\|var\|variation\|version\|virtual\)\>" nextgroup=javaScriptDocParam,javaScriptDocSeeTag skipwhite
	syntax match  javaScriptDocParam          contained "\%(#\|\w\|\.\|:\|\/\)\+"
	syntax region javaScriptDocSeeTag         contained matchgroup=javaScriptDocSeeTag start="{" end="}" contains=javaScriptDocTags

	syntax case match
endif
	syntax case match
"}}}
" Strings, Numbers and Regex Highlight {{{
syntax match   javaScriptSpecial          "\\\d\d\d\|\\."
syntax region  javaScriptString	          start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptString	          start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc

syntax match   javaScriptSpecialCharacter "'\\.'"
syntax match   javaScriptNumber           "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syntax match   javaScriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
"}}}
"  DOM, Browser and Ajax Support   {{{
syntax keyword javaScriptBrowserObjects           window navigator screen history location console

syntax keyword javaScriptDOMObjects               document event HTMLElement Anchor Area Base Body Button Form Frame Frameset Image Link Meta Option Select Style Table TableCell TableRow Textarea
syntax keyword javaScriptDOMMethods               createTextNode createElement insertBefore replaceChild removeChild appendChild  hasChildNodes  cloneNode  normalize  isSupported  hasAttributes  getAttribute  setAttribute  removeAttribute  getAttributeNode  setAttributeNode  removeAttributeNode  getElementsByTagName  hasAttribute  getElementById adoptNode close compareDocumentPosition createAttribute createCDATASection createComment createDocumentFragment createElementNS createEvent createExpression createNSResolver createProcessingInstruction createRange createTreeWalker elementFromPoint evaluate getBoxObjectFor getElementsByClassName getSelection getUserData hasFocus importNode
syntax keyword javaScriptDOMProperties            nodeName  nodeValue  nodeType  parentNode  childNodes  firstChild  lastChild  previousSibling  nextSibling  attributes  ownerDocument  namespaceURI  prefix  localName  tagName

syntax keyword javaScriptAjaxObjects              XMLHttpRequest
syntax keyword javaScriptAjaxProperties           readyState responseText responseXML statusText
syntax keyword javaScriptAjaxMethods              onreadystatechange abort getAllResponseHeaders getResponseHeader open send setRequestHeader

syntax keyword javaScriptPropietaryObjects        ActiveXObject
syntax keyword javaScriptPropietaryMethods        attachEvent detachEvent cancelBubble returnValue

syntax keyword javaScriptHtmlElemProperties       className  clientHeight  clientLeft  clientTop  clientWidth  dir  href  id  innerHTML  lang  length  offsetHeight  offsetLeft  offsetParent  offsetTop  offsetWidth  scrollHeight  scrollLeft  scrollTop  scrollWidth  style  tabIndex  target  title

syntax keyword javaScriptEventListenerKeywords    blur click focus mouseover mouseout load item

syntax keyword javaScriptEventListenerMethods     scrollIntoView  addEventListener  dispatchEvent  removeEventListener preventDefault stopPropagation
" }}}
" DOM/HTML5/CSS specified things {{{
	" Web API Interfaces (very long list of keywords) {{{
	syntax keyword javaScriptWebAPI  AbstractWorker AnalyserNode AnimationEvent App Apps ArrayBuffer ArrayBufferView Attr AudioBuffer AudioBufferSourceNode AudioContext AudioDestinationNode AudioListener AudioNode AudioParam AudioProcessingEvent BatteryManager BiquadFilterNode Blob BlobBuilder BlobEvent CallEvent CameraCapabilities CameraControl CameraManager CanvasGradient CanvasImageSource CanvasPattern CanvasPixelArray CanvasRenderingContext2D CaretPosition CDATASection ChannelMergerNode ChannelSplitterNode CharacterData ChildNode ChromeWorker ClipboardEvent CloseEvent Comment CompositionEvent Connection Console ContactManager ConvolverNode Coordinates CSS CSSConditionRule CSSGroupingRule CSSKeyframeRule CSSKeyframesRule CSSMediaRule CSSNamespaceRule CSSPageRule CSSRule CSSRuleList CSSStyleDeclaration CSSStyleRule CSSStyleSheet CSSSupportsRule CustomEvent
	syntax keyword javaScriptWebAPI  DataTransfer DataView DedicatedWorkerGlobalScope DelayNode DeviceAcceleration DeviceLightEvent DeviceMotionEvent DeviceOrientationEvent DeviceProximityEvent DeviceRotationRate DeviceStorage DeviceStorageChangeEvent DirectoryEntry DirectoryEntrySync DirectoryReader DirectoryReaderSync Document DocumentFragment DocumentTouch DocumentType DOMConfiguration DOMCursor DOMError DOMErrorHandler DOMException DOMHighResTimeStamp DOMImplementation DOMImplementationList DOMImplementationSource DOMLocator DOMObject DOMParser DOMRequest DOMString DOMStringList DOMStringMap DOMTimeStamp DOMTokenList DOMUserData DynamicsCompressorNode
	syntax keyword javaScriptWebAPI  Element ElementTraversal Entity EntityReference Entry EntrySync ErrorEvent Event EventListener EventSource EventTarget Extensions File FileEntry FileEntrySync FileError FileException FileList FileReader FileSystem FileSystemSync Float32Array Float64Array FMRadio FocusEvent FormData GainNode Geolocation History
	syntax keyword javaScriptWebAPI  HTMLAnchorElement HTMLAreaElement HTMLAudioElement HTMLBaseElement HTMLBaseFontElement HTMLBodyElement HTMLBRElement HTMLButtonElement HTMLCanvasElement HTMLCollection HTMLDataElement HTMLDataListElement HTMLDivElement HTMLDListElement HTMLDocument HTMLElement HTMLEmbedElement HTMLFieldSetElement HTMLFormControlsCollection HTMLFormElement HTMLHeadElement HTMLHeadingElement HTMLHRElement HTMLHtmlElement HTMLIFrameElement HTMLImageElement HTMLInputElement HTMLIsIndexElement HTMLKeygenElement HTMLLabelElement HTMLLegendElement HTMLLIElement HTMLLinkElement HTMLMapElement HTMLMediaElement HTMLMetaElement HTMLMeterElement HTMLModElement HTMLObjectElement HTMLOListElement HTMLOptGroupElement HTMLOptionElement HTMLOptionsCollection HTMLOutputElement HTMLParagraphElement HTMLParamElement HTMLPreElement HTMLProgressElement HTMLQuoteElement HTMLScriptElement HTMLSelectElement HTMLSourceElement HTMLSpanElement HTMLStyleElement HTMLTableCaptionElement HTMLTableCellElement HTMLTableColElement HTMLTableElement HTMLTableRowElement HTMLTableSectionElement HTMLTextAreaElement HTMLTimeElement HTMLTitleElement HTMLTrackElement HTMLUListElement HTMLUnknownElement HTMLVideoElement
	syntax keyword javaScriptWebAPI  IDBCursor IDBCursorWithValue IDBDatabase IDBDatabaseException IDBEnvironment IDBFactory IDBIndex IDBKeyRange IDBObjectStore IDBOpenDBRequest IDBRequest IDBTransaction IDBVersionChangeEvent ImageData Int16Array Int32Array Int8Array KeyboardEvent LinkStyle LocalFileSystem LocalFileSystemSync Location MediaQueryList MediaQueryListListener MediaSource MediaStream MediaStreamTrack MessageEvent MouseEvent MouseScrollEvent MouseWheelEvent MozActivity MozActivityOptions MozActivityRequestHandler MozAlarmsManager MozContact MozContactChangeEvent MozIccManager MozMmsEvent MozMmsMessage MozMobileCellInfo MozMobileCFInfo MozMobileConnection MozMobileConnectionInfo MozMobileICCInfo MozMobileMessageManager MozMobileMessageThread MozMobileNetworkInfo MozNetworkStats MozNetworkStatsData MozNetworkStatsManager MozSettingsEvent MozSmsEvent MozSmsFilter MozSmsManager MozSmsMessage MozSmsSegmentInfo MozTimeManager MozWifiConnectionInfoEvent MutationObserver
	syntax keyword javaScriptWebAPI  NamedNodeMap NameList Navigator NavigatorGeolocation NavigatorID NavigatorLanguage NavigatorOnLine NavigatorPlugins NetworkInformation Node NodeFilter NodeIterator NodeList Notation Notification NotifyAudioAvailableEvent OfflineAudioCompletionEvent OfflineAudioContext PannerNode ParentNode Performance PerformanceNavigation PerformanceTiming Plugin PluginArray Position PositionError PositionOptions PowerManager ProcessingInstruction ProgressEvent Promise PromiseResolver PushManager
	syntax keyword javaScriptWebAPI  Range ScriptProcessorNode Selection SettingsLock SettingsManager SharedWorker StyleSheet StyleSheetList SVGAElement SVGAngle SVGAnimateColorElement SVGAnimatedAngle SVGAnimatedBoolean SVGAnimatedEnumeration SVGAnimatedInteger SVGAnimatedLengthList SVGAnimatedNumber SVGAnimatedNumberList SVGAnimatedPoints SVGAnimatedPreserveAspectRatio SVGAnimatedRect SVGAnimatedString SVGAnimatedTransformList SVGAnimateElement SVGAnimateMotionElement SVGAnimateTransformElement SVGAnimationElement SVGCircleElement SVGClipPathElement SVGCursorElement SVGDefsElement SVGDescElement SVGElement SVGEllipseElement SVGFilterElement SVGFontElement SVGFontFaceElement SVGFontFaceFormatElement SVGFontFaceNameElement SVGFontFaceSrcElement SVGFontFaceUriElement
	syntax keyword javaScriptWebAPI  SVGForeignObjectElement SVGGElement SVGGlyphElement SVGGradientElement SVGHKernElement SVGImageElement SVGLength SVGLengthList SVGLinearGradientElement SVGLineElement SVGMaskElement SVGMatrix SVGMissingGlyphElement SVGMPathElement SVGNumber SVGNumberList SVGPathElement SVGPatternElement SVGPolygonElement SVGPolylineElement SVGPreserveAspectRatio SVGRadialGradientElement SVGRect SVGRectElement SVGScriptElement SVGSetElement SVGStopElement SVGStringList SVGStylable SVGStyleElement SVGSVGElement SVGSwitchElement SVGSymbolElement SVGTests SVGTextElement SVGTextPositioningElement SVGTitleElement SVGTransform SVGTransformable SVGTransformList SVGTRefElement SVGTSpanElement SVGUseElement SVGViewElement SVGVKernElement TCPSocket Telephony TelephonyCall Text TextDecoder TextEncoder TextMetrics TimeRanges Touch TouchEvent TouchList Transferable TransitionEvent TreeWalker TypeInfo UIEvent Uint16Array Uint32Array Uint8Array Uint8ClampedArray URL URLUtils URLUtilsReadOnly
	" }}}
	" DOM2 CONSTANT {{{
	syntax keyword javaScriptDomErrNo       INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
	syntax keyword javaScriptDomNodeConsts  ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE
	"}}}
	" HTML events and internal variables"{{{
	syntax case ignore
	syntax keyword javaScriptHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize onload onsubmit
	syntax case match
	"}}}

	" Follow stuff should be highligh within a special context
	" While it can't be handled with context depended with Regex based highlight
	" So, turn it off by default
	if exists("javascript_enable_domhtmlcss")
	" DOM2 things {{{
	syntax match javaScriptDomElemAttrs     contained /\%(nodeName\|nodeValue\|nodeType\|parentNode\|childNodes\|firstChild\|lastChild\|previousSibling\|nextSibling\|attributes\|ownerDocument\|namespaceURI\|prefix\|localName\|tagName\)\>/
	syntax match javaScriptDomElemFuncs     contained /\%(insertBefore\|replaceChild\|removeChild\|appendChild\|hasChildNodes\|cloneNode\|normalize\|isSupported\|hasAttributes\|getAttribute\|setAttribute\|removeAttribute\|getAttributeNode\|setAttributeNode\|removeAttributeNode\|getElementsByTagName\|getAttributeNS\|setAttributeNS\|removeAttributeNS\|getAttributeNodeNS\|setAttributeNodeNS\|getElementsByTagNameNS\|hasAttribute\|hasAttributeNS\)\>/ nextgroup=javaScriptParen skipwhite
	"}}}
	" HTML things {{{
	syntax match javaScriptHtmlElemAttrs    contained /\%(className\|clientHeight\|clientLeft\|clientTop\|clientWidth\|dir\|id\|innerHTML\|lang\|length\|offsetHeight\|offsetLeft\|offsetParent\|offsetTop\|offsetWidth\|scrollHeight\|scrollLeft\|scrollTop\|scrollWidth\|style\|tabIndex\|title\)\>/
	syntax match javaScriptHtmlElemFuncs    contained /\%(blur\|click\|focus\|scrollIntoView\|addEventListener\|dispatchEvent\|removeEventListener\|item\)\>/ nextgroup=javaScriptParen skipwhite
	"}}}
	" CSS Styles in JavaScript {{{
	syntax keyword javaScriptCssStyles      contained color font fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight letterSpacing lineBreak lineHeight quotes rubyAlign rubyOverhang rubyPosition
	syntax keyword javaScriptCssStyles      contained textAlign textAlignLast textAutospace textDecoration textIndent textJustify textJustifyTrim textKashidaSpace textOverflowW6 textShadow textTransform textUnderlinePosition
	syntax keyword javaScriptCssStyles      contained unicodeBidi whiteSpace wordBreak wordSpacing wordWrap writingMode
	syntax keyword javaScriptCssStyles      contained bottom height left position right top width zIndex
	syntax keyword javaScriptCssStyles      contained border borderBottom borderLeft borderRight borderTop borderBottomColor borderLeftColor borderTopColor borderBottomStyle borderLeftStyle borderRightStyle borderTopStyle borderBottomWidth borderLeftWidth borderRightWidth borderTopWidth borderColor borderStyle borderWidth borderCollapse borderSpacing captionSide emptyCells tableLayout
	syntax keyword javaScriptCssStyles      contained margin marginBottom marginLeft marginRight marginTop outline outlineColor outlineStyle outlineWidth padding paddingBottom paddingLeft paddingRight paddingTop
	syntax keyword javaScriptCssStyles      contained listStyle listStyleImage listStylePosition listStyleType
	syntax keyword javaScriptCssStyles      contained background backgroundAttachment backgroundColor backgroundImage gackgroundPosition backgroundPositionX backgroundPositionY backgroundRepeat
	syntax keyword javaScriptCssStyles      contained clear clip clipBottom clipLeft clipRight clipTop content counterIncrement counterReset cssFloat cursor direction display filter layoutGrid layoutGridChar layoutGridLine layoutGridMode layoutGridType
	syntax keyword javaScriptCssStyles      contained marks maxHeight maxWidth minHeight minWidth opacity MozOpacity overflow overflowX overflowY verticalAlign visibility zoom cssText
	syntax keyword javaScriptCssStyles      contained scrollbar3dLightColor scrollbarArrowColor scrollbarBaseColor scrollbarDarkShadowColor scrollbarFaceColor scrollbarHighlightColor scrollbarShadowColor scrollbarTrackColor
	"}}}
	" Highlight ways {{{
	syntax match javaScriptDotNotation      "\." nextgroup=javaScriptPrototype,javaScriptDomElemAttrs,javaScriptDomElemFuncs,javaScriptHtmlElemAttrs,javaScriptHtmlElemFuncs
	syntax match javaScriptDotNotation      "\.style\." nextgroup=javaScriptCssStyles
	"}}}
	endif
" end DOM/HTML/CSS specified things }}}
" Code blocks"{{{
syntax cluster javaScriptAll       contains=javaScriptComment,javaScriptLineComment,javaScriptDocComment,javaScriptString,javaScriptRegexpString,javaScriptNumber,javaScriptFloat,javaScriptLabel,javaScriptSource,javaScriptWebAPI,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFuncKeyword,javaScriptConditional,javaScriptGlobal,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptMessage,javaScriptIdentifier,javaScriptExceptions,javaScriptReserved,javaScriptDeprecated,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation,javaScriptBrowserObjects,javaScriptDOMObjects,javaScriptAjaxObjects,javaScriptPropietaryObjects,javaScriptDOMMethods,javaScriptHtmlElemProperties,javaScriptDOMProperties,javaScriptEventListenerKeywords,javaScriptEventListenerMethods,javaScriptAjaxProperties,javaScriptAjaxMethods,javaScriptFuncArg

if main_syntax == "javascript"
	syntax sync clear
	syntax sync ccomment javaScriptComment minlines=200
	" syntax sync match javaScriptHighlight grouphere javaScriptBlock /{/
endif
"}}}
" Function and arguments highlighting {{{
syntax keyword javaScriptFuncKeyword     function contained
syntax region  javaScriptFuncExp         start=/\w\+\s\==\s\=function\>/ end="\([^)]*\)" contains=javaScriptFuncEq,javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match   javaScriptFuncArg         "\(([^()]*)\)" contains=javaScriptParens,javaScriptFuncComma,javaScriptComment contained
syntax match   javaScriptFuncComma       /,/ contained
syntax match   javaScriptFuncEq          /=/ contained
syntax region  javaScriptFuncDef         start="\<function\>" end="\([^)]*\)" contains=javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match   javaScriptObjectKey       /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\)\@=/ contains=javaScriptFunctionKey
syntax match   javaScriptFunctionKey     /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\s*function\s*\)\@=/ contained
"}}}
" Braces, Parens, symbols, colons {{{
syntax match javaScriptBraces       "[{}\[\]]"
syntax match javaScriptParens       "[()]"
syntax match javaScriptOpSymbols    "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syntax match javaScriptEndColons    "[;,]"
syntax match javaScriptLogicSymbols "\(&&\)\|\(||\)"
"}}}
" ES6 String Interpolation {{{
syntax match  javaScriptTemplateDelim    "\${\|}" contained
syntax region javaScriptTemplateVar      start=+${+ end=+}+                        contains=javaScriptTemplateDelim keepend
syntax region javaScriptTemplateString   start=+`+  skip=+\\\(`\|$\)+  end=+`+     contains=javaScriptTemplateVar,javaScriptSpecial keepend
"}}}
" JavaScriptFold Function {{{

function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
endfunction

" }}}
" Highlight links {{{
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
	if version < 508
		let did_javascript_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink javaScriptEndColons              Operator
	HiLink javaScriptOpSymbols              Operator
	HiLink javaScriptLogicSymbols           Boolean
	HiLink javaScriptBraces                 Function
	HiLink javaScriptParens                 Operator
	HiLink javaScriptTemplateDelim          Operator

	HiLink javaScriptComment                Comment
	HiLink javaScriptLineComment            Comment
	HiLink javaScriptDocComment             Comment
	HiLink javaScriptCommentTodo            Todo

	HiLink javaScriptDocTags                Special
	HiLink javaScriptDocSeeTag              Function
	HiLink javaScriptDocParam               Function

	HiLink javaScriptString                 String
	HiLink javaScriptRegexpString           String
	HiLink javaScriptTemplateString         String

	HiLink javaScriptNumber                 Number
	HiLink javaScriptFloat                  Number

	HiLink javaScriptGlobal                 Constant
	HiLink javaScriptCharacter              Character
	HiLink javaScriptPrototype              Type
	HiLink javaScriptConditional            Conditional
	HiLink javaScriptBranch                 Conditional
	HiLink javaScriptIdentifier             Identifier
	HiLink javaScriptRepeat                 Repeat
	HiLink javaScriptStatement              Statement
	HiLink javaScriptMessage                Keyword
	HiLink javaScriptReserved               Keyword
	HiLink javaScriptOperator               Operator
	HiLink javaScriptNull                   Type
	HiLink javaScriptBoolean                Boolean
	HiLink javaScriptLabel                  Label
	HiLink javaScriptSpecial                Special
	HiLink javaScriptSource                 Special
	HiLink javaScriptGlobalObjects          Special
	HiLink javaScriptExceptions             Special

	HiLink javaScriptDeprecated             Exception
	HiLink javaScriptError                  Error
	HiLink javaScriptParensError            Error
	HiLink javaScriptParensErrA             Error
	HiLink javaScriptParensErrB             Error
	HiLink javaScriptParensErrC             Error
	HiLink javaScriptDomErrNo               Error

	HiLink javaScriptDomNodeConsts          Constant
	HiLink javaScriptDomElemAttrs           Label
	HiLink javaScriptDomElemFuncs           Type

	HiLink javaScriptWebAPI                 Type

	HiLink javaScriptHtmlElemAttrs          Label
	HiLink javaScriptHtmlElemFuncs          Type

	HiLink javaScriptCssStyles              Type

	HiLink javaScriptBrowserObjects         Constant

	HiLink javaScriptDOMObjects             Constant
	HiLink javaScriptDOMMethods             Type
	HiLink javaScriptDOMProperties          Label

	HiLink javaScriptAjaxObjects            Constant
	HiLink javaScriptAjaxMethods            Type
	HiLink javaScriptAjaxProperties         Label

	HiLink javaScriptFuncKeyword            Function
	HiLink javaScriptFuncDef                PreProc
	HiLink javaScriptFuncExp                Title
	HiLink javaScriptFuncArg               	Special
	HiLink javaScriptFuncComma              Operator
	HiLink javaScriptFuncEq                 Operator

	HiLink javaScriptHtmlEvents             Constant
	HiLink javaScriptHtmlElemProperties     Label

	HiLink javaScriptEventListenerKeywords  Type

	HiLink javaScriptPropietaryObjects      Constant

	delcommand HiLink
endif
" end Highlight links }}}

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear javaScriptExpression
syntax cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
	unlet main_syntax
endif
syntax region jsInJsdocExample matchgroup=Snip start="^\s*\* @example" end="\(^\s*\* [^[:space:]]\)\@=" containedin=@javaScriptComment contains=@javaScriptAll
hi link Snip SpecialComment

