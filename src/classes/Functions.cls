public with sharing class Functions {

    public class mapIntegerToString implements Function{
       public Object apply(Object obj){
           return String.valueOf((Integer) obj);
       }
    }
}