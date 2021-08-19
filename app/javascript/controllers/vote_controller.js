import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['thumbsUpButton'];
  static classes = ['primary'];

  upvote() {
    console.log('In the upvote method');
    this.thumbsUpButtonTarget.classList.add(this.primaryClass);
  }
}
