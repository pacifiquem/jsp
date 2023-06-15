const userPBtn = document.querySelector('#profile-btn');
const pHidDIv = document.querySelector('#phidden');

$(document).ready(function () {
    $('#profile-btn').click(function () {
        $('#phidden').toggleClass('hidden');
    });
});