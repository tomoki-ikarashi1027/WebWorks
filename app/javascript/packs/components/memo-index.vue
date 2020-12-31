<template>
  <div class="memo">
    <div class="memo__form">
      <input v-model="body" placeholder="コメントを入力して下さい">
      <span @click="createTask" ><i class="fas fa-plus-circle"></i></span>
    </div>
    <ul class="memos1">
      <div v-for="(memo, index) in memos" :key="memo.id" class="memos1__item">
        <input type="checkbox" v-model="memo.is_done" @click="update(memo.id, index)" id="test2" >
        <span v-bind:class="{display_none : memo.is_done}" >{{ memo.body }}</span>
      </div>
    </ul>
    <div class="btn solid" v-on:click="displayFinishedTasks">Finished Tasks</div>
    <div id="finished-tasks" class="display_none finished-box">
      <ul class="memos2">
        <li v-for="(memo, index) in memos" :key="memo.id" v-if="memo.is_done" v-bind:id="'row_memo_' + memo.id" class="memos2__item">
           <!-- <input type="checkbox" v-bind:id="'memo_' + memo.id" checked="checked" /> -->
           <input type="checkbox" v-model="memo.is_done" @click="update(memo.id, index)" id="test">
           <label  class="far fa-check-square" for="test"></label>
           <!-- <i class="far fa-check-circle"></i> -->
           <span v-bind:for="'memo_' + memo.id">{{ memo.body }}</span>
           <span @click="deleteTask(memo.id, index)"><i class="fas fa-trash"></i></span>
         </li>
      </ul>
    </div>
  </div>
</template>
<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        memos: [],
        body: '',
      }
    },
    mounted: function () {
      this.fetchTasks();
    },
    methods: {
      fetchTasks: function () {
        axios.get('/api/memos').then((response) => {
          for(let i = 0; i < response.data.memos.length; i++) {
            this.memos.push(response.data.memos[i]);
          }
        }, (error) => {
          console.log(error, response);
        });
      },
      createTask: function () {
        if(this.body == '') return;

        axios.post('/api/memos', { memo: { title: this.title, body: this.body } }).then((response) => {
          this.memos.unshift(response.data);
          this.body = '';
        }, (error) => {
          console.log(error, response);
        });
      },
      deleteTask: function (memo_id, index) {
        axios.delete('/api/memos/' + memo_id).then((response) => {
          this.memos.splice(index, 1);
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
      displayFinishedTasks: function() {
        document.querySelector('#finished-tasks').classList.toggle('display_none');
     },
    }
  }
</script>

<style lang="scss" scoped>
.memo{
  &__form{
    text-align: center;
    & > input{
    font-size: 16px;
    width: 70%;
    border: none;
    outline: none;
    padding-bottom: 8px;
    margin-bottom: 50px;
    border-bottom: 1px solid#ddd;
    margin-top: 30px;
    }

    & .fa-plus-circle{
    font-size: 3em;
    color: brown;
    cursor: pointer;
    }
  }
}

[v-cloak] {
    display: none;
  }
  .display_none {
    display:none;
  }

  ul{
    list-style: none;
    padding: 0;
  }

.memos1{
  border: 1px solid #ddd;
  margin: 0;
  &__item{
    width: 95%;
    margin: 0 auto;
    font-size: 1.5em;
  }

  & input[type="checkbox"]:checked{
    display: none;
  }

  & .display_none　 {
    display: none;
  }
}

.memos2{
  @extend .memos1;

  &__item{
    width: 95%;
    margin: 0 auto;
    font-size: 1.5em;
    color: rgba(0,0,0,0.5);
    &:hover{
      color:black;
    }
  }

  & .fa-trash{
    cursor: pointer;
    color: firebrick;
    margin-left: 15px;
    margin: 15px 0;
  }
}

input[type="checkbox"]{
    margin: 15px 0;
  }

.solid{
  margin: 20px 0;
}

</style>