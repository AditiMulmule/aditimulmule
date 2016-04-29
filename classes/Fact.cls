public class Fact {

    integer n,factorial=1;
    public void fact(integer n)
    {
        if(n<1)
        {
            system.debug('Number is negative');
        }
        else if(n==1)
        {
            system.debug('Factorial is = 0 ');
        }
        else
        {
            for(integer i=1;i<=n;i++)
            {
                factorial=factorial*i;
            }
        }
            
    }
}