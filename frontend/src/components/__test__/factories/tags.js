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
            "id": 1,
            "name": "Python",
            "created_at": "2018-03-03 12:28:31.55447",
            "updated_at": "2018-03-03 12:28:31.55447",
            "post_taggings": "[{\"id\":1,\"post_id\":1,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.595688\",\"updated_at\":\"2018-03-03T12:28:31.595688\"},{\"id\":11,\"post_id\":2,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.64464\",\"updated_at\":\"2018-03-03T12:28:31.64464\"},{\"id\":21,\"post_id\":3,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.669497\",\"updated_at\":\"2018-03-03T12:28:31.669497\"},{\"id\":31,\"post_id\":4,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.693023\",\"updated_at\":\"2018-03-03T12:28:31.693023\"},{\"id\":41,\"post_id\":5,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.715475\",\"updated_at\":\"2018-03-03T12:28:31.715475\"},{\"id\":51,\"post_id\":6,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.739792\",\"updated_at\":\"2018-03-03T12:28:31.739792\"},{\"id\":61,\"post_id\":7,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.763112\",\"updated_at\":\"2018-03-03T12:28:31.763112\"},{\"id\":71,\"post_id\":8,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.788812\",\"updated_at\":\"2018-03-03T12:28:31.788812\"},{\"id\":81,\"post_id\":9,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.811032\",\"updated_at\":\"2018-03-03T12:28:31.811032\"},{\"id\":91,\"post_id\":10,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.834244\",\"updated_at\":\"2018-03-03T12:28:31.834244\"},{\"id\":101,\"post_id\":11,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.858902\",\"updated_at\":\"2018-03-03T12:28:31.858902\"},{\"id\":111,\"post_id\":12,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.88074\",\"updated_at\":\"2018-03-03T12:28:31.88074\"},{\"id\":121,\"post_id\":13,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.903868\",\"updated_at\":\"2018-03-03T12:28:31.903868\"},{\"id\":131,\"post_id\":14,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.927788\",\"updated_at\":\"2018-03-03T12:28:31.927788\"},{\"id\":141,\"post_id\":15,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.951235\",\"updated_at\":\"2018-03-03T12:28:31.951235\"},{\"id\":151,\"post_id\":16,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.973496\",\"updated_at\":\"2018-03-03T12:28:31.973496\"},{\"id\":161,\"post_id\":17,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:31.999372\",\"updated_at\":\"2018-03-03T12:28:31.999372\"},{\"id\":171,\"post_id\":18,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.028966\",\"updated_at\":\"2018-03-03T12:28:32.028966\"},{\"id\":181,\"post_id\":19,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.051649\",\"updated_at\":\"2018-03-03T12:28:32.051649\"},{\"id\":191,\"post_id\":20,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.075381\",\"updated_at\":\"2018-03-03T12:28:32.075381\"},{\"id\":201,\"post_id\":21,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.097778\",\"updated_at\":\"2018-03-03T12:28:32.097778\"},{\"id\":211,\"post_id\":22,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.121571\",\"updated_at\":\"2018-03-03T12:28:32.121571\"},{\"id\":221,\"post_id\":23,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.143731\",\"updated_at\":\"2018-03-03T12:28:32.143731\"},{\"id\":231,\"post_id\":24,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.166589\",\"updated_at\":\"2018-03-03T12:28:32.166589\"},{\"id\":241,\"post_id\":25,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.190477\",\"updated_at\":\"2018-03-03T12:28:32.190477\"},{\"id\":251,\"post_id\":26,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.212499\",\"updated_at\":\"2018-03-03T12:28:32.212499\"},{\"id\":261,\"post_id\":27,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.234383\",\"updated_at\":\"2018-03-03T12:28:32.234383\"},{\"id\":271,\"post_id\":28,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.257534\",\"updated_at\":\"2018-03-03T12:28:32.257534\"},{\"id\":281,\"post_id\":29,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.279362\",\"updated_at\":\"2018-03-03T12:28:32.279362\"},{\"id\":291,\"post_id\":30,\"tag_id\":1,\"created_at\":\"2018-03-03T12:28:32.301243\",\"updated_at\":\"2018-03-03T12:28:32.301243\"}]",
            "post_count": 30
          },
          {
            "id": 2,
            "name": "JavaScript",
            "created_at": "2018-03-03 12:28:31.55798",
            "updated_at": "2018-03-03 12:28:31.55798",
            "post_taggings": "[{\"id\":2,\"post_id\":1,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.602365\",\"updated_at\":\"2018-03-03T12:28:31.602365\"},{\"id\":12,\"post_id\":2,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.646837\",\"updated_at\":\"2018-03-03T12:28:31.646837\"},{\"id\":22,\"post_id\":3,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.671572\",\"updated_at\":\"2018-03-03T12:28:31.671572\"},{\"id\":32,\"post_id\":4,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.695003\",\"updated_at\":\"2018-03-03T12:28:31.695003\"},{\"id\":42,\"post_id\":5,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.717448\",\"updated_at\":\"2018-03-03T12:28:31.717448\"},{\"id\":52,\"post_id\":6,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.741734\",\"updated_at\":\"2018-03-03T12:28:31.741734\"},{\"id\":62,\"post_id\":7,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.765136\",\"updated_at\":\"2018-03-03T12:28:31.765136\"},{\"id\":72,\"post_id\":8,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.791231\",\"updated_at\":\"2018-03-03T12:28:31.791231\"},{\"id\":82,\"post_id\":9,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.813426\",\"updated_at\":\"2018-03-03T12:28:31.813426\"},{\"id\":92,\"post_id\":10,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.836774\",\"updated_at\":\"2018-03-03T12:28:31.836774\"},{\"id\":102,\"post_id\":11,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.860989\",\"updated_at\":\"2018-03-03T12:28:31.860989\"},{\"id\":112,\"post_id\":12,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.883142\",\"updated_at\":\"2018-03-03T12:28:31.883142\"},{\"id\":122,\"post_id\":13,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.906682\",\"updated_at\":\"2018-03-03T12:28:31.906682\"},{\"id\":132,\"post_id\":14,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.93032\",\"updated_at\":\"2018-03-03T12:28:31.93032\"},{\"id\":142,\"post_id\":15,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.953729\",\"updated_at\":\"2018-03-03T12:28:31.953729\"},{\"id\":152,\"post_id\":16,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:31.975854\",\"updated_at\":\"2018-03-03T12:28:31.975854\"},{\"id\":162,\"post_id\":17,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.004096\",\"updated_at\":\"2018-03-03T12:28:32.004096\"},{\"id\":172,\"post_id\":18,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.030831\",\"updated_at\":\"2018-03-03T12:28:32.030831\"},{\"id\":182,\"post_id\":19,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.053464\",\"updated_at\":\"2018-03-03T12:28:32.053464\"},{\"id\":192,\"post_id\":20,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.078002\",\"updated_at\":\"2018-03-03T12:28:32.078002\"},{\"id\":202,\"post_id\":21,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.10018\",\"updated_at\":\"2018-03-03T12:28:32.10018\"},{\"id\":212,\"post_id\":22,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.123302\",\"updated_at\":\"2018-03-03T12:28:32.123302\"},{\"id\":222,\"post_id\":23,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.146\",\"updated_at\":\"2018-03-03T12:28:32.146\"},{\"id\":232,\"post_id\":24,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.169351\",\"updated_at\":\"2018-03-03T12:28:32.169351\"},{\"id\":242,\"post_id\":25,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.192323\",\"updated_at\":\"2018-03-03T12:28:32.192323\"},{\"id\":252,\"post_id\":26,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.214751\",\"updated_at\":\"2018-03-03T12:28:32.214751\"},{\"id\":262,\"post_id\":27,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.237289\",\"updated_at\":\"2018-03-03T12:28:32.237289\"},{\"id\":272,\"post_id\":28,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.259582\",\"updated_at\":\"2018-03-03T12:28:32.259582\"},{\"id\":282,\"post_id\":29,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.281467\",\"updated_at\":\"2018-03-03T12:28:32.281467\"},{\"id\":292,\"post_id\":30,\"tag_id\":2,\"created_at\":\"2018-03-03T12:28:32.303196\",\"updated_at\":\"2018-03-03T12:28:32.303196\"}]",
            "post_count": 30
          }
      ]
    }
  }
}