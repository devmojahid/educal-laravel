@extends('backend.layouts.master')
@section('title', 'Sub Category')
@include('backend.layouts.partial.data-table-style')

@push("styles")
   <style>
     .svg_image{
        width: 50px;
        height: 50px;
    }
   </style>
@endpush

@section('content')
<section class="content-header info-box p-3 rounded">
    <div class="container-fluid">
        <div class="row mb-2 mt-2">
            <div class="col-sm-6">
                <h3 class="card-title">{{ __("dashboard.subcetagory") }}</h3>
            </div>
            @can("course-sub-category-create")
                <div class="col-sm-6">
                    <div class="float-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createSubCategoryModal">
                            {{ __("dashboard.add_new") }} {{ __("dashboard.subcetagory") }}
                        </button>
                    </div>
                </div>
            @endcan
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
                                        <th>{{ __("dashboard.sn") }}</th>
                                        <th>{{ __("dashboard.name") }}</th>
                                        <th>{{ __("dashboard.icon") }}</th>
                                        <th>{{ __("dashboard.status") }}</th>
                                        <th>{{ __("dashboard.category_title") }}</th>
                                        <th>{{ __("dashboard.action") }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($subcategories as $key => $subcategory)
                                        <tr>
                                            <td>{{ $key += 1 }}</td>
                                            <td>{{ $subcategory->title }}</td>
                                            <td>
                                                {{-- svg image show  --}}
                                                <div class="svg_image">
                                                    {!! $subcategory->svg !!}
                                                </div>
                                            </td>
                                            <td>{{ $subcategory->status }}</td>
                                            <td>{{ $subcategory->course_category->title }}</td>
                                            <td>
                                                @can("course-sub-category-edit")
                                                    @if($subcategory->user_id == Auth::user()->id || Auth::user()->usertype== "admin")
                                                        <a href="javascript:void(0)" type="button" class="btn tp-edit-btn edit_subcategory_form"
                                                            data-toggle="modal" data-target="#subcategoryeditModal"
                                                            data-id="{{ $subcategory->id }}" data-title="{{ $subcategory->title }}"
                                                            data-status="{{ $subcategory->status }}"
                                                            data-description="{{ $subcategory->description }}"
                                                            data-meta_title="{{ $subcategory->meta_title }}"
                                                            data-meta_description="{{ $subcategory->meta_description }}"
                                                            data-svg="{{ $subcategory->svg }}"
                                                            data-blog_category_id="{{ $subcategory->course_category->id}}"
                                                            >
                                                            <span>
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                                            </span>
                                                        </a>
                                                    @endif
                                                @endcan
                                                @can("course-sub-category-delete")
                                                    @if($subcategory->user_id == Auth::user()->id || Auth::user()->usertype== "admin")
                                                        <a href="javascript:void(0)" data-subcategory_id="{{ $subcategory->id }}" id="delete"
                                                            class="btn tp-delet-btn delete_category">
                                                            <span>
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                                            </span>
                                                        </a>
                                                    @endif
                                                @endcan
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
    {{-- Sub Category insert modal --}}
    <div class="modal fade" id="createSubCategoryModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{ route('course-sub-categories.store') }}" id="subCategoryForm" enctype="multipart/form-data"
                    method="POST">
                    @csrf
                    <div class="modal-header">
                        <h4 class="modal-title">Sub Category Create</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="errorMassage mb-3"></div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title">Sub Category Title</label>
                                <input type="text" name="title" class="form-control" id="title"
                                    placeholder="Enter Title" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Sub Category Description</label>
                                <textarea class="form-control" name="description" rows="3" id="description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="svg">Sub Category Icon</label>
                                <textarea class="form-control" name="svg" rows="2" id="svg"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label>Sub Category Status</label>
                                <select name="status" id="status" class="custom-select">
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                            </div>

                            {{-- select category  --}}
                            
                            <div class="form-group">
                                <label>Category Select</label>
                                <select name="blog_category_id" id="blog_category_id" class="custom-select">
                                    <option disabled selected>Select Category</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->title }}</option>
                                    @endforeach
                                </select>
                            </div>
                            

                            {{-- Meta section  --}}
                            <div>
                                <h3>Meta Section</h3>
                                <hr>
                            </div>

                            <div class="form-group">
                                <label for="meta_title">Meta Title</label>
                                <input type="text" name="meta_title" class="form-control" id="meta_title"
                                    placeholder="Enter Meta Title">
                            </div>

                            <div class="form-group">
                                <label for="meta_description">Meta Description</label>
                                <textarea class="form-control" name="meta_description" rows="3" id="meta_description"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" id="submitBtn" class="btn btn-primary">Create sub Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    {{-- category edit modal --}}
    <div class="modal fade" id="subcategoryeditModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{ route('course-sub-categories.update') }}" id="EditcategoryForm" enctype="multipart/form-data"
                    method="POST">
                    @csrf
                    <div class="modal-header">
                        <h4 class="modal-title">Sub Category Create</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="errorMassage mb-3"></div>
                        <div class="card-body">
                            <input type="hidden" name="id" id="up_id">
                            <div class="form-group">
                                <label for="title">Sub Category Title</label>
                                <input type="text" name="title" class="form-control" id="up_title"
                                    placeholder="Enter Title" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Sub Category Description</label>
                                <textarea class="form-control" name="description" rows="3" id="up_description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="svg">Sub Category Icon</label>
                                <textarea class="form-control" name="svg" rows="2" id="up_svg"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Sub Category Status</label>
                                <select name="status" id="up_status" class="custom-select">
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                </select>
                            </div>

                            {{-- select Sub category  --}}
                            <div class="form-group">
                                <label>Sub Category Select</label>
                                <select name="blog_category_id" id="up_blog_category_id" class="custom-select">
                                    <option disabled selected>Select Category</option>
                                    @foreach ($categories as $category)
                                        <option data-category-id="{{ $category->id }}" value="{{ $category->id }}">{{ $category->title }}</option>
                                    @endforeach
                                </select>
                            </div>

                            {{-- Meta section  --}}
                            <div>
                                <h3>Meta Section</h3>
                                <hr>
                            </div>

                            <div class="form-group">
                                <label for="meta_title">Meta Title</label>
                                <input type="text" name="meta_title" class="form-control" id="up_meta_title"
                                    placeholder="Enter Meta Title">
                            </div>

                            <div class="form-group">
                                <label for="meta_description">Meta Description</label>
                                <textarea class="form-control" name="meta_description" rows="3" id="up_meta_description"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" id="updateBtn" class="btn btn-primary">Update Sub Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@include('backend.layouts.partial.data-table-script')
