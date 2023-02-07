using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Newtonsoft.Json;

public class DataManager :MonoBehaviour
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
    }
    public UserData userData { get; set; }
    public  void OnAwake()
    {
        LoadUserData();
       // LoadLevelData();
    }

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
            if (userData.unlockedCharacterIDs.Count == 0)
            {
                userData.currentCharacterID = 0;
                userData.unlockedCharacterIDs.Add(0);
                SaveUserData();
            }
        }
    }
    public void SaveUserData()
    {
        string json = JsonUtility.ToJson(userData);
        PlayerPrefs.SetString("USERDATA", json);
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

    [System.Serializable]
    public class UserData
    {
        public int coin = 20;
        public int level = 0;
        public bool removeAds = false;
        public string userName = "UnknowUser";
        public int currentCharacterID = 0;
        public List<int> unlockedCharacterIDs = new List<int>();
    }

   
}
