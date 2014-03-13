class MyClass {
    public static void hill(Integer[] v) {
    int K = 0, last = v[0];
for (int i = 1; i < v.length; ++i) {
    if (last >= v[i] + K) {
        int correction = (last - (v[i] + K)) / 2 + 1;
        K += correction;
        last -= correction;
        ++last;
    } else {

        if (last < v[i] - K) {
            last = v[i] - K;
        } else {
            ++last;
        }
    }
}
     System.out.println(K);
    }

}