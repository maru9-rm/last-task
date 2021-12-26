import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {

    const dataset = $('#article-show').data()
    const articleId = dataset.articleId
  
    axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        $('.comments-container').append(
          `<div class="article_user_info"><img src="${comment.user.comment_avatar}" class="avatar-image-mini"><div><p>${comment.user.user_name}</p><p>${comment.content}</p></div></div>`
        )
      })
    })

      
    $('.show-comment-form').on('click', () => {
      $('.show-comment-form').addClass('hidden')
      $('.comment-text-area').removeClass('hidden')
    })


    $('.add-comment-button').on('click', () => {
        const content = $('#comment_content').val()
        if (!content) {
          window.alert('コメントを入力してください')
        } else {
          axios.post(`/articles/${articleId}/comments`, {
            comment: {content: content}
          })
            .then((res) => {
              const comment = res.data
              $('.comments-container').append(
                `<div class="article_user_info"><img src="${comment.user.comment_avatar}" class="avatar-image-mini"><div><p>${comment.user.user_name}</p><p>${comment.content}</p></div></div>`
              )
              $('#comment_content').val('')
            })
        }
      })
  
  


  
})