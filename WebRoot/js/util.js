function getQueryString(name) {
	// 通过参数name获取URL的参数值
	// 例如：URL:http://127.0.0.1:8080/shop/pid=5
	// 通过调用该方法getQueryString(pid)得到5
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}


function loadData(jsonStr) {
	// 根据名字将JSON数据对应的值依次填入页面的表单域
	var obj = jsonStr;
	var key, value, tagName, type, arr;
	for (x in obj) {
		key = x;
		value = obj[x];
		$("[name='" + key + "'],[name='" + key + "[]']").each(function() {
			tagName = $(this)[0].tagName;
			type = $(this).attr('type');
			if (tagName == 'INPUT') {
				if (type == 'radio') {
					$(this).attr('checked', $(this).val() == value);
				} else if (type == 'checkbox') {
					arr = value.split(',');
					for (var i = 0; i < arr.length; i++) {
						if ($(this).val() == arr[i]) {
							$(this).attr('checked', true);
							break;
						}
					}
				} else {
					$(this).val(value);
				}
			} else if (tagName == 'SELECT' || tagName == 'TEXTAREA') {
				$(this).val(value);
			}
		});
	}
}


function getCategory(url) {
	$.ajax({
		url : url,
		type : "post",
		dataType : "json",// 回调
		success : function(data) {
			$.each(data, function(i, n) {
				var option = $("<option></option>");
				option.val(n.cid);
				option.html(n.cname);
				$("select").append(option);
			});
		}
	});
}


function changeImg() {
	// 根据File表单域选择的图片，将图片显示在File表单域的下方
	$("#imageFile").change(function() {
		var files = $("#imageFile").get(0).files;// 获取选择文件的图片文件内容
		var imgs = $("#imgs");
		imgs.empty();// 先将原先选择的图片内容清空
		for (var i = 0; i < files.length; i++) {
			if (files[i]) {
				// 读取文件内容
				var reader = new FileReader();
				reader.readAsDataURL(files[i]);
				// 读取完毕之后，增加表单img标签，并设置src属性
				reader.onload = function(e) {
					var img = $("<img src='" + e.target.result + "'><img>");
					imgs.append(img);
				};
			}
		}

	});
}


function doDeleteSuccess(pid) {
	var a = document.getElementById(pid);
	var parent = a.parentNode;
	parent.removeChild(a);
}


// 日期类Date格式化
Date.prototype.format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}
