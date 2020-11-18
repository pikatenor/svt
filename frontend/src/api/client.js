import axios from 'axios'

const baseURL = process.env.NODE_ENV === 'development'
  ? 'http://localhost:9292/'
  : location.origin

export default axios.create({
  baseURL: baseURL
})
