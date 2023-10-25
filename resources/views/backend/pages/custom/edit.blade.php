@extends('backend.layouts.master')
@section('title', __('dashboard.edit_custom_page'))
@section('content')
    {{-- Content Header (Page header)  --}}
    <section class="content-header info-box p-3 rounded">
        <div class="container-fluid">
            <div class="row mb-2 mt-2">
                <div class="col-sm-6">
                    <h3 class="card-title">{{ __('dashboard.edit_custom_page') }}</h3>
                </div>
                {{-- @can('blog.list') --}}
                <div class="col-sm-6">
                    <div class="float-right">
                        <a class="btn btn-primary" href="{{ route('admin.pages.index') }}">
                            <i class="fas fa-plus"></i>{{ __('dashboard.all_custom_page') }}
                        </a>
                    </div>
                </div>
                {{-- @endcan --}}
            </div>
        </div>
    </section>

    <form id="pageForm" action="{{ route('admin.pages.update',$page->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="card">
            <div class="card-body">
                <div class="form-group">
                    <label for="pageTitle">{{ __('dashboard.title') }}</label>
                    <input type="text" name="title" class="form-control" value="{{ $page->title }}" id="pageTitle" placeholder="Enter Title"
                        required>
                </div>
                <div class="form-group">
                    <label for="pageDesc">{{ __('dashboard.content') }}</label>
                    <textarea name="content" id="content" cols="30" rows="10">{{ $page->content }}</textarea>
                </div>
              
                <div class="form-group">
                    <div class="row">
                        <div class="col-6">
                            <div class="image_preview">
                                <img id="pageImage_preview" src="{{ asset($page->image) }}" alt="Pages Image" width="100" height="100" />
                            </div>
                            <label for="pageImage">{{ __('dashboard.image') }}</label>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input type="file" name="image" class="custom-file-input" id="pageImage">
                                    <label class="custom-file-label"
                                        for="pageImage">{{ __('dashboard.choose_file') }}</label>
                                </div>
                                <div class="input-group-append">
                                    <span class="input-group-text">{{ __('dashboard.upload') }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <!-- select -->
                            <div class="form-group">
                              <label>{{ __("dashboard.status") }}</label>
                              <select name="status" class="custom-select">
                                <option value="active" {{ $page->status == "active" ? "selected" : "" }} >{{ __("dashboard.active") }}</option>
                                <option value="inactive" {{ $page->status == "inactive" ? "selected" : "" }}>{{ __("dashboard.inactive") }}</option>
                              </select>
                            </div>
                          </div>
                    </div>
                </div>

                {{-- meta section --}}
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="metaTitle">{{ __('dashboard.meta_title') }}</label>
                            <input type="text" name="meta_title" class="form-control" id="metaTitle" value="{{ $page->meta_title }}" placeholder="Enter Meta Title">
                        </div>
                        <div class="col-md-6">
                            <label for="metaKeywords">{{ __('dashboard.meta_keywords') }}</label>
                            <input type="text" name="meta_keywords" class="form-control" id="metaKeywords" value="{{ $page->meta_keywords }}" placeholder="Enter Meta Keywords">
                        </div>
                        <div class="col-md-12 mt-3">
                            <label for="metaDesc">{{ __('dashboard.meta_description') }}</label>
                            <textarea name="meta_description" class="form-control" id="metaDesc" rows="5" placeholder="Enter Meta Description">{{ $page->meta_description }}</textarea>
                        </div>
                </div>

            </div>
        </div>
    </div>

        <div class="card">
            <div class="card-body">
                <button type="submit" class="btn btn-primary">{{ __('dashboard.submit') }}</button>
            </div>
        </div>
    </form>
@endsection

@push('scripts')
    <script src="{{ asset('backend/assets/plugins/tinymce/tinymce.min.js') }}"></script>
    <script>
        tinymce.init({
            selector: '#content'
        });
        $(document).ready(function() {
            if ($("#pageImage_preview").attr('src') == '') {
                $("#pageImage_preview").hide();
            }
            $('#pageImage').change(function(e) {
                $("#pageImage_preview").show();
                let reader = new FileReader();
                reader.onload = function(e) {
                    $('#pageImage_preview').attr('src', e.target.result);
                }
                reader.readAsDataURL(e.target.files[0]);
            });
        });
    </script>
@endpush
