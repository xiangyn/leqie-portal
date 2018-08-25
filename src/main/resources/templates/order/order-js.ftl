<script type="text/javascript">
$(function() {
	
	$(".table.order .b-pay").on("click", function() {
		var no = $(this).closest(".table.order").data("no");
		window.open("${ctx}/app/order/pay.jhtml?no="+no);
	});
	
	$(".table.order .b-cancel").on("click", function() {
		var no = $(this).closest(".table.order").data("no");
		confirm("你确认取消该订单吗？") && cancelOrder(no);
	});
	
	$(".table.order .b-ok").on("click", function() {
		var no = $(this).closest(".table.order").data("no");
		confirm("你确认已收货？") && finishedOrder(no);
	});
	
	function cancelOrder(no) {
		$.fastAjax({
			url: "${ctx}/app/order/cancel.jo",
			data: { no: no },
			success: function(ret) {
				if(ret.success) {
					$.info.success("取消订单成功！", function() {
						window.location.reload();
					});
				}else {
					$.info.error("取消订单失败，请稍后再试！");
				}
			}
		});
	}
	
	function finishedOrder(no) {
		$.fastAjax({
			url: "${ctx}/app/order/finished.jo",
			data: { no: no },
			success: function(ret) {
				if(ret.success) {
					$.info.success("已完成订单交易！", function() {
						window.location.reload();
					});
				}else {
					$.info.error("确认收货失败，请稍后再试！");
				}
			}
		});
	}
	
});
</script>