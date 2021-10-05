import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['thumbsUpButton', 'thumbsDownButton'];
  static classes = ['disabled'];
  static values = { billboard: Number };

  connect() {}

  upvote() {
    console.log('In the upvote method');
    this.thumbsUpButtonTarget.classList.add(this.disabledClass);
    this.thumbsDownButtonTarget.classList.remove(this.disabledClass);
    console.log(this.data);
    // console.log(this.event.dataset.id);
    var id = this.billboardValue;
    console.log('ID: ' + id);

    var $total = $(this).parent().siblings('.total_votes');
    var direction = $(this).data('direction');
    console.log('BB ID: ' + id);

    $.ajax({
      type: 'POST',
      url: '/billboards/' + id + '/vote',
      data: { direction: direction },
      success: function (response) {
        // console.log("Total : " + $total.text());
        // console.log(response);
        $total.text(response.vote_score);
        console.log('Vote Score : ' + response.vote_score);
      },
    });
  }

  downvote() {
    console.log('In the downvote method');
    this.thumbsDownButtonTarget.classList.add(this.disabledClass);
    this.thumbsUpButtonTarget.classList.remove(this.disabledClass);
  }
}

// make 2 different targets for up and down
// upon click of up, enable down and vice versa
