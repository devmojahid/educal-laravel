<div class="course__sidebar pl-70">
    <div class="course__sidebar-search mb-50">
        <form action="{{ route('course.search') }}" method="GET">
            <input type="text" name="search" placeholder="{{ __('frontend.search_for_course') }}">
            <button type="submit">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                    viewBox="0 0 584.4 584.4" style="enable-background:new 0 0 584.4 584.4;"
                    xml:space="preserve">
                    <g>
                        <g>
                            <path class="st0"
                                d="M565.7,474.9l-61.1-61.1c-3.8-3.8-8.8-5.9-13.9-5.9c-6.3,0-12.1,3-15.9,8.3c-16.3,22.4-36,42.1-58.4,58.4    c-4.8,3.5-7.8,8.8-8.3,14.5c-0.4,5.6,1.7,11.3,5.8,15.4l61.1,61.1c12.1,12.1,28.2,18.8,45.4,18.8c17.1,0,33.3-6.7,45.4-18.8    C590.7,540.6,590.7,499.9,565.7,474.9z" />
                            <path class="st1"
                                d="M254.6,509.1c140.4,0,254.5-114.2,254.5-254.5C509.1,114.2,394.9,0,254.6,0C114.2,0,0,114.2,0,254.5    C0,394.9,114.2,509.1,254.6,509.1z M254.6,76.4c98.2,0,178.1,79.9,178.1,178.1s-79.9,178.1-178.1,178.1S76.4,352.8,76.4,254.5    S156.3,76.4,254.6,76.4z" />
                        </g>
                    </g>
                </svg>
            </button>
        </form>

    </div>
    <div class="course__sidebar-widget grey-bg">
        <div class="course__sidebar-info">
            <h3 class="course__sidebar-title">Categories</h3>
            <ul>
                @forelse ($courseCategories as $courseCategory)
                    <li>
                        <div class="course__sidebar-check mb-10 d-flex align-items-center">
                            <input class="m-check-input just_one_cat" name="category" type="checkbox"
                                id="m-all-course-{{ $courseCategory->id }}"
                                value="{{ $courseCategory->id }}">
                            <label class="m-check-label"
                                for="m-all-course-{{ $courseCategory->id }}">{{ $courseCategory->title }}
                                ({{ $courseCategory->course->count() ?? ' ' }})
                            </label>
                        </div>
                    </li>

                @empty

                    <li>
                        <div class="course__sidebar-check mb-10 d-fle x align-items-center">
                            <input class="m-check-input" name="category" type="checkbox"
                                id="m-eng">
                            <label class="m-check-label" for="m-eng">English (6)</label>
                        </div>
                    </li>
                @endforelse

            </ul>
        </div>
    </div>
    @php
        $languages = App\Models\CourseLanguage::all();
    @endphp
    @if (count($languages) > 0)
        <div class="course__sidebar-widget grey-bg">
            <div class="course__sidebar-info">
                <h3 class="course__sidebar-title">Language</h3>
                <ul>
                    @foreach ($languages as $language)
                    <li>
                        <div class="course__sidebar-check mb-10 d-flex align-items-center">
                            <input class="m-check-input just_one_lang" name="language" type="checkbox"
                                id="m-all" value="{{ $language->id }}">
                            <label class="m-check-label" for="m-all">{{ $language->title }}</label>
                        </div>
                    </li>
                    @endforeach
                </ul>
            </div>
        </div>
    @endif
    <div class="course__sidebar-widget grey-bg">
        <div class="course__sidebar-info">
            <h3 class="course__sidebar-title">Price Filter</h3>
            <ul>
                <li>
                    <div class="course__sidebar-check mb-10 d-flex align-items-center">
                        <input class="m-check-input just_one_price" name="price" type="checkbox"
                            value="all" id="m-all-course">
                        <label class="m-check-label" for="m-all-course">All</label>
                    </div>
                </li>
                <li>
                    <div class="course__sidebar-check mb-10 d-flex align-items-center">
                        <input class="m-check-input" name="price" type="checkbox" value="free"
                            id="m-free">
                        <label class="m-check-label" for="m-free">Free Courses</label>
                    </div>
                </li>
                <li>
                    <div class="course__sidebar-check mb-10 d-flex align-items-center">
                        <input class="m-check-input" name="price" type="checkbox" value="paid"
                            id="m-premium">
                        <label class="m-check-label" for="m-premium">Premium Courses</label>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="course__sidebar-widget grey-bg">
        <div class="course__sidebar-info">
            <h3 class="course__sidebar-title">Skill level</h3>
            <ul>
                <li>
                    <div class="course__sidebar-check mb-10 d-flex align-items-center">
                        <input class="m-check-input" name="level" type="checkbox" value="beginner"
                            id="m-beginner">
                        <label class="m-check-label" for="m-beginner">Beginner</label>
                    </div>
                </li>
                <li>
                    <div class="course__sidebar-check mb-10 d-flex align-items-center">
                        <input class="m-check-input" name="level" type="checkbox"
                            value="intermediate" id="m-intermediate">
                        <label class="m-check-label" for="m-intermediate">Intermediate</label>
                    </div>
                </li>
                <li>
                    <div class="course__sidebar-check mb-10 d-flex align-items-center">
                        <input class="m-check-input" name="level" type="checkbox" value="advanced"
                            id="m-expert">
                        <label class="m-check-label" for="m-expert">Advanced</label>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="course__sidebar-widget grey-bg">
        @include('frontend.pages.course.recent-course', [
            'recentCourses' => $recentCourses,
        ])
    </div>
</div>