import { LightningElement , api ,wire,track} from 'lwc';
import getCasesList from '@salesforce/apex/MigrateCasesController.getCasesList';
import Subject_FIELD from '@salesforce/schema/Case.Subject';
import Status_FIELD from '@salesforce/schema/Case.Status';
import Origin_FIELD from '@salesforce/schema/Case.Origin';
import Priority_FIELD from '@salesforce/schema/Case.Priority';
import CaseNumber_FIELD from '@salesforce/schema/Case.CaseNumber';
const COLUMNS = [
    { label: 'Case Number', fieldName: CaseNumber_FIELD.fieldApiName, type: 'Auto Number' },
    { label: 'Subject', fieldName: Subject_FIELD.fieldApiName, type: 'text' },
    { label: 'Status', fieldName: Status_FIELD.fieldApiName, type: 'Picklist' },
    { label: 'Origin', fieldName: Origin_FIELD.fieldApiName, type: 'Picklist' },
    { label: 'Priority', fieldName: Priority_FIELD.fieldApiName, type: 'Picklist' }
];
export default class CaseList extends LightningElement {

    columns = COLUMNS;
     // Ensure changes are reactive when cases is updated
   cases;
  

  

     // Private var to track @api contactEmail
     _contactEmail = undefined;
 
     // Use set and get to process the value every time it's
     // requested while switching between contacts
     set contactEmail(value) {
         this._contactEmail = value;
       
     }
     
     // getter for contactEmail
     @api get contactEmail(){
         return this._contactEmail;
     }

     @wire(getCasesList, { Email: '$_contactEmail' })
     cases;

}