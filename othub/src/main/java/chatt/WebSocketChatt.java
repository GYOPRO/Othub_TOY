package chatt;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value="/chatt") //WebSocket 활성화 매핑 정보 지정
public class WebSocketChatt { // 클라이언트가 접속할 떔나다 생성되어 클라이언트와 직접 통신하는 클라스 => 1/N의 통신이 가능하도록 만들어야함
	private static Set<Session> clients =
			Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen //클라이언트가 접속할 떄 발생하는 이벤트
	public void onOpen(Session s) { 
		// 클라이언트가 ServerEndPoint 값인 "/chatt" url로 서버에 접속하게 되면 onOpen 메서드가 실행되며
		System.out.println("open session : " + s.toString());
		if(!clients.contains(s)) {
			clients.add(s);
			System.out.println("session open : " + s);
			
		}else {
			System.out.println("이미 연결된 session 임!!!");
		}
		

	}
	
	@OnMessage // 메세지가 수신되었을 때
	public void onMessage(String msg, Session session) throws Exception{ // '/chatt' 접속하면 실행 / 클라이언트정보를 매개변수 세션 객체를 통해 전달받음/ 정적 필드인 클라이언트에 세션이 없으면 clients에 접속된 클라이언트 추가
		System.out.println("receive message : " +msg);
		for(Session s : clients) {
			System.out.println("send data : " +msg);
			s.getBasicRemote().sendText(msg);
		}
		
	}
	
	@OnClose// 클라이언트가 브라우저를 끄거나 다른 경로로 이동할 때
	public void onClose(Session s) { //url 바꾸거나 종료하면 자동으로 실행되며 해당 클라이언트 정보를 clients에서 제거
		System.out.println("session close : "+ s);
		clients.remove(s);
		
	}
	

}
