import "bootstrap";
import { expandOrMinify, expandNewChat, expandSettings, toggleActive } from "../components/sidebar";
import { moveUpChatbox, showQuestions, showUserQuestions } from "../components/chatbox";


/* —————————————————————————————— */
/* ——————————— SIDEBAR —————————— */
/* —————————————————————————————— */

// ONCLICK BUTTON-EXPAND - MAIN SIDEBAR - EXPAND/MINIFY
let button = document.querySelector(".button-expand-large");
if (button) {
  button.addEventListener("click", () => {
    expandOrMinify();
  })
};

// ONCLICK NEW-CHAT-ICON - EXPAND NEW CHAT
let newChatButton = document.querySelector(".icon-new-chat-white");
if (newChatButton) {
  newChatButton.addEventListener("click", () => {
    expandNewChat();
  })
};

// ONCLICK SETTINGS-ICON - EXPAND SETTINGS
let settingsButton = document.querySelector(".icon-settings-white");
if (settingsButton) {
  settingsButton.addEventListener("click", () => {
    expandSettings();
  })
};

// ONCLICK ALL ICONS - TOGGLE ACTIVE
let toggleActiveIcons = document.querySelector(".sidebar-icons");
if (toggleActiveIcons) {
  toggleActiveIcons.addEventListener("click", () => {
    toggleActive();
  })
};


/* —————————————————————————————— */
/* —————————— CHATROOM —————————— */
/* —————————————————————————————— */

// ONCLICK BUTTON-EXPAND - SHOW OTHER USER INFORMATION
let headerExpand = document.querySelector('.button-expand-medium');
if (headerExpand) {
  headerExpand.addEventListener("click", () => {
    showQuestions();
  })
};

// ONCLICK AVATAR - SHOW USER INFORMATION
let chatTextAreaUser = document.querySelectorAll('.header-avatars-container img'), i;
for (let i = 0; i < chatTextAreaUser.length; i++) {
  chatTextAreaUser[i].addEventListener("click", () => {
    showUserQuestions();
  })
};

// ONCLICK TEXTAREA - EXPAND MESSAGE BOX
let chatTextArea = document.querySelector('#message_content');
if (chatTextArea) {
  chatTextArea.addEventListener("click", () => {
    moveUpChatbox();
  })
};

// ONCLICK [ENTER] - ENTER TO SUBMIT MESSAGE
let myForm = document.querySelector(".new_message");
let inputOkay = document.querySelector(".chat-message-box");

inputOkay.addEventListener("keydown", (event) => {
  console.log(event.shiftKey)
  if (event.shiftKey === false && event.keyCode === 13 ) {
    document.querySelector(".message-submit").click();
    inputOkay.value = "";
  };
});

