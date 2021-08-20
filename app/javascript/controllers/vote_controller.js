import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['thumbsUpButton', 'thumbsDownButton'];
  static classes = ['disabled'];
  static values = { billboard: Number };

  connect() {}

  upvote() {
    console.log('In the upvote method');
    this.thumbsUpButtonTarget.classList.add(this.disabledClass);
    console.log(this.data);
    // console.log(this.event.dataset.id);
    var id = this.billboardValue;
    console.log('ID: ' + id);
  }

  downvote() {
    console.log('In the downvote method');
    this.thumbsDownButtonTarget.classList.add(this.disabledClass);
  }
}

// make 2 different targets for up and down
// upon click of up, enable down and vv
