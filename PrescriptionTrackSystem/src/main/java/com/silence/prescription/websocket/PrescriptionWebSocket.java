package com.silence.prescription.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/addPreSuccess")
public class PrescriptionWebSocket {

	/*
	 * onMessage 方法被@OnMessage所注解。这个注解定义了当服务器接收到客户端发送的消息时所调用的方法。
	 * 注意：这个方法可能包含一个javax.websocket.Session可选参数（在我们的例子里就是session参数）。
	 * 如果有这个参数，容器将会把当前发送消息客户端的连接Session注入进去。
	 */
	private static Map<String, Session> sessions = new HashMap<String, Session>();
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException,
			InterruptedException {
		System.out.println("Received from client message : " + message);
		Set<String> keys = sessions.keySet();
		for (String key : keys){
			Session s = sessions.get(key);
			if (s.isOpen()){
				s.getBasicRemote().sendText(message.trim());
				System.out.println("发送成功！");
			}
		}
	}

	/*
	 * onOpen 和 onClose 方法分别被@OnOpen和@OnClos	e 所注解。
	 * 这两个注解的作用不言自明：他们定义了当一个新用户连接和断开的时候所调用的方法。
	 */
	@OnOpen
	public void onOpen(Session session,EndpointConfig config) {
		System.out.println("客户端建立链接");
		try{
			sessions.put(session.getId(), session);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	@OnError
	public void onError(Session session,Throwable throwable){
		System.out.println("服务器出错.....");
	}
	@OnClose
	public void onClose(Session session,CloseReason reason) {
		try {
			System.out.println("客户端关闭连接,session_id="+session.getId());
			synchronized (sessions) {
				sessions.remove(session.getId());
			}
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
