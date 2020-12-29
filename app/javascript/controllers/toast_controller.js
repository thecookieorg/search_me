// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import 'bootstrap'

export default class extends Controller {
  connect() {
    console.log("Hello from toast controller")
  }

  showToast(event) {
    event.preventDefault();
    console.log('Map blah')
    $('.toast').toast('show')
    // let map = $('#restaurant_map');
    // console.log(`MAP HERE: ${map}`)
    // let toastElement = document.getElementById("restaurant_map");
    // toastElement.toast('show');
  }
}
