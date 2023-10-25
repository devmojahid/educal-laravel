<section class="page__title-area page__title-height page__title-overlay d-flex align-items-center" data-background="{{ asset("frontend") }}/assets/img/page-title/page-title-2.jpg">
    <div class="container">
       <div class="row">
          <div class="col-xxl-12">
             <div class="page__title-wrapper">
                <h3 class="page__title">
                  {{ ucwords(str_replace('-',' ',Request::segment(1))) }}   
               </h3>                         
                <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="{{ url("/") }}" class="inactive">Home</a></li>
                       <?php $link = "" ?>
                        @for($i = 1; $i <= count(Request::segments()); $i++)
                           @if($i < count(Request::segments()) & $i > 0)
                              <?php $link .= "/" . Request::segment($i); ?>
                              @if ($i == 1)
                                 <li class="breadcrumb-item active" aria-current="page"><a href="<?= $link ?>" class="inactive"> {{ ucwords(str_replace('-',' ',Request::segment($i)))}}</a></li>
                              @else
                                 <li class="breadcrumb-item active" aria-current="page"><a href="<?= $link ?>" class="inactive">{{ ucwords(str_replace('-',' ',Request::segment($i)))}}</a></li>
                              @endif
                           @else
                              <li class="breadcrumb-item active" aria-current="page"><a> {{ucwords(str_replace('-',' ',Request::segment($i)))}}</a></li>
                           @endif
                        @endfor
                   </ol>
                </nav>
             </div>
          </div>
       </div>
    </div>
 </section>
