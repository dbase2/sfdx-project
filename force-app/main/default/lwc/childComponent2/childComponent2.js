import { LightningElement, api } from "lwc";

export default class ChildComponent2 extends LightningElement {
  @api property = "value";

  doSomething() {
    this.dispatchEvent(new CustomEvent('something', {detail: {fun: "yes"}}));
  }

  connectedCallback(){
      console.log(this.property);
  }
  renderedCallback(){
      console.log(this.property);
  }
}
