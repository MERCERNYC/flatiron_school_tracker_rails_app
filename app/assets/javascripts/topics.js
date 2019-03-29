// $(function() {
//  console.log('topics.js loading')
// });

$(document).ready(() => {
 alert("yo!")
 listTopics()
 alert("You go girl! ")
 getTopicsIndex()
 postTopicsShow()
})

//or use function with no arrow
// function listTopics (){}
const listTopics = () => {
  $('.topics_data').on('click', function(event){
    event.preventDefault()
    history.pushState(null, null, 'topics')
    // getTopics()
    fetch(`/topics.json`)
    .then(resp => resp.json())
    .then(topics => {
      $('#topic_container').html('')
      topics.forEach(topic => {
        let newTopic = new Topic(topic)
        let topicHtml = newTopic.formatTopic()
        $('#topic_container').append(topicHtml)
      })
    })
  })
}

function Topic(topic) {
  this.id= topic.id
  this.timeline = topic.timeline
  this.title = topic.title
  this.lab = topic.lab
  this.study_group = topic.study_group
}

Topic.prototype.formatTopic = function(){
  let topicHtml = `

  <tr>
    <td><a href="/topics/${this.timeline}" data-id="${this.id}" </a></td>
  </tr>

    `
    return topicHtml
}
