import "bootstrap";
import { expandOrMinify, expandNewChat, expandSettings, toggleActive } from "../components/sidebar";
import { moveUpChatbox, showQuestions } from "../components/chatbox";


/* —————————————————————————————— */
/* ——————————— SIDEBAR —————————— */
/* —————————————————————————————— */

// MAIN SIDEBAR - EXPAND/MINIFY
let button = document.querySelector(".button-expand-large");
if (button) {
  button.addEventListener("click", () => {
    expandOrMinify();
  })
};

// EXPAND NEW CHAT
let newChatButton = document.querySelector(".icon-new-chat-white");
if (newChatButton) {
  newChatButton.addEventListener("click", () => {
    expandNewChat();
  })
};

// EXPAND SETTINGS
let settingsButton = document.querySelector(".icon-settings-white");
if (settingsButton) {
  settingsButton.addEventListener("click", () => {
    expandSettings();
  })
};

// TOGGLE ACTIVE
let toggleActiveIcons = document.querySelector(".sidebar-icons");
if (toggleActiveIcons) {
  toggleActiveIcons.addEventListener("click", () => {
    toggleActive();
  })
};


/* —————————————————————————————— */
/* —————————— CHATROOM —————————— */
/* —————————————————————————————— */

// EXPAND HEADER
let headerExpand = document.querySelector('.button-expand-medium');
if (headerExpand) {
  headerExpand.addEventListener("click", () => {
    showQuestions();
  })
};

// EXPAND MESSAGE BOX
let chatTextArea = document.querySelector('#message_content');
if (chatTextArea) {
  chatTextArea.addEventListener("click", () => {
    moveUpChatbox();
  })
};

// CLICK ENTER TO SUBMIT (<textarea>)
let myForm = document.querySelector(".new_message");
let inputOkay = document.querySelector(".chat-message-box");

inputOkay.addEventListener("keyup", (event) => {
  if (event.code === "Enter") {
    document.querySelector(".message-submit").click();
    inputOkay.value = "";
  };
});

