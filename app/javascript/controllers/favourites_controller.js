import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites"
export default class extends Controller {
  static targets = ["like", "unlike"]
  connect() {
    console.log(this.likeTarget);
    console.log(this.unlikeTarget);
    console.log("test1");
  }

  toggle() {
   this.likeTarget.classList.toggle("d-none");
   this.unlikeTarget.classList.toggle("d-none");
   console.log(this.likeTarget);
   console.log(this.unlikeTarget);
  }
}
