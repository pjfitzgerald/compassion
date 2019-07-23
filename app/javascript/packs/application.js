import "bootstrap";
import { expandOrMinify } from "../components/sidebar";

let button = document.querySelector(".button-expand-large");
button.addEventListener("click", () => {
  expandOrMinify();
})
