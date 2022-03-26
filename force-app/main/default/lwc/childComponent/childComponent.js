import { LightningElement, api } from "lwc";

export default class ChildComponent extends LightningElement {
  @api property = "world";

  constructor() {
    super();
    console.log(this.property);
  }

  log(event) {
    console.log("something happened");
    console.log(event.detail.fun);
    console.log(event.detail);
    console.dir(event.detail);
    event.detail.fun = "test";
    console.log("target: " + event.target.property);
    console.log("target: " + event.currentTarget.property);
  }
}
