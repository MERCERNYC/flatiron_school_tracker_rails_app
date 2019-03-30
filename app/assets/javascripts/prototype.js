//Method on the prototype for JS objects

//INDEX
Topic.prototype.renderIndex = function() {
  let topicHtml = `

   <tr>
      <td><a href="/topics/${this.id}" data-id="${this.id}" class="show_topics"><h1>${this.title}</h1></a></td>
      <td><button><a href="/topics/${this.id}/edit" data-id="${this.id}" class="update_topic"> Edit</a></button></td>
      <td><button><a href="/topics/${this.id}" data-id="${this.id}" class="delete_topic" data-method="delete">Delete</a></button></td>
    </tr>
    `
  return topicHtml
}

//SHOW
Topic.prototype.renderShow = function() {
  let topicHtml = `

  <h1>Topic Created</h1>

  <tr>
   <td><strong>Timeline:</strong> ${this.timeline}</td></br>
   <td><strong>Title:</strong> ${this.title}</td></br>
   <td><strong>Lab:</strong> ${this.lab}</td></br>
   <td><strong>Study Group:</strong> ${this.study_group}</td></br>
  </tr>

  <button><a href="/topics" class="topic_index">Back to All Topics</a></button>

  `
  return topicHtml
}
