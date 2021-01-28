$(document).on("change", "#profile_image_upload", function(e) {
  let reader = new FileReader();
  reader.onload = function(e) {
    $(".hidden").removeClass();
    $(".profile__default-img").removeClass();
    $("#profile-img").remove();
    $("#profile-img-prev").attr("src", e.target.result);
  };
  return reader.readAsDataURL(e.target.files[0]);
});
