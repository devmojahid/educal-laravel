<?php

use Carbon\Carbon;

if (!function_exists('custom_function')) {
    function custom_function()
    {
        return 'Hello, this is a custom function!';
    }
}

if (!function_exists('getSidebarInfo')) {
    function getSidebarInfo($key)
    {
        return App\Models\SidebarInfo::value($key);
    }
}

if (!function_exists('monthDayYear')) {
    function monthDayYear($key, $format = 'M d, Y')
    {
        return Carbon::parse($key)->format($format);
    }
}

/**
 * Get Time Format from Carbon
 * @param $key
 * @param string $format
 */
if (!function_exists('timeFormat')) {
    function timeFormat($key, $format = 'h:i a')
    {
        return Carbon::parse($key)->format($format);
    }
}

if (!function_exists('numberFormat')) {
    function numberFormat($number)
    {
        return number_format((float)$number, 2, '.', '');
    }
}

/**
 * Get the course price with discount and free or not
 * @param $course
 * @return string
 */

if (!function_exists('getCoursePrice')) {
    function getCoursePrice($course)
    {
        $price = $course->price;
        $discount = $course->discount_price;
        $priceFreeTitle = __('dashboard.free');
        if($discount != null){
            $discountPrice = $course->discount_price;
            return currency_symbol($discountPrice);
        }elseif($price != null){
            return currency_symbol($price);
        }else{
            return $priceFreeTitle;
        }
    }
}

/**
 * Generate a script for deleting a Item using SweetAlert and AJAX.
 *
 * @param string $routeName The name of the route for deleting a course Item.
 * @return string
 */
function deleteItemScript($routeName)
{
    $routeUrl = route($routeName);
    return <<<SCRIPT
    <script>
    $(document).ready(function() {
    $(document).on('click', '.delete_item', function(e) {
        e.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: "Once Delete, This will be Permanently Delete!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                let itemId = $(this).data('item_id');
                $.ajax({
                    url: "$routeUrl",
                    method: 'post',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        id: itemId
                    },
                    success: function(res) {
                        if (res.status == 'success') {
                            $('.table').load(location.href + ' .table');
                            Swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                        }
                    }
                });
            }
        })
    })
    });
    </script>
SCRIPT;
}
/**
 * Generate a script for deleting a Item using SweetAlert and AJAX.
 * @param string $routeName The name of the route for deleting a course Item.
 * @return string
 */
if (!function_exists('getSystemSetting')) {
    function getSystemSetting($key, $element = null)
    {
        $systemSetting = App\Models\SystemSetting::where('key', $key)->get();
        if ($systemSetting) {
            foreach ($systemSetting as $key => $setting) {
                $settingValue = json_decode($setting['value'], true);
                return $settingValue[$element];
            }
        } else {
            return null;
        }
    }
}

// options api 
if (!function_exists('getOptions')) {
    function getOptions($key, $element = null)
    {
        $systemSetting = App\Models\SystemSetting::where('key', $key)->first();
        if ($systemSetting) {
            $settingValue = json_decode($systemSetting['value'], true);
            return $settingValue[$element];
        } else {
            return null;
        }
    }
}


if (!function_exists('currency_load')) {
    function currency_load()
    {
        if(session()->has('currency_info')){
            $currency = session()->get('currency_info');
            return $currency;
        }else{
            $currency = App\Models\Currency::where('is_default', 'yes')->first();
            if ($currency) {
                return $currency->code;
            } else {
                return 'USD';
            }
        }
    }
}

// set currency symbol and price change with exchange rates 
if (!function_exists('currency_symbol')) {
    function currency_symbol($price)
    {
        $currency = currency_load()['code'];
        $currency_symbol = App\Models\Currency::where('code', $currency)->first();
        if ($currency_symbol) {
            $symbol = $currency_symbol->symbol;
            $exchange_rate = $currency_symbol->exchange_rate;
            $price = $price * $exchange_rate;
            return $symbol . number_format((float)$price, 2, '.', '');
        } else {
            return '$' . number_format((float)$price, 2, '.', '');
        }
    }
}

// just currancy symbol
if (!function_exists('currency_symbol_only')) {
    function currency_symbol_only()
    {
        $currency = currency_load()['code'];
        $currency_symbol = App\Models\Currency::where('code', $currency)->first();
        if ($currency_symbol) {
            $symbol = $currency_symbol->symbol;
            return $symbol;
        } else {
            return '$';
        }
    }
}

if(!function_exists('social_shear')){
    function social_shear($url, $title){
        $url = urlencode(url()->current());
        $html = '<ul>';
        $html .= '<li><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u='.$url.'&amp;src=sdkpreparse" class="fb"><i class="social_facebook"></i></a></li>';
        $html .= '<li><a href="https://twitter.com/intent/tweet?text='.$title.'&amp;url='.$url.'&amp;via=twitterdev&amp;hashtags=example%2Cdemo" target="_blank" class="tw"><i class="social_twitter"></i></a></li>';
        $html .= '</ul>';
        return $html;
    }
}


function extractVideoID($url)
{
    $pattern = '/(?:\?v=|\/embed\/|\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]+)/';

    if (preg_match($pattern, $url, $matches)) {
        return $matches[1]; 
    } else {
        return null; 
    }
}

// youtube video id 
if(!function_exists('getYoutubeVideoId')){
    function getYoutubeVideoId($url){
        $video_id = explode("?v=", $url);
        if (empty($video_id[1])) {
            $video_id = explode("/v/", $url);
        }
        $video_id = explode("&", $video_id[1]);
        $video_id = $video_id[0];
        return $video_id;
    }
}

// get youtube video thumbnail
if(!function_exists('getYoutubeVideoThumbnail')){
    function getYoutubeVideoThumbnail($url){
        $video_id = getYoutubeVideoId($url);
        $thumbnail = 'https://img.youtube.com/vi/'.$video_id.'/hqdefault.jpg';
        return $thumbnail;
    }
}

// get youtube video embed url
if(!function_exists('getYoutubeVideoEmbedUrl')){
    function getYoutubeVideoEmbedUrl($url){
        $video_id = getYoutubeVideoId($url);
        $embed_url = 'https://www.youtube.com/embed/'.$video_id;
        return $embed_url;
    }
}

// get vimeo video id

if(!function_exists('getVimeoVideoId')){
    function getVimeoVideoId($url){
        $video_id = explode("/", $url);
        $video_id = $video_id[3];
        return $video_id;
    }
}


// get vimeo video thumbnail

if(!function_exists('getVimeoVideoThumbnail')){
    function getVimeoVideoThumbnail($url){
        $video_id = getVimeoVideoId($url);
        $hash = unserialize(file_get_contents("http://vimeo.com/api/v2/video/$video_id.php"));
        $thumbnail = $hash[0]['thumbnail_large'];
        return $thumbnail;
    }
}

// get vimeo video embed url

if(!function_exists('getVimeoVideoEmbedUrl')){
    function getVimeoVideoEmbedUrl($url){
        $video_id = getVimeoVideoId($url);
        $embed_url = 'https://player.vimeo.com/video/'.$video_id;
        return $embed_url;
    }
}

//CustomHTMLParser 
if(!function_exists('CustomHTMLParser')){
    function CustomHTMLParser($html){
        $dom = new \DOMDocument();
        $dom->loadHTML($html,LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
        $html = $dom->saveHTML();
        return $html;
    }
}