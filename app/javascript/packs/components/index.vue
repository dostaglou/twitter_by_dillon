<template>
  <div>
    <ul v-for="tweet in tweets">
      <li>タイトル：　{{tweet.id}}</li>
      <li>内容：　{{tweet.content}}</li>
    </ul>
  </div>
</template>

<script>
import gql from 'graphql-tag'

const TWEETS_QUERY = gql`
query tweets{
  tweets {
    id
    content
  }
}`

export default {
  name: 'index',
  data () {
    return {
      tweets: []
    }
  },
  apollo: {
    tweets: {
      query:TWEETS_QUERY
    }
  }
}

</script>
