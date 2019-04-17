To add a Next button

$(document).on('click', 'next_topic', function(){
  let id = $(this).attr('data-id')
  <!-- fetch(`topics/${id}/next`) -->
  .then(resp => resp.json())
  .then(topics => {
    $('#topic_container').html('')
    let newTopic = new Topic(topic)
    let topicHtml = newTopic.newTopicForm()
    $('#topic_container').append(topicHtml)
  })
})

add to the form

 <button><a href="/topics/${this.id}/next" data-id="${this.id}" class="next_topic"> Next Topic</a></button>
