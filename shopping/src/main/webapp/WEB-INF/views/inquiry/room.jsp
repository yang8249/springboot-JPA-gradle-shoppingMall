<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>

	.card-body{
	    border: 1px solid black;
	    display: flex;
	    flex-direction: row;
	    justify-content: space-around;
	}


  table {
    border-collapse: collapse;
    width: 100%;
  }

  tr, td {
    vertical-align: middle; /* 세로 가운데 정렬 */
    padding: 10px;
    border-bottom: 1px solid #ccc; /* 하단 줄 */
  }
 .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    .searchIcon{
        width: 23px;
    	position: absolute;
   	    right: 42px;
    }
    
    #container{
        margin-top: 100px;
    }
    .logo {
	  outline: none;
	  user-select: none; /* 텍스트 선택 방지 */
	}
	#nav-header {
	  top: 0;
	  position: sticky;
	  z-index: 999999;
	}
	
	body{
	    margin: 0;
	    padding: 0;
	    width: 100%;
	    overflow-x: hidden;
    }

</style>
<div class="container py-3">
    <h4>관리자 문의 채팅</h4>
    <div id="chat-box" class="border rounded p-2" style="height:420px;overflow:auto;"></div>

    <div class="d-flex gap-2 mt-2">
        <input id="chat-input" class="form-control" placeholder="메시지를 입력..." />
        <button id="send-btn" class="btn btn-primary">전송</button>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
<script>
    const roomId = "${roomId}";

  function appendMsg(m) {
    const box = document.getElementById('chat-box');
    const div = document.createElement('div');
    div.textContent = "["+m.sentAt.split('T')[0]+"] "+ m.senderNick+": " +m.content;
    box.appendChild(div);
    box.scrollTop = box.scrollHeight;
  }

  function loadHistory() {
    fetch('/api/inquiry/history?roomId=' + encodeURIComponent(roomId))
      .then(r => r.json()).then(list => list.forEach(appendMsg));
  }

  let stomp;
  function connect() {
    const sock = new SockJS('/ws');
    stomp = Stomp.over(sock);
    stomp.connect({}, () => {
      stomp.subscribe('/topic/inq.' + roomId, frame => {
        appendMsg(JSON.parse(frame.body));
      });
      loadHistory();
    });
  }

  function send() {
    const i = document.getElementById('chat-input');
    const content = i.value.trim();
    if (!content) return;
    stomp.send('/app/send', {}, JSON.stringify({ roomId, content }));
    i.value = '';
  }

  document.getElementById('send-btn').onclick = send;
  document.getElementById('chat-input').addEventListener('keydown', e => {
    if (e.key === 'Enter') send();
  });

  connect();
</script>