package hxE.util;

import de.polygonal.ds.BitVector;

class BitVectorUtil {
    public static function contains(a: BitVector, b: BitVector): Bool {
        for(i in 0...Std.int(Math.min(a.numBits, b.numBits)))
            if(b.has(i) && !a.has(i))
                return false;
        return true;
    }
    public static function flip(a: BitVector): BitVector {
        for(i in 0...a.numBits)
            if(a.has(i))
                a.clear(i)
            else
                a.set(i);
        return a;
    }
}