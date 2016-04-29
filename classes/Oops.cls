public virtual class Oops
{
    integer a,b,c;
    public Oops()
    {
    	a=10;
    	b=5;
    	system.debug(a);
    }	
    
    public Oops(Integer c)
    {
       c=15;	
       system.debug(a);
    }

    public void func1(String s,Integer n1,Integer n2)
    {
    	integer n3; 
    	if(s.compareTo('SUM')==0)
    	{
    		n3=n1+n2;
    		system.debug(n3);
    	}
    	else if(s.compareTo('SUB')==0)
    	{
    		n3=n1-n2;
    		system.debug(n3);
    	}
    	else if(s.compareTo('MUL')==0)
    	{
    		n3=n1*n2;
    		system.debug(n3);
    	}
    	else
    	{
    		n3=n1/n2;
    		system.debug(n3);
    	}
    } 
    
     public static void func2()
    {
    	system.debug('Hello World');
    }
    
    public  virtual void func3()
    {
    	integer a=7;
    	system.debug('Hello World');
    	
    }
    
}