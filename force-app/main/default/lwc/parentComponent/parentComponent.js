import { LightningElement, track } from 'lwc';

export default class ParentComponent extends LightningElement {
    input = 'world';

    handleChange(event){
        this.input = event.target.value;
    }

    testik(){
        try{
        console.log('kek');
        } catch(exception) {
            console.log('exception');
        }
      // console.log(testik);
    }
}