public class StringArrayTest 
{
    //Public Method
    public static List<string> generateStringArray(Integer n)
    {
        List<string> StringArray = new List<string>();
        for(Integer i=0; i<n; i++)
        {
            StringArray.add('Test ' +i);
            System.debug (StringArray[i]);
        }
            return StringArray;  
     }
}