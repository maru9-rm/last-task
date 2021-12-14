import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


document.addEventListener('DOMContentLoaded', () => {

    $('.article-show').each(function (index,element){
        const dataset = $(element).data()
        const articleId = dataset.articleId
        axios.get(`/articles/${articleId}/like`)
        .then((response) => {
          const hasLiked = response.data.hasLiked
          if (hasLiked) {
            $(`#active-heart${articleId}`).removeClass('hidden')
          } else {
            $(`#inactive-heart${articleId}`).removeClass('hidden')
          }
        })


$(`#active-heart${articleId}`).on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`#active-heart${articleId}`).addClass('hidden')
          $(`#inactive-heart${articleId}`).removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
})

$(`#inactive-heart${articleId}`).on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`#active-heart${articleId}`).removeClass('hidden')
          $(`#inactive-heart${articleId}`).addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
})


})

})