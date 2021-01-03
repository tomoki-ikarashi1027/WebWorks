<template>
  <div class="task">
    <div class="task__form">
      <input v-model="name" placeholder="コメントを入力して下さい">
      <span @click="createTask" ><i class="fas fa-plus-circle"></i></span>
    </div>
    <ul class="tasks1">
      <div v-for="(task, index) in tasks" :key="task.id" class="tasks1__item">
        <input type="checkbox" v-model="task.is_done" @click="update(task.id, index)" >
        <span v-bind:class="{display_none : task.is_done}" >{{ task.name }}</span>
      </div>
    </ul>
    <div class="btn solid" v-on:click="displayFinishedTasks">Finished Tasks</div>
    <div id="finished-tasks" class="display_none ">
      <ul class="tasks2">
        <li v-for="(task, index) in tasks" :key="task.id" v-if="task.is_done" v-bind:id="'row_task_' + task.id" class="tasks2__item">
           <div class="finished-box">
             <span>
              <input type="checkbox" v-model="task.is_done" @click="update(task.id, index)" id="check">
              <label  class="far fa-check-square" for="check"></label>
              <span v-bind:for="'task_' + task.id">{{ task.name }}</span>
             </span>
           <span @click="deleteTask(task.id, index)"><i class="fas fa-trash"></i></span>
           </div>
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
        tasks: [],
        name: '',
      }
    },
    mounted: function () {
      this.fetchTasks();
    },
    methods: {
      fetchTasks: function () {
        axios.get('/api/tasks').then((response) => {
          for(let i = 0; i < response.data.tasks.length; i++) {
            this.tasks.push(response.data.tasks[i]);
          }
        }, (error) => {
          console.log(error, response);
        });
      },
      createTask: function () {
        if(this.name == '') return;

        axios.post('/api/tasks', { task: { name: this.name } }).then((response) => {
          this.tasks.unshift(response.data);
          this.name = '';
        }, (error) => {
          console.log(error, response);
        });
      },
      deleteTask: function (task_id, index) {
        axios.delete('/api/tasks/' + task_id).then((response) => {
          this.tasks.splice(index, 1);
        }, (error) => {
          console.log(error, response);
        });
      },
      update: function (task_id) {
        axios.put('/api/tasks/' + task_id).then((response) => {
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

<style scoped>
  [v-cloak] {
      display: none;
    }

  input[type="checkbox"]{
    margin: 15px 0;
  }

  .task-about{
    border: 1px solid #ddd;
  }

</style>