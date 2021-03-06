import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/plataformShowToastEvent';
 
export default class NewCase extends LightningElement {


    handleSuccess (event) {

        const toast = new ShowToastEvent({
            title: 'Case Success Created',
            message: 'Caso criado com sucesso!!!! ;)'
        });
        
        this.dispatchEvent(toast);

    }

}