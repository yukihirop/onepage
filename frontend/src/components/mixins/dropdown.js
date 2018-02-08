// 参考
// https://qiita.com/huigo/items/a888dcee8f46d62bb9e3
var listener = {
  methods: {
    listen: function (target, eventType, callback) {
      if (!this._eventRemovers) {
        this._eventRemovers = []
      }
      target.addEventListener(eventType, callback)
      this._eventRemovers.push({
        remove: function () {
          target.removeEventListener(eventType, callback)
        }
      })
    },
    destroyed: function () {
      if (this._eventRemovers) {
        this._eventRemovers.forEach(function (eventRemover) {
          eventRemover.remove()
        })
      }
    }
  }
}

module.exports = listener
