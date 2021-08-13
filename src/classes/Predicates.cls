public with sharing class Predicates {

    public class moreThan5Predicate implements Predicate{
        public Boolean test(Object obj){
            return ((Integer) obj ) > 5;
        }
    }

    public class lessThan20 implements Predicate{
        public Boolean test(Object obj){
            return ((Integer) obj ) < 20;
        }
    }
}