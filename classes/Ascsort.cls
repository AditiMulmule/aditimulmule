public class Ascsort
{
public void ascsort(Integer[] num)
    {
      integer i,j,temp=0;
      for(i=0;i<num.size();i++)
      {
       for(j=i+1;j<num.size();j++)
       {
        if(num[i]>num[j])
        {
         temp=num[i];
         num[i]=num[j];
         num[j]=temp;
        } 
       }
      }
      system.debug('The Ascending order is : ');
      for(i=0;i<num.size();i++)
      { 
       system.debug(' '+num[i]);
      }
    }
    
    public void desort(Integer[] num)
    {
      integer i,j,temp=0;
      for(i=0;i<num.size();i++)
      {
       for(j=i+1;j<num.size();j++)
       {
        if(num[i]<num[j])
        {
         temp=num[i];
         num[i]=num[j];
         num[j]=temp;
        } 
       }
      }
      system.debug('The Descending  order is : ');
      for(i=0;i<num.size();i++)
      { 
       system.debug(' '+num[i]);
      }
    }
    
    public void max(Integer[] num)
    {
         integer i,j,temp=0;
         for(i=0;i<num.size();i++)
      {
       for(j=i+1;j<num.size();j++)
       {
        if(num[i]<num[j])
        {
         temp=num[i];
         num[i]=num[j];
         num[j]=temp;
        } 
       }
      }
      system.debug('Max number is:'+num[i]);
      }
    
    
    public void min(Integer[] num)
    {
      integer i,j,temp=0;
      for(i=0;i<num.size();i++)
      {
       for(j=i+1;j<num.size();j++)
       {
        if(num[i]>num[j])
        {
         temp=num[i];
         num[i]=num[j];
         num[j]=temp;
        } 
       }
      }
      system.debug('The Min number is : ');
    
    
       system.debug(' '+num[i]);
      
    }

public void duplicate(Integer[] num)
{
    integer i,j,temp=0,count=0;
      for(i=0;i<num.size();i++)
      {
           count=0;
       for(j=i+1;j<num.size();j++)
       {
           if(num[i]==num[j])
           {
               count++;
           }
           
           system.debug(num[i] +':'+count);
}
}
}
}