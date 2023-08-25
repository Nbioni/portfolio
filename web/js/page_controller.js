
function onDiscoverButtonClick(e) {
    $('#splash-overlay').removeClass("hide");
    $('#splash-overlay').addClass("remove-pointer-events");
    $('#welcome').removeClass("hide");
    $('#welcome').addClass("remove-pointer-events");
    $('.welcome-wrapper').addClass("hide");
    $('#html-layer').removeClass("override-app");
    document.body.classList.add("remove-pointer-events");
    setTimeout(()=> {
      document.body.classList.remove("remove-pointer-events");
    }
    ,4000);
    return;
}