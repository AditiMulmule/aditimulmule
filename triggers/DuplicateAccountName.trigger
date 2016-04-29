trigger DuplicateAccountName on Account (before insert,before update)//Trigger on Account for duplicate Account Name Check
{
   DuplicateAccountNameHandler duplicateCheck=new DuplicateAccountNameHandler();//Creating an instance of Handler Class 
   if(trigger.isBefore && trigger.isInsert) //Check whether trigger is fired on before Insert
   {
        duplicateCheck.duplicateCheckMethodBeforeInsert(trigger.new); //Pass the recect Record to the Handler method to check duplication before insert
   }    
   
  /* if(trigger.isBefore && trigger.isUpdate) //Check whether trigger is fired on before Update
   {
        duplicateCheck.duplicateCheckMethodBeforeUpdate(trigger.new);//Pass the recect Record to the Handler method to check duplication before Update  
   }*/  
    
}