import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect () {
    this.timeout = window.setTimeout(() => {
      this.close()
    }, 6000)
  }

  close () {
    this.element.classList.add('opacity-0')

    window.setTimeout(() => {
      if (this.element.parentNode !== null) {
        this.element.parentNode.removeChild(this.element)
      }
    }, 1000)
  }

  disconnect () {
    if (this.timeout) {
      window.clearTimeout(this.timeout)
    }
  }
}
