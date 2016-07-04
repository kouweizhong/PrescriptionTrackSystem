package com.silence.servlets;

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

/*
 * @ServerEndpoint ע����һ�����ε�ע�⣬���Ĺ�����Ҫ�ǽ�Ŀǰ���ඨ���һ��websocket�������ˡ�
 * ע���ֵ�������ڼ����û����ӵ��ն˷���URL��ַ��
 */
@ServerEndpoint("/websocket")
public class WebSocketTest {

	/*
	 * onMessage ������@OnMessage��ע�⡣���ע�ⶨ���˵����������յ��ͻ��˷��͵���Ϣʱ�����õķ�����
	 * ע�⣺����������ܰ���һ��javax.websocket.Session��ѡ�����������ǵ����������session��������
	 * ����������������������ѵ�ǰ������Ϣ�ͻ��˵�����Sessionע���ȥ��
	 */

	private static Map<String, Session> sessions = new HashMap<String, Session>();
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException,InterruptedException {
		System.out.println("�ӿͻ��˷�������������Ϣ : " + message);
		Set<String> keys = sessions.keySet();
		for (String key : keys){
			Session s = sessions.get(key);
			if (s.isOpen()){
				s.getBasicRemote().sendText(message.trim());
				System.out.println("���ͳɹ���");
			}
		}
	}
	/*
	 * onOpen �� onClose �����ֱ�@OnOpen��@OnClos e ��ע�⡣
	 * ������ע������ò������������Ƕ����˵�һ�����û����ӺͶϿ���ʱ�������õķ�����
	 */
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		System.out.println("�ͻ��˽�������");
		try {
			sessions.put(session.getId(), session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Session session, Throwable throwable) {
		System.out.println("����������.....");
	}

	@OnClose
	public void onClose(Session session, CloseReason reason) {
		try {
			System.out.println("�ͻ��˹ر�����,session_id=" + session.getId());
			synchronized (sessions) {
				sessions.remove(session.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}