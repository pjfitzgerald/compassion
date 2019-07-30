function showQuestions() {
  var rotateButton = document.querySelector(".chat-header .button-expand-medium");
  rotateButton.classList.toggle("button-rotate");
  rotateButton.classList.toggle("BG-secondary-color");
  rotateButton.classList.toggle("extra-margin");

  var chatHeader = document.querySelector(".chat-header");
  chatHeader.classList.toggle("height-200px");

  var chatHeaderH4 = document.querySelector(".chat-header h4");
  chatHeaderH4.classList.toggle("move-h4");

  var messagesContainer = document.querySelector(".chatroom-messages-middle-container");
  messagesContainer.classList.toggle("move-up-messages");

  var partnerAvatar = document.querySelector(".avatar-medium");
  if (partnerAvatar.classList.contains("hide")) {
    setTimeout(function timer(){
      partnerAvatar.classList.toggle("hide");
      }, 100); // Change this for timer-delay
  } else {
    partnerAvatar.classList.toggle("hide");
  };

  var partnerQuestions = document.querySelector(".header-questions");
  if (partnerQuestions.classList.contains("hide")) {
    setTimeout(function timer(){
      partnerQuestions.classList.toggle("hide");
      }, 100); // Change this for timer-delay
  } else {
    partnerQuestions.classList.toggle("hide");
  };
};

function moveUpChatbox() {
  var sendMessageBox = document.querySelector('.messages');
  sendMessageBox.classList.toggle("expandedMessageBox");

  var addHeight = document.querySelector(".chat-message-box");
  addHeight.classList.toggle("extraHeight");
};

export { showQuestions, moveUpChatbox }
