@extends("backend.pages.about.index")
@section("home-content")

<h2 class="mb-4">Brand Section Area</h2>
    <!-- /.card-header -->
    <table class="table table-bordered my-5 py-3">
        <thead>
        <tr>
            <th style="width: 10px">SN.</th>
            <th>Brand Url</th>
            <th>Brand Logo</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
            @forelse ($brand as $key=>$mainItem)
            <tr>
                <td>{{ $key+=1 }}</td>
                <td>{{ $mainItem['url'] }}</td>
                <td>
                    @if ( $mainItem['logo'] != null)
                        <img src="{{ asset($mainItem['logo']) }}" alt="{{ $mainItem['url'] }}" width="80" height="80">
                    @endif
                </td>
                <td>
                    <a href="{{ route('admin.pages.homepage.brand.edit',$mainItem['id']) }}" class="btn btn-success mr-2"><i class="fas fa-edit"></i></a>
                    
                    <a href="javascript:void(0)" data-item_id="{{ $mainItem['id'] }}" class="btn btn-danger delete_item">
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

<form action="{{ route("admin.pages.homepage.brand.store") }}" enctype="multipart/form-data" method="POST">
    @csrf
    <input type="hidden" name="updateId" value="{{ isset($item) ? $item["id"] : "" }}">
    <div class="form-group">
        <div class="mb-3">
            <div id="sideImage_image_preview">
                @if (isset($item) && $item["logo"] != null)
                    <img src="{{ asset($item["logo"]) }}" class="img-fluid" height="200" width="200" />
                @endif
            </div>
            <label for="sideImage" class="form-label">Brand logo</label>
            <input class="form-control" name="logo" type="file" id="sideImage">
        </div>
    </div>

    <div class="form-group">
        <label for="brandUrl">Brand Url</label>
        <input type="text" name="url" id="brandUrl" class="form-control" rows="5" value="{{ old("url") ? old("url") : (isset($item) ? $item["url"] : "") }}"/>
        @error('url')
            <div class="text-danger">{{ $message }}</div>
        @enderror
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
        });
    </script>
   
@endpush