import { LightningElement,wire } from 'lwc';
import getContactList from '@salesforce/apex/MigrateCasesController.getContactList';
export default class ContactList extends LightningElement {
    @wire(getContactList) contacts;

    handleContactClick(evt) {
        // This component wants to emit a contactselected event to its parent
        const event = new CustomEvent('contactselected', {
            detail: evt.detail
        });
        // Fire the event from c-contact-list
        this.dispatchEvent(event);
    }
}



