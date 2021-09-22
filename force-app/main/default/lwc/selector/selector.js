import { LightningElement } from 'lwc';

export default class Selector extends LightningElement {
    selectedContactEmail;
    handleContactSelected(evt) {
        this.selectedContactEmail = evt.detail;
    }
}