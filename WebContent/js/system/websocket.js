var path = window.location.host;
// 我们连接到websocket 服务器端，使用构造函数 new WebSocket()
// 而且传之以端点URL：ws://localhost:8080/WebSocket/websocket
var webSocket = new WebSocket('ws://'+path+'/WebSocket/websocket');
webSocket.onerror = function(event) {
	alert("服务器连接失败！")
};
function start() {
	webSocket.send(arguments[0]);
	return false;
}