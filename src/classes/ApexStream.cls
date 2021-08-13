global class ApexStream {

    private final List<Object> objects;

    public static ApexStream getStream(List<Object> objects){
        return new ApexStream(objects);
    }

    private ApexStream(List<Object> objects){
        List<Object> clones = new List<Object>();
        clones.addAll(objects);
        this.objects=clones;
    }

    public List<Integer> toIntegerList(){
        List<Integer> integers = neW List<Integer>();
        for(Object obj : objects){
            integers.add((Integer) obj);
        }
        return integers;
    }

    public List<String> toStringList(){
        List<String> strings = new List<String>();
        for(Object obj : objects){
            strings.add((String) obj);
        }
        return strings;
    }

    public List<Object> toList(){
        return objects;
    }

    public ApexStream filter(Predicate predicate){
        for(Integer i=0; i<objects.size(); i++){
            if(!predicate.test(objects[i])){
                objects.remove(i);
                i--;
            }
        }
        return this;
    }

    public ApexStream mapper(Function function){
        for(Integer i=0; i<objects.size(); i++){
            objects[i] = function.apply(objects[i]);
        }

        return this;
    }

    public ApexStream filterChain(Predicate[] predicates){
        for(Integer i=0; i<objects.size(); i++){
            for(Predicate predicate : predicates){
                if(!predicate.test(objects[i])){
                    objects.remove(i);
                    i--;
                    break;
                }
            }
        }
        return this;
    }

    public ApexStream applyCompositionOfFunctions(Super_Function[] functions){
        for(Integer i=0; i<objects.size(); i++){
            for(Super_Function function : functions){
                if(function instanceof Predicate){
                    if(!((Predicate) function).test(objects[i])){
                        objects.remove(i);
                        i--;
                        break;
                    }
                }
                else if(function instanceof Function){
                    objects[i] = ((Function) function).apply(objects[i]);
                }
            }
        }

        return this;
    }
}