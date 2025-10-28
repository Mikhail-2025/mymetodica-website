<div id="mse2_mfilter">
    <form action="{$_modx->resource.id | url}" method="post" id="mse2_filters" class="search-categories">
        <div class="container">
            {$filters}
            <button style="display:none" type="reset" class="btn btn-light">Сбросить</button>
        </div>
    </form>
    <div class="reviews no-offset white-bg">
        <div class="container">
            <div class="reviews__head start">
                {$_modx->runSnippet('!countRating')}
                <span>{$total ?: 0} reviews</span>
            </div>

            <div id="mse2_results" class="reviews__content">
                {$results}
            </div>
            <div class="mse2_pagination">
                {'page.nav' | placeholder}
            </div>
        </div>
    </div>
</div>