@push('scripts')
    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>

    <script>
        "use strict";
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
        });
        $(document).ready(function() {
            // image preview
            $(document).on('change', '#image', function() {
                $('.error_success_msg_container').html('');
                if (this.files && this.files[0]) {
                    let img = document.querySelector('.image_preview');
                    img.onload = () => {
                        URL.revokeObjectURL(img.src);
                    }
                    img.src = URL.createObjectURL(this.files[0]);
                    document.querySelector(".image_preview").files = this.files;
                }
            });
            //category insert
            $(document).on('click', '#submitBtn', function(e) {
                e.preventDefault();
                let title = $('#title').val();
                let description = $('#description').val();
                let status = $('#status').val();
                let svg = $('#svg').val();
                let blog_category_id = $('#blog_category_id').val();
                let meta_title = $('#meta_title').val();
                let meta_description = $('#meta_description').val();
                $.ajax({
                    method: 'post',
                    url: "{{ route('course-sub-categories.store') }}",
                    data: {
                        title,
                        description,
                        status,
                        svg,
                        blog_category_id,
                        meta_title,
                        meta_description,
                    },
                    success: function(res) {
                        if (res.status == 'success') {
                            $('#subCategoryForm')[0].reset();
                            $('#createSubCategoryModal').modal('hide');
                            $('.table').load(location.href + ' .table');
                            Toast.fire({
                                icon: 'success',
                                title: res.message
                            });
                        }
                    },
                    error: function(err) {
                        let error = err.responseJSON;
                        $.each(error.errors, function(index, value) {
                            $('.errorMassage').append('<span class="text-danger">' +
                                value + '<span>' + '<br>');
                        });
                    }
                });
            })
        });

        //product show in edit form
        $(document).on('click', '.edit_subcategory_form', function() {
            let id = $(this).data('id');
            let title = $(this).data('title');
            let description = $(this).data('description');
            let status = $(this).data('status');
            let svg = $(this).data('svg');
            let blog_category_id = $(this).data('blog_category_id');
            let meta_title = $('#meta_title').val();
            let meta_description = $('#meta_description').val();
            let meta_keywords = $('#meta_keywords').val();

            $('#up_id').val(id);
            $('#up_title').val(title);
            $('#up_description').val(description);
            $('#up_status').val(status);
            $('#up_svg').val(svg);
            $('#up_blog_category_id').val(blog_category_id);
            $('#up_meta_title').val(meta_title);
            $('#up_meta_description').val(meta_description);
            $('#up_meta_keywords').val(meta_keywords);
            $('#up_blog_category_id option[data-category-id="' + blog_category_id + '"]').attr('selected', 'selected');
        })

        //update product
        $(document).on('click', '#updateBtn', function(e) {
            e.preventDefault();
            let id = $('#up_id').val();
            let title = $('#up_title').val();
            let description = $('#up_description').val();
            let status = $('#up_status').val();
            let svg = $('#up_svg').val();
            let blog_category_id = $('#up_blog_category_id').val();
            let meta_title = $('#up_meta_title').val();
            let meta_description = $('#up_meta_description').val();
            let meta_keywords = $('#up_meta_keywords').val();
            $.ajax({
                method: 'post',
                url: "{{ route('course-sub-categories.update') }}",
                data: {
                    id,
                    title,
                    description,
                    status,
                    svg,
                    blog_category_id,
                    meta_title,
                    meta_description,
                    meta_keywords,
                },
                success: function(res) {
                    if (res.status == 'success') {
                        $('#EditcategoryForm')[0].reset();
                        $('#subcategoryeditModal').modal('hide');
                        $('.table').load(location.href + ' .table');
                        Toast.fire({
                            icon: 'success',
                            title: res.message
                        });
                    }
                },
                error: function(err) {
                    let error = err.responseJSON;
                    $.each(error.errors, function(index, value) {
                        $('.errorMassage').append('<span class="text-danger">' + value +
                            '<span>' + '<br>');
                    });
                }
            });
        })

        $(document).on('click', '.delete_category', function(e) {
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
                    let category_id = $(this).data('subcategory_id');
                    $.ajax({
                        url: "{{ route('delete.course.subcategory') }}",
                        method: 'post',
                        data: {
                            id: category_id
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
    </script>
@endpush
