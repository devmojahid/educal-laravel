<section class="course__area pt-115 pb-120 grey-bg">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-xxl-5 col-xl-6 col-lg-6">
                <div class="section__title-wrapper mb-60">
                    <h2 class="section__title">{!! getSystemSetting('home_find_course', 'title') !!}</h2>
                    <p>You don't have to struggle alone, you've got our assistance and help.</p>
                </div>
            </div>
            <div class="col-xxl-7 col-xl-6 col-lg-6">
                <div class="course__menu d-flex justify-content-lg-end mb-60">
                    <div class="masonary-menu filter-button-group">
                        <button class="active" data-filter="*">
                            See All
                            <span class="tag">new</span>
                        </button>
                        @foreach (getSystemSetting('home_find_course', 'categories') as $category)
                            @php
                                $category = App\Models\CourseCategory::find($category);
                            @endphp
                            @if ($category)
                                <button data-filter=".{{ $category->id }}">{{ $category->title }}</button>
                            @endif
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
        <div class="row grid">
            @foreach (getSystemSetting('home_find_course', 'categories') as $category)
                @php
                    $category = App\Models\CourseCategory::with('course')->find($category);
                @endphp
                @if ($category)
                    @foreach ($category->course->where('status', 'approved') as $course)
                        <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 grid-item {{ $category->id }}">
                            <div class="course__item white-bg mb-30 fix">
                                <div class="course__thumb w-img p-relative fix">
                                    <a href="{{ route('course.details', $course->slug) }}">
                                        <img src="{{ asset($course->image) }}" alt="{{ $course->title }}">
                                    </a>
                                    <div class="course__tag">
                                        <a href="{{ route("course.category",$category->slug) }}">{{ $category->title }}</a>
                                    </div>
                                </div>
                                <div class="course__content">
                                    <div class="course__meta d-flex align-items-center justify-content-between">
                                        <div class="course__lesson">
                                            <span><i class="far fa-book-alt"></i>{{ $course->lessons->count() }}
                                                Lesson</span>
                                        </div>
                                        <div class="course__rating">
                                                <span><i class="icon_star"></i>{{ $course->reviewsAvg() }} ({{ $course->reviewsCount() }})</span>
                                        </div>
                                    </div>
                                    <h3 class="course__title"><a
                                            href="{{ route('course.details', $course->slug) }}">{{ $course->title }}</a>
                                    </h3>
                                    <div class="course__teacher d-flex align-items-center">
                                        <div class="course__teacher-thumb mr-15">
                                            {{-- <img src="{{ asset($course->instructor->image) }}" --}}
                                            {{-- alt="{{ $course->instructor->name }}"> --}}
                                        </div>
                                        {{-- <h6><a href="{{ route('instructor.details', $course->instructor->slug) }}">{{ $course->instructor->name }}</a> </h6> --}}
                                    </div>
                                </div>
                                <div class="course__more d-flex justify-content-between align-items-center">
                                    <div class="course__status">
                                        <span>
                                            @if($course->discount_price != null)
                                                <span class="price">{{currency_symbol($course->discount_price) }}</span>
                                                @else
                                                <span class="price">{{ currency_symbol($course->price) }}</span>
                                            @endif
                                        </span>
                                    </div>
                                    {{-- currency_symbol --}}
                                    <div class="course__btn">
                                        <a href="{{ route('course.details', $course->slug) }}"
                                            class="link-btn
                                            {{ $course->price == 0 ? 'free' : '' }}">
                                            Know Details
                                            <i class="far fa-arrow-right"></i>
                                            <i class="far fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            @endforeach
        </div>
    </div>
</section>
