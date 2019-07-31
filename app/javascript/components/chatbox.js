// SHOW HEADER-INFORMATION (DEFAULT OTHER USER)
function showQuestions() {
  var rotateButton = document.querySelector(".chat-header .button-expand-medium");
  rotateButton.classList.toggle("button-rotate");
  rotateButton.classList.toggle("BG-secondary-color");
  rotateButton.classList.toggle("extra-margin");

  var chatHeader = document.querySelector(".chat-header");
  chatHeader.classList.toggle("height-225px");

  var chatHeaderH4 = document.querySelectorAll(".chat-header h4"), i;
  for (let i = 0; i < chatHeaderH4.length; i++) {
    chatHeaderH4[i].classList.toggle("move-h4");
  };

  var messagesContainer = document.querySelector(".chatroom-messages-middle-container");
  messagesContainer.classList.toggle("move-up-messages");

  var partnerAvatar = document.querySelector(".header-avatars-container");
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

// SHOW HEADER-INFORMATION FOR USER
function showUserQuestions() {

  // TOGGLE BETWEEN USERS AVATARS
  var avatarMediumNotActive = document.querySelectorAll(".header-avatars-container img"), i;
  for (let i = 0; i < avatarMediumNotActive.length; i++) {
    avatarMediumNotActive[i].classList.toggle("avatar-not-active");
  };

  // TOGGLE BETWEEN USERS ANSWERS
  var chatHeaderQuestions = document.querySelectorAll(".header-questions h5"), i;
  for (let i = 0; i < chatHeaderQuestions.length; i++) {
    chatHeaderQuestions[i].classList.toggle("chat-hide");
  };

  // TOGGLE BETWEEN USERS USERNAMES
  var chatHeaderUsername = document.querySelectorAll(".chatroom-usernames"), i;
  for (let i = 0; i < chatHeaderUsername.length; i++) {
    chatHeaderUsername[i].classList.toggle("chatroom-username-hide");
  };
};

// MOVE UP THE CHATBOX ON FOCUS (TEXTAREA)
function moveUpChatbox() {

  // DECREASES HEIGHT OF MESSAGES-CONTAINER
  var sendMessageBox = document.querySelector('.chatroom-messages-middle-container');
  sendMessageBox.classList.add("expanded-message-box");

  // ADDS THE EXTRA HEIGHT TO THE TEXT-AREA
  var addHeight = document.querySelector(".chat-message-box");
  addHeight.classList.add("extra-height");
};

// MINIFY TEXTAREA
function minifyTextarea() {
  var sendMessageBoxClose = document.querySelector('.chatroom-messages-middle-container');
  if (sendMessageBoxClose.classList.contains("expanded-message-box")) {
    sendMessageBoxClose.classList.toggle("expanded-message-box");
  };

  // ADDS THE EXTRA HEIGHT TO THE TEXT-AREA
  var removeHeight = document.querySelector(".chat-message-box");
  if (removeHeight.classList.contains("extra-height")) {
    removeHeight.classList.toggle("extra-height");
  };
};

export { showQuestions, moveUpChatbox, showUserQuestions, minifyTextarea }
