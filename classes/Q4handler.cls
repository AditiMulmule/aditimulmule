public class Q4handler
{
  public void createtask(Account a)
  {	
  Task obj =new Task();
  
  obj.WhatId=a.Id;
  obj.Subject = 'Meeting With ' + a.Name;
  insert obj;
  }
}