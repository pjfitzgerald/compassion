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
      }, 100); // CHANGE THIS FOR TIMER-DELAY
    };
  };

  var dashboardBodyMove = document.querySelector(".dashboard-body");
  dashboardBodyMove.classList.toggle("body-move-right");
};

export { expandOrMinify }
