@extends("frontend.layouts.master")
@section("title","Order Page")
@section("content")
    @include("frontend.layouts.breadcrumb",["title"=>"Order"])
<section class="error__area pt-200 pb-200">
    <div class="container">
        <div class="row">
            <div class="col-xl-4">
                @include("frontend.student.dashboard-menu")
            </div>
            <div class="col-xl-8">
                <div class="tp-dashboard-body Dashboard">
                    <div class="tp-dashborad-title-wrapper d-flex justify-content-between align-items-center">
                        <h3 class="dashboard-title mb-10 ">{{ __("frontend.order_history") }}</h3>
                    </div>
                    <div class="tp-dashboard-my-course">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">{{ __("frontend.course_name") }} </th>
                                <th scope="col">{{ __("dashboard.image") }}</th>
                                <th scope="col">{{ __("dashboard.status") }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse ($order as $orderItem)
                                @foreach ($orderItem->orderItems as $item)
                                <tr>
                                    <td>{{ $item->course->title }}</td>
                                    <td>
                                        <img src="{{ asset($item->course->image) }}" alt="{{ $item->course->title }}" width="50">
                                    </td>
                                    <td>
                                        @if ($orderItem->status == "pending")
                                            <span class="badge bg-warning text-dark">{{ __("dashboard.pending") }}</span>
                                        @elseif($orderItem->status == "approved")
                                            <span class="badge bg-success">{{ __("dashboard.approve") }}</span>
                                        @else
                                            <span class="badge bg-danger">{{ __("dashboard.reject") }}</span>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            @empty
                                <tr>
                                    <td colspan="3"> {{ __("frontend.no_course_found") }}</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection