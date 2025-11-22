<div id="mse2_mfilter">
    <form action="{$_modx->resource.id | url}" method="post" id="mse2_filters">
        {$filters}
        <button style="display:none" type="reset" class="btn btn-light">Сбросить</button>
    </form>
    <div class="compare">
        <div class="container"> 
            <div id="mse2_results" class="compare__inner">
                {$results}
            </div>
            <div class="mse2_pagination">
                {'page.nav' | placeholder}
            </div>
        </div>
    </div>
</div>