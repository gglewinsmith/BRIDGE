import "bootstrap";
import "../plugins/flatpickr";

document.getElementById("modal-btn").addEventListener("click", (e) => {
  e.preventDefault()
  document.getElementById("new_fundraising_event").submit()
})
