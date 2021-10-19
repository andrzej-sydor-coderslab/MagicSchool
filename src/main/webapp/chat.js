let client = null;

function showMessage(value, user) {

    let today    = new Date();
    let date     = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    let time     = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let dateTime = date+' '+time;

    let newResponse = document.createElement('p');
    newResponse.appendChild(document.createTextNode("[" + dateTime + "] "));
    newResponse.appendChild(document.createTextNode(user));
    newResponse.appendChild(document.createTextNode(" : "));
    newResponse.appendChild(document.createTextNode(value));
    let respone = document.getElementById('reponse');
    respone.appendChild(newResponse);
}

function connect() {
    client = Stomp.client('ws://localhost:8080/chat');
    client.connect({}, function (frame) {
        client.subscribe("/app/university/chat", function(message){
            showMessage(JSON.parse(message.body).message, JSON.parse(message.body).user)
        });
    })
}

function sendMessage() {
    let messageToSend = document.getElementById('messageToSend').value;
    let user          = document.getElementById('user').value;
    client.send("/app/university/chat", {}, JSON.stringify({'message': messageToSend, 'user': user}));
}