// @flow
import pathToRegxp from 'path-to-regexp'
import client from '@/api/client'
import ApiResponseError from '@/api/api_response_error'

export default class Base {
  endpoints: Object
  client: Object

  constructor (endpoints: Object) {
    this.endpoints = endpoints
    this.client = client
  }

  onFulFilled (response: Object) {
    return response
  }

  onRejected (error: Object): Promise<Error> {
    return Promise.reject(new ApiResponseError(error))
  }

  index (params: Object) {
    var endpoint = this.endpoints.index
    var url = params ? pathToRegxp.compile(endpoint)(params) : endpoint
    return this.client.get(url).then(this.onFulFilled, this.onRejected)
  }

  show (params: Object) {
    const url = pathToRegxp.compile(this.endpoints.show)(params)
    return this.client.get(url).then(this.onFulFilled, this.onRejected)
  }

  create (params: Object) {
    const url = pathToRegxp.compile(this.endpoints.create)(params)
    return this.client.post(url, params).then(this.onFulFilled, this.onRejected)
  }

  update (params: Object) {
    const url = pathToRegxp.compile(this.endpoints.update)(params)
    return this.client.put(url, params).then(this.onFulFilled, this.onRejected)
  }

  destroy (params: Object) {
    const url = pathToRegxp.compile(this.endpoints.destroy)(params)
    return this.client.delete(url).then(this.onFulFilled, this.onRejected)
  }
}
