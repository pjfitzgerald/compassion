import "bootstrap";
import { expandOrMinify } from "../components/sidebar";


let button = document.querySelector(".button-expand-large");
if (button) {
  button.addEventListener("click", () => {
    expandOrMinify();
  })
}



