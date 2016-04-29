public class Q2handler
{
  public static integer flag=1;
 
 public void clone(List<Account> lclone)
{
 List<Account> l=new List<Account>();
 l = lclone.deepClone();
 insert l;
}
}