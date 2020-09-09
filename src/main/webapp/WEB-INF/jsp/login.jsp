</form:form>
</body>
<script>
    //make a Random Number
    function randomNum(min,max) {
        return Math.floor(Math.random()*(max-min)+min);
    }

    //make a random color
    function randomColor(min,max) {
        var r = randomNum(min,max);
        var g = randomNum(min,max);
        var b = randomNum(min,max);

        return "rgb("+r+","+g+","+b+")";
    }
    drawPic();
    document.getElementById("changeImg").onclick = function (e) {
        e.preventDefault();
        drawPic();
    }

    //draw a pic of verification code
    function drawPic() {
        var canvas = document.getElementById("canvas");
        var width = canvas.width;
        var height = canvas.height;
        var ctx = canvas.getContext('2d');
        ctx.textBaseline = 'bottom';

        //draw background color
        ctx.fillStyle = randomColor(180,240); //prevent the background color to be dark
        ctx.fillRect(0,0,width,height);

        //draw text
        var str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        for (var i = 0; i < 4; i++){
            var txt = str[randomNum(0,str.length)];
            ctx.fillStyle = randomColor(50,160); // random a string color
            ctx.font = randomNum(15,40)+'px SimHei'; //random text size
            var x = 10+i*25;
            var y = randomNum(25,45);
            var deg = randomNum(-45,45);

            //fix the center point and angle
            ctx.translate(x,y);
            ctx.rotate(deg*Math.PI/180);
            ctx.fillText(txt,0,0);

            //reverse the center point and angle
            ctx.rotate(-deg*Math.PI/180);
            ctx.translate(-x,-y);
        }
    }

</script>
</html>