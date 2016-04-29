public with sharing class DuplicateAccountNameHandlerNew//Handler Class for Trigger on Account
{
    public void duplicateCheckMethodBeforeInsert(list<Account> accountList)//Method for Checking Duplicate Before Insert
    {           
        String account,accountobj;
        if(accountList.size()>0)//Check Size of accountlist
        {       
            Set<String> setAccountName=new Set<String>();//Declare a set
            for(Account objAccount:accountList)//iterate through the list
            {
                account=objAccount.Name.toLowerCase();//Convert all account Names to lowercase 
                setAccountName.add(account);//add Names to a Set            
                    
            }
            system.debug('*****setAccountName: '+ setAccountName);  
            
            Set<String> setAccountNameObj=new Set<String>();//Declare another set
            for(Account objAccount:[Select Name from Account where Name IN:setAccountName])//select Names from Account which are present in the Set
            {
                accountobj=objAccount.Name.toLowerCase();//Convert all account Names to lowercase
                setAccountNameObj.add(accountobj);//add Names to a Set                                          
            }
            for(Account objAccount:accountList)
            {   
                if(setAccountNameObj.contains(objAccount.Name.toLowerCase()))//Check whether set contains the Name from the account list
                {
                    objAccount.addError('Account already exists!');//If yes Throw the error
                }
            }                   
        } 
        
     }
       
    /* public void duplicateCheckMethodBeforeUpdate(list<Account> accountlistNew)
     {  
        String account,accountobj;      
        list<Account> accountListOld=new list<Account>();//Declare a list for storing old Account Names     
        accountListOLd=[Select Name from Account];//select Names from Account
        
        Set<String> setAccountName=new Set<String>();//Declare a set
        system.debug('******acountListOld*****'+accountListOLd);
        system.debug('******acountListNew*****'+accountListNew);
        
        if(accountlistNew.size()>0)//Check Size of accountlistNew
        {
        for(Account objAccount:accountlistOld)//iterate through the list of old Account Names
        {
            account=objAccount.Name.toLowerCase();//Convert all account Names to lowercase
            setAccountName.add(account);//add Names to a Set
            
        }
        Set<String> setAccountNameObj=new Set<String>();//Declare new Set
        for(Account objAccount:[select Name from Account Where Name IN:setAccountName])
        {
                accountobj=objAccount.Name.toLowerCase();//Convert all account Names to lowercase
                setAccountNameObj.add(accountobj);//add Names to new Set                        
        }
        
        for(Account objAccount:accountListNew)//iterate through the account list
        {   
                if(setAccountNameObj.contains(objAccount.Name.toLowerCase()))//Check whether the updated value matches the previously existing value for Name
                {
                    objAccount.addError('Account already exists!');//Throw an Error
                }
        }                   
     
        
     
        
        
        
        
     }
     }*/   
}