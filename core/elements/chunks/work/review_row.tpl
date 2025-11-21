<div class="reviews__item">
    <div class="reviews__item-head">
        <div class="reviews__item-author">
            <p>{$pagetitle}</p>
            {set $val_rating = 0}
            {if $review_rating == 5}
                {set $val_rating = 100}
            {elseif $review_rating == 4.5}
                {set $val_rating = 92}
            {elseif $review_rating == 4}
                {set $val_rating = 80}
            {elseif $review_rating == 3.5}
                {set $val_rating = 71}
            {elseif $review_rating == 3}
                {set $val_rating = 60}     
            {/if}
            <div class="reviews__item-rating">
                <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
                </svg>
                <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
                </svg>
                <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
                </svg>
                <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
                </svg>
                <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
                </svg>
                <div class="reviews__total-mask" style="width: {$val_rating}%">
                    <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
                    </svg>
                    <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
                    </svg>
                    <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
                    </svg>
                    <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
                    </svg>
                    <svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
                    </svg>
                </div>
            </div>
        </div>
        <div class="reviews__item-date">{$review_date}</div>
    </div>
    <div class="reviews__item-descr">
        {$content}
    </div>
    {if $review_link}
    <div class="end-box">
        <a target="_blank" class="btn dark" href="{$review_link}">View review </a>
    </div>
    {/if}
</div>