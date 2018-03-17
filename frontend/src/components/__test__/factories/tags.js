export default {
  data() {
    return {
        tagImageSrcs: [
          require("@/assets/home/tag/Python.jpg"),
          require("@/assets/home/tag/JavaScript.jpg"),
          require("@/assets/home/tag/Ruby.jpg"),
          require("@/assets/home/tag/AWS.jpg"),
          require("@/assets/home/tag/Android.jpg"),
          require("@/assets/home/tag/Docker.png"),
          require("@/assets/home/tag/Swift.png"),
          require("@/assets/home/tag/iOS.png"),
          require("@/assets/home/tag/Rails.jpg"),
          require("@/assets/home/tag/PHP.jpg")
        ],
        tags: [
          {
            "name": "Python",
            "post_taggings_count": 30
          },
          {
            "name": "JavaScript",
            "post_taggings_count": 30
          }
      ]
    }
  }
}
