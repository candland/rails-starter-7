import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['submenu']

  connect () {
    this.openMenu = false
    this.hide = this.hide.bind(this)
    this.closeMenu = this.closeMenu.bind(this)
    this.nevermind = this.nevermind.bind(this)
    this.hideMenus()
  }

  hideMenus () {
    this.submenuTarget.classList.add('hidden')
  }

  show (e) {
    e.preventDefault()

    this.submenuTarget.classList.remove('hidden')
    this.submenuTarget.addEventListener('mouseleave', this.closeMenu)
    this.submenuTarget.addEventListener('mouseenter', this.nevermind)

    this.openMenu = true
    this.closeMenu(null, 2000)
  }

  closeMenu (_e, timeout = 500) {
    this.closeTimeout = setTimeout(this.hide, timeout)
  }

  nevermind () {
    clearTimeout(this.closeTimeout)
  }

  hide (_e) {
    if (this.openMenu) {
      this.submenuTarget.classList.add('hidden')
      this.submenuTarget.removeEventListener('mouseleave', this.closeMenu)
      this.submenuTarget.removeEventListener('mouseenter', this.nevermind)
      this.openMenu = false
    }
  }
}
