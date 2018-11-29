import "bootstrap";
import "../plugins/flatpickr";
import {TweenMax, Power2, TimelineLite} from "gsap/TweenMax";
import "./animation";
import "./flash-alert";

document.getElementById("modal-btn").addEventListener("click", (e) => {
  e.preventDefault()
  document.getElementById("new_fundraising_event").submit()
})
