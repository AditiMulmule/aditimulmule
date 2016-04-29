public with sharing class apexcamp {

   
public Campaign A { get; set; }

    public List<Campaign> results {get;set;}
    public String filterId {get;set;}
    private Id accountId;
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 2;
    
    public apexcamp(ApexPages.StandardController controller) {
 if(results == null){
            results = [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c Order by LastModifiedDate Desc LIMIT :LimitSize OFFSET :OffsetSize];
            totalRecs=results.size();
        }
    }


    public PageReference processRequests()
    {
       String previousSortField = 'c.Type';
        //write the query for getting the data based on filterId
        if (filterId == 'All Campaigns') {
            results = [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c Order by c.StartDate Desc];
        } 
        else if(filterId == 'My Active Campaigns' || filterId =='All Active Campaigns'){
            results = [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c  where c.IsActive = true Order by c.StartDate Desc]; 
        }
        else if(filterId =='Inactive Campaigns'){
         results = [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c where c.IsActive = false Order by c.StartDate Desc]; 
        }
        else if(filterId =='Recently Modified')
        {
        results = [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c Order by LastModifiedDate Desc];
        }
        return null;
    }
    
     public void FirstPage()
    {
        OffsetSize = 0;
    }
    public void previous()
    {
        OffsetSize = OffsetSize - LimitSize;
    }
    public void next()
    {
        OffsetSize = OffsetSize + LimitSize;
    }
    public void LastPage()
    {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
    }
    public boolean getprev()
    {
        if(OffsetSize == 0)
            return true;
        else
            return false;
    }
    public boolean getnxt()
    {
        if((OffsetSize + LimitSize) > totalRecs)
            return true;
        else
            return false;
    }

    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Recently Modified', 'Recently Modified'));
        options.add(new SelectOption('Inactive Campaigns', 'Inactive Campaigns'));
        options.add(new SelectOption('All Campaigns', 'All Campaigns'));
        options.add(new SelectOption('My Active Campaigns', 'My Active Campaigns'));
        options.add(new SelectOption('All Active Campaigns', 'All Active Campaigns'));
        return options;
    }
}