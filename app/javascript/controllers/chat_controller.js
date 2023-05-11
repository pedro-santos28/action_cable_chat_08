import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  static targets = [ "messages", "input" ]

  connect() {
    const channel = this

    this.channel = consumer.subscriptions.create("ChatChannel", {
      received(data) {
        const html = channel.createMessageHTML(data)
        channel.messagesTarget.insertAdjacentHTML("beforeend", html)
        channel.inputTarget.value = ""
      }
    })
  }

  createMessageHTML(data) {
    return `
      <div class="chat-message">
        <span class="chat-message-sender">${data["sender"]}:</span> ${data["body"]}
      </div>
    `;
  }

  submit() {
    this.channel.send({ body: this.inputTarget.value })
  }
}
