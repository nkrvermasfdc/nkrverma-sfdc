import { LightningElement, track } from 'lwc';

export default class EmployeeDetail extends LightningElement {
    @track name = 'Neeraj';
    @track age = 10;
    @track salary = 22334455;

    nameHandler(event){
        this.name = event.traget.value;
    }

    ageHandler(event){
        this.age = event.traget.value;
    }

    salaryHandler(event){
        this.salary = event.traget.value;
    }

}