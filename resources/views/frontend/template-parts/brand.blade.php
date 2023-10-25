@php
   $brandEncoded = App\Models\SystemSetting::where('key', "brand")->get();
   $brands = json_decode($brandEncoded[0]->value, true);
@endphp
@if (isset($brands))
<section class="brand__area pb-110">
    <div class="container">
       <div class="row">
          <div class="col-xxl-12">
             <div class="brand__content text-center">
                <h3 class="brand__title">Trusted by 100 world's best companies</h3>
             </div>
          </div>
       </div>
       <div class="row">
          <div class="col-xxl-12">
             <div class="brand__slider swiper-container">
                <div class="swiper-wrapper">
                     @foreach ($brands as $brand)
                        <div class="swiper-slide">
                           <div class="brand__item text-center text-lg-start">
                              <a href="{{ $brand['url'] }}"><img src="{{ asset($brand['logo']) }}" alt="brand"></a>
                           </div>
                        </div>
                     @endforeach
                  </div>
               </div>
          </div>
       </div>
       <div class="row">
        
      </div>
    </div>
 </section>
 @endif