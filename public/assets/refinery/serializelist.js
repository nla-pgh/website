/**
 * jQuery Serialize List
 * Copyright (c) 2009 Mike Botsko, Botsko.net LLC
 * Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * Copyright notice and license must remain intact for legal use
 * Version .2
 *
 * Serialize an unordered or ordered list item. Optional ability
 * to determine which attributes are included. The serialization
 * will be read by PHP as a multidimensional array which you may
 * use for saving state.
 *
 * http://github.com/botskonet/jquery.serialize-list
 */
!function(e){e.fn.serializelist=function(t){var i,n,r,a,l={attributes:["id"],allow_nest:!0,prepend:"ul",att_regex:!1,is_child:!1},s=e.extend(l,t),c=s.attributes,d="",p=function(e,t){if(!s.att_regex)return t;for(n in s.att_regex)if(s.att_regex[n].att===e)return t.replace(s.att_regex[n].regex,"")};return s.is_child||(s.prepend="&"+s.prepend),this.each(function(t,n){e(n).children().each(function(n,l){if(s.allow_nest||c.length>1)for(r in c)i=p(c[r],e(l).attr(c[r])),d+=s.prepend+"["+t+"]["+n+"]["+c[r]+"]="+i;else i=p(c[0],e(l).attr(c[0])),d+=s.prepend+"["+t+"]["+n+"]="+i;s.allow_nest&&(a=s.prepend+"["+t+"]["+n+"][children]",e(l).children().each(function(){("UL"==this.tagName||"OL"==this.tagName)&&(d+=e(this).serializelist({prepend:a,is_child:!0}))})),n++})}),d}}(jQuery);