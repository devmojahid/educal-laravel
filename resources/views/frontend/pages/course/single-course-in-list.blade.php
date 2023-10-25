@if ($courses->count() >= 0)
    <div class="row">
        @forelse ($courses as $course)
            <div class="col-xxl-12">
                <div class="course__item white-bg mb-30 fix">
                    <div class="row gx-0">
                        <div class="col-xxl-4 col-xl-4 col-lg-4">
                            <div class="course__thumb course__thumb-list w-img p-relative fix">
                                <a href="course-details.html">
                                    <img src="{{ asset('frontend') }}/assets/img/course/list/course-1.jpg" alt="">
                                </a>
                                <div class="course__tag">
                                    <a href="#">Art & Design</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-8 col-xl-8 col-lg-8">
                            <div class="course__right">
                                <div class="course__content course__content-4">
                                    <div class="course__meta d-flex align-items-center">
                                        <div class="course__lesson mr-20">
                                            <span><i class="far fa-book-alt"></i>43 Lesson</span>
                                        </div>
                                        <div class="course__rating">
                                            <span><i class="icon_star"></i>4.5 (44)</span>
                                        </div>
                                    </div>
                                    <h3 class="course__title">
                                        <a href="course-details.html">Become a product Manager
                                            learn
                                            the skills & job.</a>
                                    </h3>
                                    <div class="course__teacher d-flex align-items-center">
                                        <div class="course__teacher-thumb mr-15">
                                            <img src="{{ asset('frontend') }}/assets/img/course/teacher/teacher-1.jpg"
                                                alt="">
                                        </div>
                                        <h6><a href="instructor-details.html">Jim Séchen</a></h6>
                                    </div>
                                </div>
                                <div
                                    class="course__more course__more-2 course__more-3 d-flex justify-content-between align-items-center">
                                    <div class="course__status">
                                        <span>Free</span>
                                    </div>
                                    <div class="course__btn">
                                        <a href="course-details.html" class="link-btn">
                                            Know Details
                                            <i class="far fa-arrow-right"></i>
                                            <i class="far fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @empty
            <h1>No Course Found</h1>
        @endforelse
    </div>
@else
    <h1>No Course Found</h1>
@endif
