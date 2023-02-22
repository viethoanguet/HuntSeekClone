using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Newtonsoft.Json;

public class DataManager : MonoBehaviour
{
    public static DataManager instance;
    public Action<int> GoldCallback;
    public AssetManager assetManager;
 

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);
        }
        LoadUserData();
    }
    public UserData userData { get; set; }
    public LevelData levelData { get; set; }
    private void LoadUserData()
    {
        string json = PlayerPrefs.GetString("USERDATA");
        if (!string.IsNullOrEmpty(json))
        {
            userData = JsonUtility.FromJson<UserData>(json);
        }
        else
        {
            userData = new UserData();
            SaveUserData();

        }
    }
    public void SaveUserData()
    {
        string json = JsonUtility.ToJson(userData);
        PlayerPrefs.SetString("USERDATA", json);
    }
    public void LoadLevelData()
    {
        string levelcurrent = PlayerPrefs.GetString("LEVEL");
        if (!string.IsNullOrEmpty(levelcurrent))
        {
            levelData = JsonUtility.FromJson<LevelData>(levelcurrent);
        }
        else
        {
            levelData = new LevelData();
            SaveLevelData();
        }
    }
    public void SaveLevelData()
    {
        string levelcurrent = JsonUtility.ToJson(levelData);
        PlayerPrefs.SetString("LEVEL", levelcurrent);
    }
    public void UpLevel()
    {
        userData.level = userData.level + 1;
        //Mathf.Min(userData.level + 1, assetManager.gameManagers.Count - 1);
        SaveUserData();
        LoadLevelData();
    }
    public void UpSkin()
    {
        userData.currentCharacterID = userData.currentCharacterID + 1;
        SaveUserData();
    }    
    public void AddCoin(int coin)
    {
        if (userData.coin + coin >= 0)
        {
            int currentGold = userData.coin;
            int gold = userData.coin + coin;
            userData.coin += coin;
            SaveUserData();
            DOTween.To(() => { return currentGold; }, (a) =>
            {
                currentGold = a;
                GoldCallback?.Invoke(currentGold);
            }, gold, 2f).OnComplete(() =>
            {
                GoldCallback?.Invoke(userData.coin);
            });
        }
    }


    public bool IsSoundOn()
    {
        return PlayerPrefs.GetInt("SOUND", 1) == 1;
    }
    public bool IsMusicOn()
    {
        return PlayerPrefs.GetInt("MUSIC", 1) == 1;
    }
    public bool IsVibrationOn()
    {
        return PlayerPrefs.GetInt("VIBRATION", 1) == 1;
    }
    public void TurnSound()
    {
        PlayerPrefs.SetInt("SOUND", IsSoundOn() ? 0 : 1);
    }
    public void TurnMusic()
    {
        PlayerPrefs.SetInt("MUSIC", IsMusicOn() ? 0 : 1);
    }
    public void TurnVibration()
    {
        PlayerPrefs.SetInt("VIBRATION", IsVibrationOn() ? 0 : 1);
    }


    [System.Serializable]
    public class UserData
    {
        public int coin = 200;
        public int level = 0;
       public int currentCharacterID = 0;
    }
    public class LevelData
    {
        public int level = 0;
    }
   

}
