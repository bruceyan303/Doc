
// type Point={x:number,y:number}
interface Point {x:number,y:number}
function tsDemo(data: Point) {
    console.log(data.x,data.y);
    console.log("tdemo")
    return Math.sqrt(data.x ** 2 + data.y ** 2);
}
tsDemo({ x: 3, y: 4 });