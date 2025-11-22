<div id="mse2_mfilter">
    <form action="{$_modx->resource.id | url}" method="post" id="mse2_filters" class="search-categories">
        <div class="container">
            <h2 class="main-heading">All Articles just for you</h2>
            <div class="search-categories__inner">
                
                <button style="display:none" type="reset" class="btn btn-light">Сбросить</button>
            </div>
        </div>
    </form>
    <div class="articles white-bg">
        <div class="container"> 
            <div id="mse2_results" class="articles__layout">
                {$results}
            </div>
            <div class="mse2_pagination">
                {'page.nav' | placeholder}
            </div>
        </div>
    </div>
</div>