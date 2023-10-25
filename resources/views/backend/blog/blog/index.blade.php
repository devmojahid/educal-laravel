@extends('backend.layouts.master')
@section('title', 'Blogs')
@include('backend.layouts.partial.data-table-style')

@section('content')
    <section class="content-header info-box p-3 rounded">
        <div class="container-fluid">
            <div class="row mb-2 mt-2">
                <div class="col-sm-6">
                    <h3 class="card-title">{{ __('dashboard.blog') }}</h3>
                </div>
                @can('blog-create')
                    <div class="col-sm-6">
                        <div class="float-right">
                            <a class="btn btn-primary" href="{{ route('blog.create') }}">
                                <i class="fas fa-plus"></i>
                                {{ __('dashboard.add_new') }} {{ __('dashboard.blog') }}
                            </a>
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
                                        <th>SL.</th>
                                        <th>Title</th>
                                        <th>status</th>
                                        <th>Category</th>
                                        <th>SUb Category</th>
                                        <th>Image</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($blogs as $key => $blog)
                                        <tr>
                                            <td>{{ $key += 1 }}</td>
                                            <td>{{ $blog->title }}</td>
                                            <td>{{ $blog->status }}</td>
                                            <td>{{ optional($blog->category)->title }}</td>
                                            <td>{{ optional($blog->subcategory)->title }}</td>
                                            <td>
                                                <img src="{{ asset($blog->image) }}" alt="" width="100"
                                                    height="100">
                                            </td>
                                            <td class="d-flex items-center">
                                                @can('blog-edit')
                                                    <a href="{{ route('blog.edit', $blog->id) }}" class="btn tp-edit-btn mr-2">
                                                        <span>
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                                                        </span>
                                                    </a>
                                                @endcan
                                                @can('blog-delete')
                                                    <form action="{{ route('blog.destroy', $blog->id) }}" method="POST">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn tp-delet-btn">
                                                            <span>
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                                            </span>
                                                        </button>
                                                    </form>
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
@endsection

@include('backend.layouts.partial.data-table-script')
