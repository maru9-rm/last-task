import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()




const handleRelationshipDisplay = (hasFollowed) => {
  if (hasFollowed) {
    $('.unfollow_button').removeClass('hidden')
  } else {
    $('.follow_button').removeClass('hidden')
  }
}
document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#account-show').data()
  const accountId = dataset.accountId
  const relationshipId = dataset.relationshipId
  const count_dataset = $('#follower_count').data()
  var followerCount = count_dataset.followerCount 

  axios.get(`/accounts/${accountId}/follows/${relationshipId}`)
    .then((response) => {
      const hasFollowed = response.data.hasFollowed
      handleRelationshipDisplay(hasFollowed)
    })

  
  $('.unfollow_button').on('click', () => {
    axios.post(`/accounts/${accountId}/unfollows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.follow_button').removeClass('hidden')
          $('.unfollow_button').addClass('hidden')
          followerCount = followerCount - 1
          $('#follower_count').text(`${followerCount}`)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.follow_button').on('click', () => {
    axios.post(`/accounts/${accountId}/follows`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.follow_button').addClass('hidden')
          $('.unfollow_button').removeClass('hidden')
          followerCount = followerCount + 1
          $('#follower_count').text(`${followerCount}`)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })





})
