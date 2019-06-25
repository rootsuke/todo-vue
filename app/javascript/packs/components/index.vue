<template>
  <div>
    <!-- new task form -->
    <div class="row">
      <div class="col s10 m11">
        <input class="form-control" placeholder="Add your task!!">
      </div>
      <div class="col s2 m1">
        <div class="btn-floating waves-effect waves-light red">
          <i class="material-icons">add</i>
        </div>
      </div>
    </div>
    <!-- task list -->
    <div>
      <ul class="collection">
        <li v-for="task in tasks" v-if="!task.done" v-bind:id="'row_task_' + task.id" class="collection-item">
          <label v-bind:for="'task_' + task.id">
            <input type="checkbox" v-bind:id="'task_' + task.id" />
            <span>{{ task.name }}</span>
          </label>
        </li>
      </ul>
    </div>
    <!-- button to display finished tasks -->
    <div class="btn" v-on:click="displayFinishedTasks">Display finished tasks</div>
    <!-- finished task list -->
    <div id="finished-tasks" class="display_none">
      <ul class="collection">
        <li v-for="task in tasks" v-if="task.done"v-bind:id="'row_task_' + task.id" class="collection-item">
          <label v-bind:for="'task_' + task.id">
            <input type="checkbox" v-bind:id="'task_' + task.id" />
            <span>{{ task.name }}</span>
          </label>
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
        newTask: ''
      }
    },
    mounted: function () {
      this.fetchTasks();
    },
    methods: {
      fetchTasks: function () {
        axios.get('/api/tasks').then((response) => {
          for(var i = 0; i < response.data.tasks.length; i++) {
            this.tasks.push(response.data.tasks[i]);
          }
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
  .display_none {
    display:none;
  }
  .line-through {
    text-decoration: line-through;
  }
</style>
