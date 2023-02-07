using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "HuntSeek/AssetManager", menuName = "AssetManager")]
public class AssetManager : ScriptableObject
{
    public List<PlayerController> playerCharacters = new List<PlayerController>();

  //  public List<Character> enemyCharacters_lv1 = new List<Character>();
 //   public List<Character> enemyCharacters_lv2 = new List<Character>();
  //  public List<Character> enemyCharacters_lv3 = new List<Character>();

  /*  public Character GetEnemyLv1()
    {
        return enemyCharacters_lv1[Random.Range(0, enemyCharacters_lv1.Count)];
    }
    public Character GetEnemyLv2()
    {
        return enemyCharacters_lv2[Random.Range(0, enemyCharacters_lv2.Count)];
    }
    public Character GetEnemyLv3()
    {
        return enemyCharacters_lv3[Random.Range(0, enemyCharacters_lv3.Count)];
    }*/
}
