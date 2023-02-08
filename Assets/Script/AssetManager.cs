using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "HuntSeek/AssetManager", menuName = "AssetManager")]
public class AssetManager : ScriptableObject
{
    public List<PlayerController> playerCharacters = new List<PlayerController>();
    public List<GameObject> gameManagers = new List<GameObject>();


}
