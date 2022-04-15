import "package:merge_map_null_safety/merge_map.dart";

/// Map<K, V> mergeMap<K, V>(Iterable<Map<K, V>> maps, {bool recursive: true, bool acceptNull: false})
///
/// Merges the values of the given maps together.
///
/// `recursive` is set to `true` by default. If set to `true`,
/// then nested maps will also be merged. Otherwise, nested maps
/// will overwrite others.
///
/// `acceptNull` is set to `false` by default. If set to `false`,
/// then if the value on a map is `null`, it will be ignored, and
/// that `null` will not be copied.

main() {
    Map map1 = {'hello': 'world', 'bye': null};
    Map map2 = {'foo': {'bar': 'baz', 'this': 'will be overwritten'}};
    Map map3 = {'foo': {'john': 'doe', 'this': 'overrides previous maps'}};

    Map mergedWithNulls = mergeMap([map1, map2, map3], acceptNull: true);
    print(mergedWithNulls);
    // {hello: world, bye: null, foo: {bar: baz, john: doe, this: overrides previous maps}}

    Map mergedWithoutNulls = mergeMap([{}, map1]);
    print(mergedWithoutNulls);
    // {hello: world}
}
