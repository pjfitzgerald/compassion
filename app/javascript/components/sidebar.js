
// EXPAND/MINIFY MAIN SIDEBAR
function expandOrMinify() {
  var sidebarMinExp = document.querySelector(".navigation-container");
  sidebarMinExp.classList.toggle("sidebar-minify-expand");

  var buttonRotate = document.querySelector(".button-expand-large");
  buttonRotate.classList.toggle("button-rotate");

  var avatarScale = document.querySelector(".avatar-medium-user");
  avatarScale.classList.toggle("avatar-scale");

  var userNameHide = document.querySelector(".username");
  userNameHide.classList.toggle("username-hidden");

  var iconMovement = document.querySelectorAll(".sidebar-icons .icon"), i;
  for (let i = 0; i < iconMovement.length; i++) {
    iconMovement[i].classList.toggle("icon-move-left");
  };

  var sidebarText = document.querySelectorAll(".sidebar-text"), i;
  for (let i = 0; i < sidebarText.length; i++) {
    if (sidebarText[i].classList.contains("show")) {
      sidebarText[i].classList.toggle("show");
    } else {
      setTimeout(function timer(){
        sidebarText[i].classList.toggle("show");
      }, 100); // Change this for timer-delay
    };
  };

  var dashboardBodyMove = document.querySelector(".bodies"); // .dashboard-body
  dashboardBodyMove.classList.toggle("body-move-right");
};

// EXPAND - NEW CHAT
function expandNewChat() {
  var expandContainer = document.querySelector(".new-chat-content-container");
  expandContainer.classList.toggle("new-chat-layer-open");

  var expandContainer = document.querySelector(".icon-new-chat-white");
  expandContainer.classList.toggle("active");
};

// EXPAND - SETTINGS
function expandSettings() {
  var expandContainer = document.querySelector(".settings-content-container");
  expandContainer.classList.toggle("settings-layer-open");

  var addActive = document.querySelector(".icon-settings-white");
  addActive.classList.toggle("active");

  var rotateButton = document.querySelector(".icon-settings-white i");
  rotateButton.classList.toggle("button-rotate");
};

// TOGGLE ACTIVE
function toggleActive() {
  var toggleActive = document.querySelector(".sidebar-icons");
  toggleActive.classList.toggle("");
};


export { expandOrMinify, expandNewChat, expandSettings }
