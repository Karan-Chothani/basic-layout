new Container(
color: Colors.purple[100],
height: 574.5,
//width: 1000.0,
child: new Stack(
children: <Widget>[
new MatrixGestureDetector(
onMatrixUpdate: (m, tm, sm, rm) {
notifier1.value = m;
itemNo = 1;
},
// shouldRotate: false,
// shouldScale: true,
// shouldTranslate: false,
child: AnimatedBuilder(
animation: notifier1,
builder: (ctx, child) {
return Transform(
transform: notifier1.value,
child: Stack(
children: <Widget>[
Align(
alignment: Alignment(0.0, -0.85),
child: Container(
width: w1,
height: h1,
//color: Colors.green[100],
//color: Colors.purple,
child: DragTarget(
builder: (context, List<int> candidateData,
rejectedData) {
print(candidateData);
return Center(
child: Image(
image: AssetImage('images/part1.jpg'),
height: h1,
width: w1,
),
);
},
),
),
),
],
),
);
},
),
),
new MatrixGestureDetector(
onMatrixUpdate: (m, tm, sm, rm) {
notifier2.value = m;
itemNo = 2;
},
// shouldRotate: false,
// shouldScale: true,
// shouldTranslate: false,
child: AnimatedBuilder(
animation: notifier2,
builder: (ctx, child) {
return Transform(
transform: notifier2.value,
child: Stack(
children: <Widget>[
Align(
alignment: Alignment(0.0, -0.35),
child: Container(
width: w2,
height: h2,
//color: Colors.purple,
child: DragTarget(
builder: (context, List<int> candidateData,
rejectedData) {
print(candidateData);
return Center(
child: Image(
image: AssetImage('images/part2.jpg'),
height: h2,
width: w2,
),
);
},
),
),
),
],
),
);
},
),
),
new MatrixGestureDetector(
onMatrixUpdate: (m, tm, sm, rm) {
notifier3.value = m;
itemNo = 3;
},
// shouldRotate: false,
// shouldScale: true,
// shouldTranslate: false,
child: AnimatedBuilder(
animation: notifier3,
builder: (ctx, child) {
return Transform(
transform: notifier3.value,
child: Stack(
children: <Widget>[
Align(
alignment: Alignment(0.0, 0.15),
child: Container(
width: w3,
height: h3,
//color: Colors.purple,
child: DragTarget(
builder: (context, List<int> candidateData,
rejectedData) {
print(candidateData);
return Center(
child: Image(
image: AssetImage('images/part3.jpg'),
height: h3,
width: w3,
),
);
},
),
),
),
],
),
);
},
),
),
new MatrixGestureDetector(
onMatrixUpdate: (m, tm, sm, rm) {
notifier4.value = m;
itemNo = 4;
},
// shouldRotate: false,
// shouldScale: true,
// shouldTranslate: false,
child: AnimatedBuilder(
animation: notifier4,
builder: (ctx, child) {
return Transform(
transform: notifier4.value,
child: Stack(
children: <Widget>[
Align(
alignment: Alignment(0.0, 0.65),
child: Container(
width: w4,
height: h4,
//color: Colors.purple,
child: DragTarget(
builder: (context, List<int> candidateData,
rejectedData) {
print(candidateData);
return Center(
child: Image(
image: AssetImage('images/part4.jpg'),
height: h4,
width: w4,
),
);
},
),
),
),
],
),
);
},
),
),
new SpeedDial(
animatedIcon: AnimatedIcons.menu_arrow,
animatedIconTheme: IconThemeData(size: 24.0),
closeManually: false,
marginRight: 21.5,
marginBottom: 23.5,
curve: Curves.easeIn,
overlayColor: Colors.black,
overlayOpacity: 0.3,
foregroundColor: Colors.white,
backgroundColor: Colors.purple,
//tooltip: "Speed Dial123",
//closeManually: true,
children: [
SpeedDialChild(
child: Icon(
Icons.zoom_in,
size: 30,
),
foregroundColor: Colors.white,
backgroundColor: Colors.purple,
label: "Zoom In",
labelStyle: TextStyle(fontSize: 14.5),
onTap: zoomin,
),
SpeedDialChild(
child: Icon(
Icons.zoom_out,
size: 30,
),
foregroundColor: Colors.white,
backgroundColor: Colors.purple,
label: "Zoom Out",
labelStyle: TextStyle(fontSize: 14.5),
onTap: zoomout,
),
],
),
],
),
),