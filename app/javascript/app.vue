<template>
  <div id="app">
    <div class="form">
      <div class="form__title">
        <input v-model="title" placeholder="タイトル" class="form-control">
      </div>
      <div class="form__comment">
        <input v-model="body" placeholder="コメント" class="form-control">
      </div>
      <button class="btn solid" @click="addMemo">メモを追加</button>
    </div>
    <div class="flex">
      <div v-for="memo in memos" :key="memo.id" class="card">
        <div class="card-body">
          <div class="card-title">
            {{ memo.title }}
          </div>
          {{ memo.body }}
          {{ memo.created_at }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos",
      title: "",
      body: "",
    }
  },
  mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function () {
      axios.get('/api/memos')
      .then(response => (
      this.memos = response.data
    ))
  },
  addMemo: function(){
    axios.post('/api/memos',{
      title: this.title,
      body: this.body
    })
    .then(response => (
      this.setMemo()
    ));
  }

 }
}
</script>
