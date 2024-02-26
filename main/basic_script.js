// Lazy video loader
document.addEventListener("DOMContentLoaded", function() {
    var video = document.getElementById('videoElement');
    var textContent = document.getElementById('textContent');
    var videoContainer = document.getElementById('videoContainer');

    video.addEventListener('loadeddata', function() {
        videoContainer.classList.remove('loading');
        textContent.style.display = 'block';
    }, false);

    video.load();
});
