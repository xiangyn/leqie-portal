<div class="address wallet-money">
	<div class="form-content">
		<form id="_form">
			<div class="form-content">
				<div class="row">
					<div class="col quarter text-right">
						<label class="form-label required">提现金额</label>
					</div>
					<div class="col half">
						<div class="form-item">
							<input name="money" class="number" type="text" placeholder="请输入提现金额" required="required" />
						</div>
						<span class="form-item-msg"></span>
					</div>
				</div>
				<div class="row">
					<div class="col quarter text-right">
						<label class="form-label required">开户行名称</label>
					</div>
					<div class="col half">
						<div class="form-item">
							<input name="name" type="text" placeholder="请输入开户行名称" required="required" />
						</div>
						<span class="form-item-msg"></span>
					</div>
				</div>
				<div class="row">
					<div class="col quarter text-right">
						<label class="form-label required">开户行账号</label>
					</div>
					<div class="col half">
						<div class="form-item">
							<input name="account" type="text" placeholder="请输入开户行账号" required="required" />
						</div>
						<span class="form-item-msg"></span>
					</div>
				</div>
				<div class="row">
					<div class="col quarter text-right">
						<label class="form-label required">开户行账号</label>
					</div>
					<div class="col half">
						<div class="form-item">
							<input name="person" type="text" placeholder="请输入开户人" required="required" />
						</div>
						<span class="form-item-msg"></span>
					</div>
				</div>
				<div class="row">
					<div class="col quarter text-right">
						<label class="form-label required">开户行地址</label>
					</div>
					<div class="col half">
						<div class="form-item">
							<input name="address" type="text" placeholder="请输入开户行地址" required="required" />
						</div>
						<span class="form-item-msg"></span>
					</div>
				</div>
				<div class="row">
					<div class="col quarter text-right">
						&nbsp;
					</div>
					<div class="col half">
						<div class="form-item text-center">
							<button type="button" id="save-btn"> 提 交 </button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${ctx}/static/js/iziToast.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils.js"></script>
<script type="text/javascript">
$(function() {
	
	$("#save-btn").on("click", function() {
		$("#_form").trigger("submit");
	});
	$("#_form").on("submit", function() {
		if(validate()) {
			$.fastAjax({
				url: "${ctx}/app/wallet/withdraw",
				data: $("#_form").serializeObject(),
				success: function(ret) {
					if(ret.status == '1') {
						$.info.success('已提交申请，请等待2～3个工作日!', function() {
							window.location.href = "${ctx}/app/wallet";
						});
					}else {
						$.info.error(ret.msg);
					}
				}
			});
		}
		return false;
	});
	
	function validate() {
		var ret = true;
		$("#_form input").each(function() {
			if(this.type !== 'hidden') {
				var text = $(this).val();
				if(!text) {
					var $row = $(this).closest(".row");
					$row.find(".form-item-msg").text($row.find(".form-label").text() + "不能为空");
					ret = false;
				}
			}
		});
		return ret;
	}
	
});
</script>