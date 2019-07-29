import "bootstrap";
import { expandOrMinify } from "../components/sidebar";
import { expandNewChat } from "../components/sidebar";
import { expandSettings } from "../components/sidebar";

// MAIN SIDEBAR - EXPAND/MINIFY
let button = document.querySelector(".button-expand-large");
if (button) {
  button.addEventListener("click", () => {
    expandOrMinify();
  })
};

// EXPAND ONGOING
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



