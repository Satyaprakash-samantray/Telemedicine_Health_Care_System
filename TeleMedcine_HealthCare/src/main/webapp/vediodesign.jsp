<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telemedicine Video Call</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #3c8dbc;
            color: #fff;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header img {
            max-height: 50px;
            vertical-align: middle;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px auto;
            max-width: 1200px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .video-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 1000px;
            margin-bottom: 20px;
        }

        video {
            width: 48%;
            height: auto;
            border-radius: 8px;
            background-color: #000;
            border: 2px solid #ddd;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        #localVideo {
            transform: rotateY(180deg);
        }

        .controls {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .btn {
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-weight: bold;
        }

        .btn-start {
            background: linear-gradient(45deg, #5cb85c, #4cae4c);
            color: #fff;
        }

        .btn-end {
            background: linear-gradient(45deg, #d9534f, #c9302c);
            color: #fff;
        }

        .btn:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .btn:active {
            transform: scale(0.95);
        }

        @media (max-width: 768px) {
            .video-container {
                flex-direction: column;
                align-items: center;
            }

            video {
                width: 90%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <img src="Image/TrustLogo.jpg" alt="Telemedicine Logo">
        <h1>Telemedicine Video Call</h1>
        <p>Connect with our Specialist</p>
    </header>
    <div class="container">
        <div class="video-container">
            <video id="localVideo" autoplay></video>
            <video id="remoteVideo" autoplay></video>
        </div>
        <div class="controls">
            <button class="btn btn-start" onclick="startCall()">Start Call</button>
            <button class="btn btn-end" onclick="endCall()">End Call</button>
        </div>
    </div>

    <script>
        const localVideo = document.getElementById('localVideo');
        const remoteVideo = document.getElementById('remoteVideo');
        let localStream;
        let peerConnection;

        const servers = {
            iceServers: [
                {
                    urls: 'stun:stun.l.google.com:19302'
                }
            ]
        };

        const socket = new WebSocket('ws://localhost:8080'); // Connect to the WebSocket server

        socket.onerror = (error) => {
            console.error('WebSocket Error:', error);
        };

        socket.onopen = () => {
            console.log('WebSocket is connected.');
        };

        socket.onmessage = async (message) => {
            console.log('Received message:', message.data);
            const data = JSON.parse(message.data);

            if (data.type === 'offer') {
                console.log('Received offer:', data);
                await peerConnection.setRemoteDescription(new RTCSessionDescription(data));
                const answer = await peerConnection.createAnswer();
                await peerConnection.setLocalDescription(answer);
                socket.send(JSON.stringify(peerConnection.localDescription));
            } else if (data.type === 'answer') {
                console.log('Received answer:', data);
                await peerConnection.setRemoteDescription(new RTCSessionDescription(data));
            } else if (data.type === 'candidate') {
                console.log('Received ICE candidate:', data.candidate);
                try {
                    await peerConnection.addIceCandidate(new RTCIceCandidate(data.candidate));
                } catch (e) {
                    console.error('Error adding received ice candidate', e);
                }
            }
        };

        async function startCall() {
            localStream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
            localVideo.srcObject = localStream;

            peerConnection = new RTCPeerConnection(servers);
            peerConnection.onicecandidate = ({ candidate }) => {
                if (candidate) {
                    socket.send(JSON.stringify({ type: 'candidate', candidate }));
                }
            };
            peerConnection.ontrack = (event) => {
                console.log('Remote stream added:', event.streams[0]);
                remoteVideo.srcObject = event.streams[0];
            };

            localStream.getTracks().forEach(track => {
                console.log('Adding track:', track);
                peerConnection.addTrack(track, localStream);
            });

            const offer = await peerConnection.createOffer();
            await peerConnection.setLocalDescription(offer);
            socket.send(JSON.stringify(peerConnection.localDescription));
        }

        function endCall() {
            peerConnection.close();
            localVideo.srcObject = null;
            remoteVideo.srcObject = null;
        }
    </script>
</body>
</html>
