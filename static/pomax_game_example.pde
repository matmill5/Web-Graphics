1   <!DOCTYPE html>
2   <html>
3     <head>
4       <meta charset="utf-8">
5       <title>My Processing Page</title>
6       <script type="text/javascript" src="processing.js"></script>
7       <script type="text/javascript">
8       var bound = false;
9 
10       function bindJavascript() {
11         var pjs = Processing.getInstanceById('mysketch3');
12         if(pjs!=null) {
13           pjs.bindJavascript(this);
14           bound = true; }
15         if(!bound) setTimeout(bindJavascript, 250);
16       }
17       bindJavascript();
18 
19       function showXYCoordinates(x, y) {
20         document.getElementById('xcoord').value = x;
21         document.getElementById('ycoord').value = y;
22       }
23       </script>
24     </head>
25     <body>
26       <canvas id="mysketch3" data-processing-sources="mysketch3.pde"></canvas>
27       <div id="coordinates">
28         x/y: <input type="textfield" id="xcoord">/<input type="textfield" id="ycoord">
29       </div>
30     </body>
31   </html>