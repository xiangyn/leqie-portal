Date.prototype.format = function(format) {
	 var o = {
	 "M+" : this.getMonth()+1, // month
	 "d+" : this.getDate(),    // day
	 "h+" : this.getHours(),   // hour
	 "m+" : this.getMinutes(), // minute
	 "s+" : this.getSeconds(), // second
	 "q+" : Math.floor((this.getMonth()+3)/3),  // quarter
	 "S" : this.getMilliseconds() // millisecond
	 }
	 if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	 (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	 for(var k in o)if(new RegExp("("+ k +")").test(format))
	 format = format.replace(RegExp.$1,
	 RegExp.$1.length==1 ? o[k] :
	 ("00"+ o[k]).substr((""+ o[k]).length));
	 return format;
}

$(function() {
	
	$.fn.serializeObject = function() {
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};
	
	$("input.number").on("keyup", function() {
		this.value=this.value.replace(/[^\d]/g,'');
	});
	
	$(".panel-menu .item").on("click", function() {
		if($(this).hasClass("active")) {
			return;
		}
		$(this).closest(".panel-menu").find(".item").each(function() {
			$("#" + $(this).removeClass("active").data("panel")).css("display", "none");
		});
		$("#" + $(this).addClass("active").data("panel")).css("display", "block");
		
	});
});

$.fastAjax = function(option) {
	return $.ajax($.extend(true, {
		type: 'post',
		dataType: 'json',
		error: function() {
			if(iziToast) {
				$.info.error('服务器繁忙，请稍后再试!');
			}
		}
	}, option));
}
$.fastUpload = function(option) {
	$.ajaxFileUpload($.extend(true, {
		dataType: 'json',
		error: function() {
			if(iziToast) {
				$.info.error('服务器繁忙，请稍后再试!');
			}
		}
	}, option));
}

$.info = {
	error: function(msg, callback) {
		if(iziToast) {
			iziToast.error({
		        message: msg,
		        position: 'topCenter',
		        transitionIn: 'bounceInLeft',
		        onClose: callback
		    });
		}
	},
	success: function(msg, callback) {
		if(iziToast) {
			iziToast.success({
		        message: msg,
		        position: 'topCenter',
		        transitionIn: 'bounceInLeft',
		        onClose: callback
		    });
		}
	},
}