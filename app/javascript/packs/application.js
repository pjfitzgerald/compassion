import "bootstrap";
import { expandOrMinify } from "../components/sidebar";
import { scrollLastMessageIntoView } from "../components/scroll";









let button = document.querySelector(".button-expand-large");
button.addEventListener("click", () => {
  expandOrMinify();
})



