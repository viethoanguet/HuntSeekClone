using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
public class PopupSetting : MonoBehaviour
{
    public Button btnRateUs;
    public SettingItem audioSetting;
    public SettingItem musicSetting;
    public SettingItem vibrateSetting;
    public Button btnClose;

    public void OnClose()
    {
        gameObject.SetActive(false);
    }    
    public void OnclickAudio()
    {
        DataManager.instance.TurnSound();
        audioSetting.UpdateStatus(DataManager.instance.IsSoundOn());
    }
    public void OnclickMusic()
    {
        DataManager.instance.TurnMusic();
        musicSetting.UpdateStatus(DataManager.instance.IsMusicOn());
    }
    public void OnclickVibration()
    {
        DataManager.instance.TurnVibration();
        vibrateSetting.UpdateStatus(DataManager.instance.IsVibrationOn());
    }
}

