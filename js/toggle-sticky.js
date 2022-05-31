$('.sticky>button, .sticky-xs>button').click(function () {
    let target = $(this.getAttribute('data-target'));
    let remove = this.getAttribute('data-remove');
    target.removeClass(remove);
})