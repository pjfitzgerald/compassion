import "bootstrap";
import { expandOrMinify } from "../components/sidebar";
import { scrollLastMessageIntoView } from "../components/scroll";






scrollLastMessageIntoView();


let button = document.querySelector(".button-expand-large");
if (button) {
  button.addEventListener("click", () => {
    expandOrMinify();
  })  
}



