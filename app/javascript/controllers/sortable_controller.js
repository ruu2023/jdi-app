import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
import { put } from "@rails/request.js"

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this)
    })
  }

  onEnd(evt) {
		console.log(evt.item.dataset.sortableId)
		console.log(evt.newIndex)
    put(`/tasks/${evt.item.dataset.sortableId}/sort`, {
      body: JSON.stringify({row_order_position: evt.newIndex})
    })
  }
}
