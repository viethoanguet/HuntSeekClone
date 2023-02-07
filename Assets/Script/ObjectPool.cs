using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class ObjectPool
{
    public static Dictionary<Type, object> poolingMap = new Dictionary<Type, object>();
    public static Dictionary<string, object> poolingMapStr = new Dictionary<string, object>();
    public static T Get<T>(Type keyType)
    {
        if (poolingMap.ContainsKey(keyType))
        {
            Queue<object> pool = poolingMap[keyType] as Queue<object>;
            if (pool.Count > 0)
                return (T)pool.Dequeue();
        }

        return default(T);
    }
    public static T Get<T>(string keyStr)
    {
        if (poolingMapStr.ContainsKey(keyStr))
        {
            Stack<object> pool = poolingMapStr[keyStr] as Stack<object>;
            if (pool.Count > 0)
                return (T)pool.Pop();
        }
        return default(T);
    }


    public static void Set(Type key, object value)
    {
        if (poolingMap.ContainsKey(key))
        {
            Queue<object> pool = poolingMap[key] as Queue<object>;
            pool.Enqueue(value);
        }
        else
        {
            Queue<object> pool = new Queue<object>();
            pool.Enqueue(value);
            poolingMap.Add(key, (object)pool);
        }
    }
    public static void Set(string keyStr, object value)
    {
        if (poolingMapStr.ContainsKey(keyStr))
        {
            Stack<object> pool = poolingMapStr[keyStr] as Stack<object>;
            pool.Push(value);
        }
        else
        {
            Stack<object> pool = new Stack<object>();
            pool.Push(value);
            poolingMapStr.Add(keyStr, (object)pool);
        }
    }
}
