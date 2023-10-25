@extends('backend.layouts.master')
@section('title', __("dashboard.all_review"))
@include('backend.layouts.partial.data-table-style')

@section('content')
    <section class="content-header info-box p-3 rounded">
        <div class="container-fluid">
            <div class="row mb-2 mt-2">
                <div class="col-sm-6">
                    <h3 class="card-title">{{ __('dashboard.all_review') }}</h3>
                </div>
                
            </div>
        </div>
    </section>

    {{--  Main content  --}}

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="datatable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>SL.</th>
                                        <th>title</th>
                                        <th>body</th>
                                        <th>rating</th>
                                        <th>status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($reviews as $key => $review)
                                        <tr>
                                            <td>{{ $key += 1 }}</td>
                                            <td>{{ $review->title }}</td>
                                            <td>{{ $review->body }}</td>
                                            <td>{{ $review->rating }}</td>
                                            <td>{{ $review->status }}</td>
                                            <td class="d-flex items-center">
                                                <a href="{{ route('admin.course.review.approve', $review->id) }}" class="btn btn-success mr-2">
                                                    approve
                                                </a>
                                                <a href="{{ route('admin.course.review.reject', $review->id) }}" class="btn btn-danger mr-2">
                                                    Reject
                                                </a>
                                                <a href="javascript:void(0)" data-item_id="{{ $review->id }}" id="delete"
                                                    class="btn btn-danger delete_item">
                                                    <i class="fas fa-trash"></i>
                                                  </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@include('backend.layouts.partial.data-table-script')
@push('scripts')
    {!! deleteItemScript('admin.course.review.delete') !!}
@endpush

