import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-reviews"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    console.log("test6")
  }
  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }


}
// send(event) {
//   // [...]

//   fetch(this.formTarget.action, {
//     method: "POST",
//     headers: { "Accept": "application/json" },
//     body: new FormData(this.formTarget)
//   })
//     .then(response => response.json())
//     .then((data) => {
//       if (data.inserted_item) {
//         this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
//       }
//       this.formTarget.outerHTML = data.form
//     })
// }
