import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/plataformShowToastEvent';
 
export default class NewCase extends LightningElement {

    handleSucess (event){

        const toast = new ShowToastEvent{
            title: 'Case Sucess Created';
            Message: 'Caso Criado com sucesso';
        }
    }
}