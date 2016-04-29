public class Q11
{
	public void find()
	{
list<lead> listLead= [Select l.Id, l.FirstName From Lead l where  l.Status='Open - Not Contacted'];
   
   for(Lead obj : listLead)
         
        {
         
         obj.Status='Working - Contacted';
         update obj;
            system.debug('Status changes as working for:'+obj);
        }
    }
}