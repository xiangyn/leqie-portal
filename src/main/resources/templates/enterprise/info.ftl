<form class="form-content" id="_form">
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公司名称</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.gongsimingchen!''} <small class="right" style="color:red">&nbsp;(${data.shenhezhuangtai})</small></span>
				
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">经营模式</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.jingyingmoshi!''}</span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公司负责人</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.gongsifuzeren!''}</span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公开联系人</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.lianxiren!''}</span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公开联系人号码</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.lianxirendianhua!''}</span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">详细地址</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.xiangxidizhi!''}</span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公司介绍</label>
		</div>
		<div class="col half">
			<div class="form-item">
				<span class="item-value">${data.gongsijieshao!''}</span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公司负责人身份证</label>
		</div>
		<div class="col half">
			<div class="form-item dropzone">
				<span class="item-value"><img src="${ctx}/u.jhtml?u=${data.fuzerenshenfenzheng}" /></span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
	<div class="row">
		<div class="col quarter text-right">
			<label class="form-label">公司营业执照</label>
		</div>
		<div class="col half">
			<div class="form-item dropzone">
				<span class="item-value"><img src="${ctx}/u.jhtml?u=${data.yingyezhizhao}" /></span>
			</div>
			<span class="form-item-msg"></span>
		</div>
	</div>
</form>