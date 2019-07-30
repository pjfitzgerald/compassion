function moveUpChatbox() {
  var sendMessageBox = document.querySelector('.messages');
  sendMessageBox.classList.toggle("expandedMessageBox");

  var addHeight = document.querySelector(".chat-message-box");
  addHeight.classList.toggle("extraHeight");
}

export { moveUpChatbox }
