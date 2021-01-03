<template>
  <div id="app">
    <div class="form">
      <div class="form-group">
        <input v-model="title" placeholder="タイトル" class="form-control">
      </div>
      <div class="form-group">
        <input v-model="body" placeholder="コメント" class="form-control">
      </div>
      <button @click="createMemo" class="btn solid">メモを追加</button>
    </div>
    <div class="flex">
      <div v-for="(memo, index) in memos" :key="memo.id" class="card">
        <input type="checkbox" v-model="memo.is_done" @click="update(memo.id, index)" >
         <div v-bind:class="{linethrough : memo.is_done}" >
        <div class="card-body">
          <div class="card-title">


              {{ memo.title }}
          </div>
          {{ memo.body }}
       <span @click="deleteTask(memo.id, index)"><i class="fas fa-trash"></i></span>
       </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function(){
    return{
       memos: [],
       title: '',
       body: '',
    }
  },
  mounted(){
    this.fetchMemos();
  },
  methods: {
    fetchMemos: function () {
      axios.get('/api/memos').then((response) => {
        for(let i = 0; i < response.data.memos.length; i++) {
          this.memos.push(response.data.memos[i]);
        }
      }, (error) => {
        console.log(error, response);
      });
    },
    createMemo: function () {
      if(this.title == '') return;

      axios.post('/api/memos', { memo: { title: this.title ,body: this.body} }).then((response) => {
        this.memos.unshift(response.data);
        this.title = '';
        this.body = '';
      }, (error) => {
        console.log(error, response);
      });
    },
    update: function (memo_id) {
      axios.put('/api/memos/' + memo_id).then((response) => {
      }, (error) => {
        console.log(error);
      });
    },
    deleteMemo: function(memo_id, index){
      axios.delete('/api/memos/' + memo_id).then((response) => {
        this.memos.splice(index, 1);
      }, (error) => {
        console.log(error, response);
      });
    },
  }
}
</script>
  <style scoped>

  .linethrough{
     text-decoration: line-through;
     background: #000;
  }

</style>