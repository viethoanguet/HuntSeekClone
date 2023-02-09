using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EffectManager : MonoBehaviour
{
    public static EffectManager Instance;
    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
    }
    [Header("Effect")]



    public Effect hplose; 

    public void SpawnWhiteEffect(Vector3 pos, Transform parent)
    {
       SpawnEffect("White", hplose, pos, parent);
    }


    private void SpawnEffect(string name, Effect effectPrefab, Vector3 pos, Transform parent = null, Quaternion rot = default(Quaternion))
    {
        Effect effect = ObjectPool.Get<Effect>(name);
        if (effect == null)
        {
            effect = Instantiate(effectPrefab, parent == null ? transform : parent);
        }
        if (parent != null) effect.transform.SetParent(parent);
        effect.transform.position = pos;
        if (rot != default(Quaternion))
            effect.transform.rotation = rot;
        effect.gameObject.SetActive(true);
        effect.Init(name);
    }
}
