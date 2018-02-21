import axios from 'axios'

export default axios.create({
  baseURL: 'http://localhost/3000/api/v1/',
  timeout: 2000,
  withCredentials: true,
  headers: {
    'Content=Type': 'application/json'
  }
})
