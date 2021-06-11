import consumer from "./consumer"

consumer.subscriptions.create("CardsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data.method == 'create') {
      document.getElementById('cards').innerHTML += `<div id="${data.identifier}" class="card col col-12 mb-2" style="width: 18rem;">
                                                      <div class="card-body">
                                                        <h5 class="card-title shop-name">${data.shop}</h5>
                                                        <h5 class="card-title"> ${data.name}</h5>
                                                        <h6 class="card-subtitle mb-2 text-muted">Skladem:  ${data.stock}</h6>
                                                        <p class="card-text">Cena:  ${data.price}</p>
                                                        <a href="${data.link}" class="btn btn-outline-primary">Odkaz do obchodu</a>
                                                      </div>
                                                    </div>`
    } else {
      let el = document.getElementById(`${data.identifier}`);
      if (el) {
        el.remove();
      }
    }
  }
});
