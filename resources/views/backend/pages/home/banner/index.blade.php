@extends("backend.pages.home.index")
@section("home-content")

<h2 class="mb-4">Home Banner Section Area</h2>
    <!-- /.card-header -->
    <table class="table table-bordered my-5 py-3">
        <thead>
        <tr>
            <th style="width: 10px">SN.</th>
            <th>Sub Title</th>
            <th>Ttile</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
            @forelse ($banner as $key=>$mainItem)
            <tr>
                <td>{{ $key+=1 }}</td>
                <td>{{ $mainItem['title'] }}</td>
                <td>{{ $mainItem['sub_title'] }}</td>
                <td class="d-flex items-center">
                    <a href="{{ route('admin.pages.homepage.banner.edit',$mainItem['id']) }}" class="btn btn-success mr-2"><i class="fas fa-edit"></i></a>
                    
                    <a href="javascript:void(0)" data-item_id="{{ $mainItem['id'] }}" id="delete"
                        class="btn btn-danger delete_item">
                        <i class="fas fa-trash"></i>
                      </a>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="4" class="text-center">No Data Found</td>
            </tr>
            @endforelse
     
        </tbody>
    </table>

<form action="{{ route("admin.pages.homepage.banner.store") }}" enctype="multipart/form-data" method="POST">
    @csrf
    <input type="hidden" name="updateId" value="{{ isset($item) ? $item["id"] : "" }}">
    <div class="form-group">
      <label for="bannerSubTitle">Sub Title</label>
      <input name="subTitle" id="bannerSubTitle" class="form-control" rows="5" value="{{ old("subTitle") ? old("subTitle") : (isset($item) ? $item["sub_title"] : "") }}" />
    </div>

    <div class="form-group">
      <label for="heroTitle">Title</label>
      <textarea name="title" id="heroTitle" class="form-control" rows="5">{{ old("title") ? old("title") : (isset($item) ? $item["title"] : "") }}</textarea>
    </div>

    <div class="form-group">
      <label for="heroButtonTitle">Button Title</label>
      <input type="text" name="buttonTitle" id="heroButtonTitle" class="form-control" value="{{ old("buttonTitle") ? old("buttonTitle") : (isset($item) ? $item["button_title"] : "") }}" />
    </div>

    <div class="form-group">
      <label for="heroButtonUrl">Button Url</label>
      <input type="text" name="buttonUrl" value="{{ old("buttonUrl") ? old("buttonUrl") : (isset($item) ? $item["button_url"] : "") }}" id="heroButtonUrl" placeholder="somthing.com" class="form-control"/>
    </div>

    <div class="form-group">
        <div class="mb-3">
            <div id="sideImage_image_preview">
                @if (isset($item) && $item["side_image"] != null)
                    <img src="{{ asset($item["side_image"]) }}" class="img-fluid" height="200" width="200" />
                @endif
            </div>
            <label for="sideImage" class="form-label">Side Image</label>
            <input class="form-control" name="sideImage" type="file" id="sideImage">
        </div>
    </div>
    <div class="form-group">
        <div class="mb-3">
            <div id="bgImage_image_preview">
                @if (isset($item) && $item["bg_image"] != null)
                    <img src="{{ asset($item["bg_image"]) }}" class="img-fluid" height="200" width="200" />
                @endif
            </div>
            <label for="bgImage" class="form-label">Background Image</label>
            <input class="form-control" value="" name="bgImage" type="file" id="bgImage">
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

@endsection

@push("scripts")
    <script>
        $(document).ready(function() {
            $("#sideImage").change(function() {
                $("#sideImage_image_preview").html("");
                var total_file = document.getElementById("sideImage").files.length;
                for (var i = 0; i < total_file; i++) {
                    $("#sideImage_image_preview").append("<img src='" + URL.createObjectURL(event.target.files[i]) + "' class='img-fluid' height='200' width='200' />");
                }
            });
            $("#bgImage").change(function() {
                $("#bgImage_image_preview").html("");
                var total_file = document.getElementById("bgImage").files.length;
                for (var i = 0; i < total_file; i++) {
                    $("#bgImage_image_preview").append("<img src='" + URL.createObjectURL(event.target.files[i]) + "' class='img-fluid' height='200' width='200' />");
                }
            });
        });
    </script>
    {!! deleteItemScript('admin.pages.homepage.banner.delete') !!}
@endpush