(function() {
    var
        htmlCanvas = document.getElementById('snakeboard'),
        context = htmlCanvas.getContext('2d');

    initialize();

    function initialize() {
        window.addEventListener('resize', resizeCanvas, false);
        resizeCanvas();
    }

    function redraw() {
        context.lineWidth = '1';
        context.strokeRect(0, 0, window.innerWidth, window.innerHeight);
    }

    function resizeCanvas() {
        htmlCanvas.width = window.innerWidth * 0.9;
        htmlCanvas.height = window.innerHeight * 0.9;
        redraw();
    }
})();