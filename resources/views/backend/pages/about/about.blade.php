@extends("backend.pages.about.index")
@section("home-content")
@push("styles")
<link rel="stylesheet" href="{{ asset("backend/assets/plugins/bs-toggle/bootstrap-toggle.min.css") }}">
@endpush
<h2 class="mb-4">About Section Area</h2>
<form action="{{ route("admin.pages.about.update") }}" enctype="multipart/form-data" method="POST">
    @csrf
    @method("PUT")
    <div class="form-group">
      <label for="title">Title</label>
      <textarea name="title" id="title" class="form-control" rows="5">{!! $about['title'] !!}</textarea>
    </div>
    <div class="form-group">
      <label for="description">Discription</label>
      <textarea name="description" id="description" class="form-control" rows="5">{!! $about['description'] !!}</textarea>
    </div>

    <div class="form-group">
      <label for="heroButtonTitle">Button Title</label>
      <input type="text" value="{!! $about['button_title'] !!}" name="buttonTitle" id="heroButtonTitle" class="form-control"/>
    </div>

    <div class="form-group">
      <label for="buttonUrl">Button Url</label>
      <input type="text" name="buttonUrl" value="{!! $about['button_url'] !!}" id="buttonUrl" class="form-control"/>
    </div>
    
    <div class="form-group">
        <div class="mb-3">
            @if ($about['image1'] != null)
                <div id="image1_image_preview">
                    <img src="{{ asset($about['image1']) }}" class="img-fluid" height="200" width="200" />
                </div>
            @endif
            <label for="image1" class="form-label">Image 1</label>
            <input class="form-control" name="image1" type="file" id="image1">
        </div>
    </div>

    {{-- about skill repeter  --}}
    
    @if(isset($about['skillTitle'] ))
        <div class="form-group">
            <label for="skillTitle">Skill Title</label>
                @foreach ($about['skillTitle'] as $key=>$skill)
                    @if ($key == 0)
                        <div class="d-flex align-items-center gap-3 mb-2">
                            <input type="text" name="skillTitle[]" id="skillTitle" class="form-control mr-3" value="{{ $skill }}" />
                            <button type="button" id="addNireSkillTitle" class="btn btn-primary">Add More</button>
                        </div>
                        @break
                    @endif
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <input type="text" name="skillTitle[]" id="skillTitle-m" class="form-control mr-3" value="{{ $skill }}" />
                        <button type="button" id="addNireSkillTitle" class="btn btn-primary">Add More</button>
                    </div>
                @endforeach

                @php
                    $first_item = true;
                @endphp
                @if ($about['skillTitle'] != null)
                    @foreach ($about['skillTitle'] as $skill)
                        
                        <div class="d-flex align-items-center gap-3 mb-2">
                            <input type="text" name="skillTitle[]" id="skillTitle" class="form-control mr-3" value="{{ $skill }}" />
                            <button type="button" class="btn btn-danger removeSkillTitle">Remove</button>
                        </div>
                    @endforeach
                @endif
        </div>
    @endif


    <button type="submit" class="btn btn-primary">Submit</button>
</form>
@endsection
@push("scripts")
    <script src="{{ asset("backend/assets/plugins/bs-toggle/bootstrap-toggle.min.js") }}"></script>
    <script>
        $(function() {
            $("#image1").on('change',function() {
                if (this.files && this.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $("#image1_image_preview").html(`<img src="${e.target.result}" class="img-fluid" height="200" width="200" />`);
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });

            // about skill repeter
            $("#addNireSkillTitle").on('click',function() {
                let html = `<div class="d-flex align-items-center gap-3 mb-2">
                                <input type="text" name="skillTitle[]" id="skillTitle-m" class="form-control mr-3" />
                                <button type="button" class="btn btn-danger removeSkillTitle">Remove</button>
                            </div>`;
                $("#skillTitle").parent().after(html);
            });

            $(document).on("click", ".removeSkillTitle", function() {
                $(this).parent().remove();
            });

        });

    </script>
@endpush