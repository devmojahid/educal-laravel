@extends("backend.pages.about.index")
@section("home-content")
<h2 class="mb-4">About Testimonial Section Area</h2>
<form action="{{ route("admin.pages.about.testimonial.store") }}" enctype="multipart/form-data" method="POST">
    @csrf
    <div class="form-group">
        <label for="testimonialTitle">Title</label>
        <input name="title" id="testimonialTitle" class="form-control" value="{{ old("title") ? old("title") : (isset($data) ? $data["title"] : "") }}"/>
    </div>
    
    <div class="form-group">
        <label for="testimonialVideo">Video Url</label>
        <input name="videoUrl" id="testimonialVideo" class="form-control" value="{{ old("videoUrl") ? old("videoUrl") : (isset($data) ? $data["videoUrl"] : "") }}"/>
    </div>

    <div class="form-group">
        <label for="testimonialVideoTitle">Section Video Title</label>
        <input name="videoTitle" id="testimonialVideoTitle" class="form-control" value="{{ old("videoTitle") ? old("videoTitle") : (isset($data) ? $data["videoTitle"] : "") }}"/>
    </div>
   

    <div class="form-group">
        <label for="testimonialDesc">Section Video Description</label>
        <input name="videoDesc" id="testimonialDesc" class="form-control" value="{{ old("videoDesc") ? old("videoDesc") : (isset($data) ? $data["videoDesc"] : "") }}"/>
    </div>
    <button type="button" class="btn btn-primary mt-4 ml-2" id="add_more_testimonial">Add More</button><br><br>
    <div class="repeted_items_hear"></div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>

@endsection

@push("scripts")
    <script>
        "use strict";
        $(document).ready(function() {
           let testimonialItem = `
           <div class="row align-items-center mb-2">
                <div class="col-10">
                    <div class="repeted_testimobial bg-gray p-3">
                            <div class="form-group">
                                <label for="testimonialItemInfo">Info Aria</label>
                                <input type="text" name="info[]" id="testimonialItemInfo" class="form-control" value="{{ old("info") ? old("info") : (isset($item) ? $item["info"] : "") }}" />
                            </div>

                            <div class="form-group">
                                <label for="clientName">Client Name</label>
                                <input type="text" name="clientName[]" value="{{ old("clientName") ? old("clientName") : (isset($item) ? $item["button_url"] : "") }}" id="clientName" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label for="clientdesignation">Client Designation</label>
                                <input type="text" name="clientdesignation[]" value="{{ old("clientdesignation") ? old("clientdesignation") : (isset($item) ? $item["button_url"] : "") }}" id="clientName" class="form-control"/>
                            </div>  

                            <div class="form-group">
                                <div class="mb-3">
                                    <div id="sideImage_image_preview">
                                        @if (isset($item) && $item["side_image"] != null)
                                            <img src="{{ asset($item["side_image"]) }}" class="img-fluid" height="200" width="200" />
                                        @endif
                                    </div>
                                    <label for="sideImage" class="form-label">Client Image</label>
                                    <input class="form-control" name="sideImage[]" type="file" id="sideImage">
                                </div>
                            </div>
                        </div>

                    </div>
                        <div class="col-2 align-items-center">
                            <button type="button" class="btn btn-danger mt-4 ml-2" id="delete_testimonial">Delete</button>
                        </div>
                </div>
            </div>`;

            $(document).on("click","#delete_testimonial",function(){
                $(this).parent().parent().remove();
            });

            $("#add_more_testimonial").on('click',function() {
                $(".repeted_items_hear").after(testimonialItem);
            });
        });
    </script>
    {!! deleteItemScript('admin.pages.about.banner.delete') !!}
@endpush