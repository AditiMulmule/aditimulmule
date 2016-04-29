public class PaginationController 
{
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
        }
        set;
    }
    
    public PageReference last() {
    setCon.last();
        return null;
    }


    public PageReference next() {

                      setCon.next();
        return null;
    }


    public PageReference previous() {
        setCon.previous();
        return null;
    }


    public PageReference first() {
                   setCon.first();
        return null;
    }


   

    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, Phone,Rating FROM Account]));
            }
            setCon.setPageSize(5);
            return setCon;
        }
        set;
    }
    
    
    public List<Account> getlistAccount()
    {
        return (List<Account>) setCon.getRecords();
    }            
    
}