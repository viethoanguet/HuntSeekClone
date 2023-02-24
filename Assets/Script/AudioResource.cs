using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioResource : ScriptableObject
{
    [Header("Loading")]
    public Sound loading;
    
    [Space, Header("Game Menu")]
    public Sound audioBgGameMenu;
    
    [Space, Header("Game Play")]
    public Sound audioGameWin;
    public Sound audioGameLose;
    public Sound audioCoin;
    public Sound audioBossRun;
    public Sound audioBossSmile;
    public Sound audioDoor;
    public Sound audioPlayerDeath;
    public Sound audioAiDeath;
    public Sound audioBossAttack;
    
    [System.Serializable]
    public class Sound
    {
        public AudioClip audioClip;
        [Range(0, 1)] public float volume = 1;
    }
}
