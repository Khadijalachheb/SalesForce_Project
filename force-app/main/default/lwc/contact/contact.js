import ImportCasesList from '@salesforce/apex/MigrateCasesController.ImportCasesList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { LightningElement , api } from 'lwc';

export default class Contact extends LightningElement {
    @api contact;

    ImportClick() {
        if(this.contact.Email !=undefined) {
       ImportCasesList({Email:this.contact.Email}) .then(result => {
           if(result == true){
            const evt = new ShowToastEvent({
                title: 'Cases imported from the remote org',
                variant :'success',
                
            });
            this.dispatchEvent(evt);}
            else{

                    const evt = new ShowToastEvent({
                        title: 'No cases in the remote org to import',
                        variant :'warning',
                        
                    });
                    this.dispatchEvent(evt);}
            }
        )
        .catch(error => {
           
        });
    }
    else{
        const evt = new ShowToastEvent({
            title: 'This contact does not have an email',
            variant :'warning',
            
        });
        this.dispatchEvent(evt);
    }
    }

    contactclick(){
        
        const event = new CustomEvent('contactclick', {
            // detail contains only primitives
            detail: this.contact.Email
        });
        // Fire the event from c-contact
        this.dispatchEvent(event);
    }
}



