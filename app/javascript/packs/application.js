import "bootstrap";
import { expandOrMinify } from "../components/sidebar";
import { expandNewChat } from "../components/sidebar";
import { expandSettings } from "../components/sidebar";
import { toggleActive } from "../components/sidebar";
import { expandedMessageBox } from "../components/chatbox";

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

let chatTextArea = document.querySelector('.create-message');
if (chatTextArea) {
  chatTextArea.addEventListener("click", () => {
    moveUpChatbox();
  })
};

