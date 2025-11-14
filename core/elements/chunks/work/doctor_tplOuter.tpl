<div id="mse2_mfilter">
    <form action="{$_modx->resource.id | url}" method="post" id="mse2_filters" class="search-categories">
        <div class="container">
            <div class="search-categories__inner start">
                {$filters}
                <button style="display:none" type="reset" class="btn btn-light">Сбросить</button>
            </div>
        </div>
    </form>
    <div class="specialists-layout">
        <div class="container"> 
            <div id="mse2_results" class="specialists-layout__inner">
                {$results}
            </div>
            <div class="mse2_pagination">
                {'page.nav' | placeholder}
            </div>
        </div>
    </div>
</div>