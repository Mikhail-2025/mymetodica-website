<form class="form" action="{'id' | resource | url : ['scheme' => 'full']}" method="post" id="modal_form_discount">
    <input type="hidden" class="jsInputDiscount" name="get_discount" value="">
    <input type="hidden" name="af_action" value="modal_form_discount">

    <!-- PANEL 1: Data Collection -->
    <div id="panel_1" class="form-panel">
        <div class="form__item">
            <p>Name*</p>
            <input class="form__input" type="text" id="af_name" name="name" value="" autocomplete="name" />
        </div>
        <div class="form__item">
            <p>Phone number*</p>
            <input class="form__input jsTel" type="tel" id="af_phone" name="phone" value="" autocomplete="off" placeholder="+1 (___) ___-____" />
        </div>
        <div class="form__item">
            <p>Email*</p>
            <input class="form__input" type="email" id="af_email" name="email" value="" autocomplete="email" />
        </div>
        <div class="form__item">
            <label style="display:flex; align-items:center; font-size:14px;">
                <input type="checkbox" name="politikmodal" value="1" style="margin-right:10px;" />
                <span>I agree to the <a href="/privacy-policy" target="_blank" style="color:#ea6852;">Privacy Policy</a>*</span>
            </label>
        </div>
        <button type="submit" class="btn" id="get_code_btn">Get Code</button>
    </div>

    <!-- PANEL 2: Code Verification -->
    <div id="panel_2" class="form-panel" style="display:none;">
        <div class="form__item">
            <p>Enter verification code*</p>
            <input class="form__input" id="smsCode" type="text" name="sms_code" value="" autocomplete="off" placeholder="Enter SMS code here" />
            <span class="error_sms_code"></span>
        </div>

        <div class="form__item" style="text-align:center; margin-top:10px;">
            <span id="resend_timer" style="min-width:150px; display:none; font-size:16px; color:#7a7599;">Resend in <span id="timer_countdown">60</span> sec...</span>
            <a href="#" class="jsSmsRepeat" id="resend_link" style="display:none; font-size:16px; color:#ea6852; text-decoration:underline; cursor:pointer;">Resend code</a>
        </div>

        <button type="submit" class="btn" id="verify_btn">Next</button>
    </div>

    <span class="error_sms_code" style="visibility:hidden; height:0; overflow:hidden;"></span>

    [[+fi.success:is=`1`:then=`
    <div class="alert alert-success">[[+fi.successMessage]]</div>
    `]]
    [[+fi.validation_error:is=`1`:then=`
    <div class="alert alert-danger">[[+fi.validation_error_message]]</div>
    `]]
</form>
