<template>
  <div>API response: {{ response }}</div>
</template>

<script>
import { getMessage } from '@/api/hello'

export default {
  data() {
    return {
      response: ''
    }
  },

  async created() {
    const msg = await getMessage();
    this.response = msg;
  },
}


</script>
